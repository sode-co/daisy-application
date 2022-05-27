using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Grpc.Core;
using Healthcheck;
using Microsoft.AspNetCore.Hosting;
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
            // WORKAROUND: For fast setup we are not using TSL/SSL, instead we are using Insecure connection
            //CreateHostBuilder(args).Build().Run();

            try
            {
                String url = $"{Config.Get().PROTOCOL}://{Config.Get().GRPC_HOST}:{Config.Get().GRPC_PORT}";
                server = new Server()
                {
                    Ports = { new ServerPort(Config.Get().GRPC_HOST, Config.Get().GRPC_PORT, ServerCredentials.Insecure) },
                    Services = { HealthCheckService.BindService(new HealthCheckServiceImp()) }
                };

                server.Start();

                Console.WriteLine("Server is now listening on port " + url);
                Console.ReadKey();
            }
            catch (IOException ex)
            {
                Console.WriteLine("The server failed to start with error " + ex.Message);
                throw;
            }
            finally
            {
                Console.WriteLine("The server is stopping");
                server.ShutdownAsync().Wait();
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder
                    .UseUrls($"{Config.Get().PROTOCOL}://{Config.Get().GRPC_HOST}:{Config.Get().GRPC_PORT}")
                    .UseIISIntegration();
                    webBuilder.UseStartup<Startup>();
                })
            .ConfigureAppConfiguration((hostingContext, config) =>
            {
                var env = hostingContext.HostingEnvironment;
                config.AddEnvironmentVariables();
            });
    }
}
