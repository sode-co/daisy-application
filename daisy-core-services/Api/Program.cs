﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Utils;

namespace Api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args)
        {
            Config.Load();
            return Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder
                    .UseUrls($"{Config.Get().PROTOCOL}://{Config.Get().API_HOST}:{Config.Get().API_PORT}")
                    .UseIISIntegration();
                    webBuilder.UseStartup<Startup>();
                })
                .ConfigureAppConfiguration((hostingContext, config) =>
                {
                    var env = hostingContext.HostingEnvironment;

                    var sharedFolder = Path.Combine(env.ContentRootPath, "..", "shared");

                    config
                        .AddJsonFile(Path.Combine(sharedFolder, "appsettings.json"), optional: true);

                    config.AddEnvironmentVariables();
                });
        }
    }
}
