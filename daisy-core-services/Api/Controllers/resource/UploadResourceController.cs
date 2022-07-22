using System;
using System.ComponentModel.DataAnnotations;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MongoDB.Driver;
using MongoDB.Driver.GridFS;
using Utils;
using static Api.Common.Constants;

namespace Api.Controllers.resource
{
    public partial class UploadResourceController : ControllerBase
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public UploadResourceController(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet("/ws/upload-resource/workspace/{workspaceId}")]
        public async Task IndexAsync(
            [Required][FromRoute] int workspaceId,
            [Required][FromQuery] String fileName,
            [Required][FromQuery] String fileType)
        {
            var config = Config.Get();
            if (HttpContext.WebSockets.IsWebSocketRequest)
            {
                using WebSocket webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
                var buffer = new byte[1024 * 45]; // 4KB
                var receiveResult = await webSocket.ReceiveAsync(
                    new ArraySegment<byte>(buffer), CancellationToken.None);

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

                using var stream = await bucket.OpenUploadStreamAsync(fileName, null);
                var resourceKey = stream.Id;
                long fileSize = 0;
                while (!receiveResult.CloseStatus.HasValue)
                {
                    var data = new ArraySegment<byte>(buffer, 0, receiveResult.Count).ToArray();
                    await stream.WriteAsync(data, 0, data.Length);
                    fileSize += data.Length;
                    await webSocket.SendAsync(Encoding.UTF8.GetBytes("ok"),
                        WebSocketMessageType.Text, true, CancellationToken.None);
                    receiveResult = await webSocket.ReceiveAsync(
                        new ArraySegment<byte>(buffer), CancellationToken.None);
                }

                var newResource = new Resource() {
                    ResourceKey = resourceKey + "",
                    FileType = fileType,
                    FileSize = fileSize,
                    FileName = fileName,
                    Workspace = new Workspace() { Id = workspaceId},
                    WorkStatus = RESOURCE_WORK_STATUS.IN_PROGRESS
                };

                using var work = _unitOfWorkFactory.Get;
                newResource.Workspace = work.WorkspaceRepository.Get(workspaceId);
                work.ResourceRepository.Add(newResource);
                work.Save();
            }
            else
            {
                HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
            }
        }
    }
}

