using System;
using System.Threading.Channels;
using System.Threading.Tasks;
using Healthcheck;
using Microsoft.AspNetCore.SignalR;

namespace Api.Hubs.Requests
{
	public class RequestHub : Hub
	{
		public async Task StreamingRequests(ChannelReader<string> stream)
        {
            int id = 1;
            while (await stream.WaitToReadAsync())
            {
                while (stream.TryRead(out var item))
                {
                    // do something with the stream item
                    Console.WriteLine(item);
                    await Clients.Client(Context.ConnectionId).SendAsync("Hello " + id++);
                }
            }
        }
	}
}

