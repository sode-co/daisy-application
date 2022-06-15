using System;
using System.IO;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.resource
{
    [Route("socket.io")]
    public partial class UploadResourceController : ControllerBase
    {
        [HttpGet("")]
        public async Task IndexAsync()
        {
            if (HttpContext.WebSockets.IsWebSocketRequest)
            {
                using WebSocket webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
                var buffer = new byte[1024 * 4];
                var receiveResult = await webSocket.ReceiveAsync(
                    new ArraySegment<byte>(buffer), CancellationToken.None);

                while (!receiveResult.CloseStatus.HasValue)
                {
                    var data = new ArraySegment<byte>(buffer, 0, receiveResult.Count).ToArray();
                    using var stream = new FileStream("/Users/minhtiendang/cached/image1.png", FileMode.Append);
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

