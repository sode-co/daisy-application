using System;
using System.Threading.Tasks;
using Daisy;
using DataAccess.UnitOfWork;
using Grpc.Core;
using static Daisy.ResourceService;

namespace GrpcServices.Services
{
	public class ResourceService : ResourceServiceBase
	{
		private UnitOfWorkFactory _unitOfWorkFactory;
		public ResourceService(UnitOfWorkFactory unitOfWork)
		{
			_unitOfWorkFactory = unitOfWork;
		}

        public override async Task StreamingResourceModel(StreamingResourceModelRequestModel request, IServerStreamWriter<StreamingResourceModelResponseModel> responseStream, ServerCallContext context)
        {

        }
    }
}

