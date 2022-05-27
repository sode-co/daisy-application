using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Grpc.Core;
using Healthcheck;
using Microsoft.Extensions.Logging;
using static Healthcheck.HealthCheckService;

namespace GrpcServices
{
    public class HealthCheckServiceImp : HealthCheckServiceBase
    {
        public override Task<HealthCheckResponse> Check(HealthCheckRequest request, ServerCallContext context)
        {
            string message = "Ok";
            HealthCheckResponse response = new HealthCheckResponse() { Message = message };
            return Task.FromResult(response);
        }
    }
}
