using System;
using System.Linq;
using System.Threading.Tasks;
using Daisy;
using DataAccess.UnitOfWork;
using Grpc.Core;
using Utils;
using static Daisy.RequestService;

namespace GrpcServices.Services
{
	public class RequestService : RequestServiceBase
	{
        private UnitOfWorkFactory _unitOfWorkFactory;

        public RequestService(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }

        public override async Task CreateRequestStreaming(CreateRequestStreamingRequestModel request, IServerStreamWriter<CreateRequestStreamingResponseModel> responseStream, ServerCallContext context)
        {
            int count = 0;
            DateTime currentTimeline = DateTime.UnixEpoch.AddMilliseconds(request.TimeOffset);
            Console.WriteLine("currentTimeline" + currentTimeline);
            while (!context.CancellationToken.IsCancellationRequested && count < 2)
            {
                using var work = _unitOfWorkFactory.Get;
                var requests = work.RequestRepository.RequestPaging(currentTimeline, 2)
                    .Select(request => new Request() {
                        Id = request.Choose(request => request.Id),
                        CreatedAt = (long)request.CreatedAt.ConvertToMilliseconds(),
                        ObjectId = request.ObjectId,
                        Customer = new User()
                        {
                            Id = request.Customer.Id,
                            Email = request.Customer.Email,
                            Phone = request.Customer.Phone,
                            DisplayName = request.Customer.DisplayName,
                            LastName = request.Customer.LastName,
                            FirstName = request.Customer.FirstName,
                            Role = request.Customer.Role,
                            Avatar = request.Customer.Avatar,
                            Address = request.Customer.Address
                        },
                        Category = new Category()
                        {
                            Id = request.Category.Id,
                            ObjectId = request.Category.ObjectId,
                            Name = request.Category.Name,
                            Type = request.Category.Type
                        },
                        Title = request.Title,
                        Description = request.Description.Or(""),
                        Budget = (float)request.Budget.Or(0),
                        Timeline = (long)request.Timeline.Choose(date => date.ConvertToMilliseconds()),
                        Status = request.Status
                    })
                    .ToList();

                if (requests.Count() == 0) break;

                currentTimeline = DateTime.UnixEpoch.AddMilliseconds(requests.Last().Timeline);

                await responseStream.WriteAsync(new CreateRequestStreamingResponseModel()
                    .Apl(x => x.Requests.Add(requests)));
            }
        }
    }
}

