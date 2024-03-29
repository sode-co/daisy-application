﻿using System;
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
                    webBuilder
                    .UseUrls($"{Config.Get().PROTOCOL}://{Config.Get().GRPC_HOST}:{Config.Get().GRPC_PORT}")
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
