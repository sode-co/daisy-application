using System;
using System.Net;
using Grpc.Core;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Utils;

namespace GrpcServices
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Config.Load();
            CreateWebServertBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateWebServertBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder
                    .UseUrls($"{Config.Get().PROTOCOL}://{Config.Get().GRPC_HOST}:{Config.Get().GRPC_MOBILE_PORT}")
                     .ConfigureKestrel(options =>
                     {
                         options.AddServerHeader = true;
                         options.Listen(IPAddress.Loopback, Config.Get().GRPC_MOBILE_PORT, x =>
                         {
                             x.Protocols = HttpProtocols.Http2;
                         });
                     })
                    .UseIISIntegration()
                    .UseStartup<Startup>();

                })
            .ConfigureAppConfiguration((hostingContext, config) =>
            {
                var env = hostingContext.HostingEnvironment;
                config.AddEnvironmentVariables();
            });
    }
}
