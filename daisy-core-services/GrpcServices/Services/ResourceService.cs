using System;
using System.Linq;
using System.Threading.Tasks;
using Daisy;
using DataAccess.UnitOfWork;
using Grpc.Core;
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
                        File = new File()
                        {
                            FileName = resource.FileName,
                            MimeType = resource.FileType
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
    }
}

