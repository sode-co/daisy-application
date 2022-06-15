using System;
using System.IO;
using System.Threading.Tasks;
using Domain.Models;
using Filetransfer;
using Google.Protobuf;
using Grpc.Core;
using Microsoft.AspNetCore.Mvc;
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
                while(await requestStream.MoveNext())
                {
                    using (var stream = new FileStream("/Users/minhtiendang/cached/image1.png", FileMode.Append))
                    {
                        var length = requestStream.Current.Content.Length;
                        stream.Write(requestStream.Current.Content.ToByteArray(), 0, length);
                    };
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

        public override async Task Download(DownloadRequestModel request, IServerStreamWriter<DownloadModel> responseStream, ServerCallContext context)
        {
            for (int i = 0; i < 10; i++)
            {
                _ = responseStream.WriteAsync(new DownloadModel()
                {
                    Status = new TransferStatus() { Status = Filetransfer.Status.Success, Message = "ok" },
                    Data = new Chunk() { Content = ByteString.CopyFrom(File.ReadAllBytes("/image/image"+i+".png"))}
                });
            }
        }
    }
}
