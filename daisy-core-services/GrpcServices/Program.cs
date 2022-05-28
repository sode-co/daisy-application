using System;
using System.IO;
using System.Net;
using Grpc.Core;
using Healthcheck;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Utils;

namespace GrpcServices
{
    public class Program
    {
        private static Server server;

        public static void Main(string[] args)
        {
            Config.Load();
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    //WORKAROUND: To allow Network.insecure connection, we need to setup cert in the future and remove these lines
                    webBuilder
                    .UseUrls($"{Config.Get().PROTOCOL}://{Config.Get().GRPC_HOST}:{Config.Get().GRPC_PORT}")
                    .UseIISIntegration();
                    webBuilder.UseStartup<Startup>();
                    //.UseKestrel(options =>
                    //{

                    //    IPAddress validIp;
                    //    IPAddress.TryParse("10.0.2.2", out validIp);
                    //    options.Listen(validIp, Config.Get().GRPC_PORT, x =>
                    //    {
                    //        x.Protocols = HttpProtocols.Http2;
                    //    });
                    //});
                })
            .ConfigureAppConfiguration((hostingContext, config) =>
            {
                var env = hostingContext.HostingEnvironment;
                config.AddEnvironmentVariables();
            });
    }
}
