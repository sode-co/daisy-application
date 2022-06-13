using System;
using System.IO;
using System.Threading.Tasks;
using Filetransfer;
using Grpc.Core;
using static Filetransfer.UploadService;

namespace GrpcServices.Services
{
    public class UploadFileService : UploadServiceBase
    {
        public override async Task<TransferStatus> Upload(IAsyncStreamReader<Chunk> requestStream, ServerCallContext context)
        {
            Console.WriteLine("Start streaming");

            var response = new TransferStatus();
            try
            {
                using var stream = new FileStream("/Users/tiendang/grpc_cached/image1.png", FileMode.Append);

                while (await requestStream.MoveNext())
                {
                    var length = requestStream.Current.Content.Length;
                    Console.WriteLine("Client file streaming " + length);
                    stream.Write(requestStream.Current.Content.ToByteArray(), 0, length);
                    response.Status = Filetransfer.Status.Success;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to upload file with error " + ex.Message);
                response.Status = Filetransfer.Status.Failed;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
