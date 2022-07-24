using System;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Daisy;
using DataAccess.UnitOfWork;
using Grpc.Core;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.GridFS;
using Utils;
using static Daisy.ResourceService;

namespace GrpcServices.Services
{
	public class ResourceService : ResourceServiceBase
	{
		private UnitOfWorkFactory _unitOfWorkFactory;
		public ResourceService(UnitOfWorkFactory unitOfWork)
		{
			_unitOfWorkFactory = unitOfWork;
		}

        public override async Task StreamingResourceModel(StreamingResourceModelRequestModel request, IServerStreamWriter<StreamingResourceModelResponseModel> responseStream, ServerCallContext context)
        {
            int count = 0;
            int countPerRate = request.Count / request.Rate;
            Console.WriteLine($"Start streaming resources model to client with rate: " +
                $"{request.Rate}, count: {request.Count}, workspaceId {request.WorkspaceId}," +
                $"workstatus: {request.WorkStatus} ");
            DateTime currentTimeline = DateTime.UnixEpoch.AddMilliseconds(request.TimeOffset);
            while (!context.CancellationToken.IsCancellationRequested && count < request.Rate)
            {
                count++;
                using var work = _unitOfWorkFactory.Get;
                var resources = work.ResourceRepository.ResourcePaging(currentTimeline, countPerRate, request.WorkspaceId, request.WorkStatus)
                    .Select(resource => new Resource()
                    {
                        CreatedAt = (long)resource.CreatedAt.ConvertToMilliseconds(),
                        Id = resource.Id,
                        ObjectId = resource.ObjectId,
                        ResourceKey = resource.ResourceKey,
                        WorkStatus = resource.WorkStatus,
                        File = new Daisy.File()
                        {
                            FileName = resource.FileName,
                            MimeType = resource.FileType,
                            FileSize = resource.FileSize
                        },
                        Workspace = new Workspace()
                        {
                            Id = resource.Workspace.Id,
                            Status = resource.Workspace.Status
                        }
                    })
                    .ToList();

                Console.WriteLine("Streaming " + resources.Count() + "resources models to client");

                if (resources.Count() == 0) break;

                currentTimeline = DateTime.UnixEpoch.AddMilliseconds(resources.Last().CreatedAt);
                Console.WriteLine("currentTimeline" + currentTimeline);

                await responseStream.WriteAsync(new StreamingResourceModelResponseModel()
                    .Apl(x => x.Resources.Add(resources)));
            }
        }

        public override async Task StreamingResourceFile(StreamingResourceFileRequestModel request, IServerStreamWriter<StreamingResourceFileResponseModel> responseStream, ServerCallContext context)
        {
            var config = Config.Get();
            var client = new MongoClient(
                    $"mongodb://{config.MONGO_DB_USER}:{config.MONGO_DB_PASSWORD}@{config.MONGO_DB_HOST}:{config.MONGO_DB_PORT}/admin?w=majority"
                );
            var database = client.GetDatabase(config.MONGO_DB_NAME);
            var bucket = new GridFSBucket(database, new GridFSBucketOptions
            {
                BucketName = "resources",
                ChunkSizeBytes = 1024 * 50, // 0.5MB
                ReadPreference = ReadPreference.Secondary
            });

            var tasks = request.ResourceKeys.Select(resourceKey => _writeBinary(request, responseStream, context, resourceKey, bucket));
            await Task.WhenAll(tasks);
        }

        private object _oLock;
        static SemaphoreSlim _semaphoreSlim = new SemaphoreSlim(1);

        private async Task _writeBinary(StreamingResourceFileRequestModel request,
                IServerStreamWriter<StreamingResourceFileResponseModel> responseStream,
                ServerCallContext context, String resourceKey, GridFSBucket bucket)
        {
            try
            {
                await _semaphoreSlim.WaitAsync();
                ObjectId objId = ObjectId.Parse(resourceKey);
                using var stream = await bucket.OpenDownloadStreamAsync(objId);
                var buffer = new byte[1024 * 50];
                var bytesCount = 0;

                while((bytesCount = await stream.ReadAsync(buffer, 0, buffer.Length)) > 0)
                {
                    var data = new byte[bytesCount];
                    Buffer.BlockCopy(buffer, 0, data, 0, bytesCount);
                    await responseStream.WriteAsync(new StreamingResourceFileResponseModel()
                    {
                        Status = TransferStatus.Streaming,
                        Binary = new Chunk()
                        {
                            Content = Google.Protobuf.ByteString.CopyFrom(data)
                        },
                        ResourceKey = resourceKey
                    });

                    Console.WriteLine($"Writing resource {resourceKey} with bytesCount {bytesCount}");
                }
                
                await responseStream.WriteAsync(new StreamingResourceFileResponseModel()
                {
                    Status = TransferStatus.Done,
                    Binary = new Chunk()
                    {
                        Content = Google.Protobuf.ByteString.CopyFrom(new byte[0])
                    },
                    ResourceKey = resourceKey
                });
            }
            catch (Exception ex)
            {
                await responseStream.WriteAsync(new StreamingResourceFileResponseModel()
                {
                    Status = TransferStatus.Done,
                    Binary = new Chunk()
                    {
                        Content = Google.Protobuf.ByteString.CopyFrom(new byte[0])
                    },
                    ResourceKey = resourceKey
                });
                Console.WriteLine($"Error while streaming resource {resourceKey} with error {ex.Message}, Skipping...");
            }
            finally {
                _semaphoreSlim.Release();
            }
        }
    }
}

