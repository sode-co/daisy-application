using System;
using System.IO;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.GridFS;
using Utils;

namespace Api.Controllers.resource
{
    [Route("socket.io")]
    public partial class UploadResourceController : ControllerBase
    {
        [HttpGet("")]
        public async Task IndexAsync()
        {
            var config = Config.Get();
            if (HttpContext.WebSockets.IsWebSocketRequest)
            {
                using WebSocket webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
                var buffer = new byte[1024 * 4];
                var receiveResult = await webSocket.ReceiveAsync(
                    new ArraySegment<byte>(buffer), CancellationToken.None);
                var client = new MongoClient(
                    $"mongodb+srv://{config.MONGO_DB_USER}:{config.MONGO_DB_PASSWORD}@{config.MONGO_DB_HOST}:{config.MONGO_DB_PORT}/admin?w=majority"
                );
                var database = client.GetDatabase(config.MONGO_DB_NAME);
                var bucket = new GridFSBucket(database, new GridFSBucketOptions
                {
                    BucketName = "resources",
                    ChunkSizeBytes = 1024 * 4, // 1MB
                    ReadPreference = ReadPreference.Secondary
                });

                using var stream = await bucket.OpenUploadStreamAsync("image1.png") ;
                while (!receiveResult.CloseStatus.HasValue)
                {

                    var id = stream.Id; // the unique Id of the file being uploaded

                    var data = new ArraySegment<byte>(buffer, 0, receiveResult.Count).ToArray();
                    stream.Write(data, 0, data.Length);

                    await webSocket.SendAsync(Encoding.UTF8.GetBytes("ok"),
                        WebSocketMessageType.Text, true, CancellationToken.None);
                }
            }
            else
            {
                HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
            }
        }
    }
}

