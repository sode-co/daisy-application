using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess.UnitOfWork;
using GrpcServices.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Utils;

namespace GrpcServices
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc();
            services.AddSingleton<UnitOfWorkFactory>();
            services.AddCors(o => o.AddPolicy("AllowAll", builder =>
           {
               builder
                   .AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
           }));

        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            Config.Load(Configuration);

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            Config.AdaptEnv(env.EnvironmentName);
            app.UseRouting();
            app.UseGrpcWeb();
            app.UseCors("AllowAll");
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<HealthCheckServiceImp>().EnableGrpcWeb().RequireCors("AllowAll");
                endpoints.MapGrpcService<RequestService>().EnableGrpcWeb().RequireCors("AllowAll");
                endpoints.MapGrpcService<ResourceService>().EnableGrpcWeb().RequireCors("AllowAll"); ;
                endpoints.MapGrpcService<HealthCheckServiceImp>().EnableGrpcWeb().RequireCors("AllowAll"); ;
                endpoints.MapGrpcService<DiscussionService>().EnableGrpcWeb().RequireCors("AllowAll"); ;
                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");
                });
            });
        }
    }
}
