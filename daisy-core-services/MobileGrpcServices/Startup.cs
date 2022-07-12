using System.IdentityModel.Tokens.Jwt;
using DataAccess.UnitOfWork;
using GrpcServices;
using GrpcServices.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Utils;

namespace MobileGrpcServices
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            Config.Load();
            services.AddSingleton<UnitOfWorkFactory>();
            services.AddGrpc();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            Config.AdaptEnv(env.EnvironmentName);
            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<HealthCheckServiceImp>().EnableGrpcWeb();
                endpoints.MapGrpcService<UploadFileService>().EnableGrpcWeb();
                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");
                });
            });
        }
    }
}
