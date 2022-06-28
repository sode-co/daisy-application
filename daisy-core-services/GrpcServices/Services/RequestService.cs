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
            int countPerRate = request.Count / request.Rate;
            Console.WriteLine("Start streaming request model to client with rate: " + request.Rate + " and Count " + request.Count);
            DateTime currentTimeline = DateTime.UnixEpoch.AddMilliseconds(request.TimeOffset);
            while (!context.CancellationToken.IsCancellationRequested && count < request.Rate)
            {
                count++;
                using var work = _unitOfWorkFactory.Get;
                var requests = work.RequestRepository.RequestPaging(currentTimeline, countPerRate)
                    .Select(request => new Request() {
                        Id = request.Choose(request => request.Id),
                        CreatedAt = (long)request.CreatedAt.ConvertToMilliseconds(),
                        ObjectId = request.ObjectId,
                        Customer = new User()
                        {
                            Id = request.Customer.Id,
                            Email = request.Customer.Email,
                            Phone = request.Customer.Phone.Or(""),
                            DisplayName = request.Customer.DisplayName.Or(""),
                            LastName = request.Customer.LastName.Or(""),
                            FirstName = request.Customer.FirstName.Or(""),
                            Role = request.Customer.Role,
                            Avatar = request.Customer.Avatar,
                            Address = request.Customer.Address.Or("")
                        },
                        Category = new Category()
                        {
                            Id = request.Category.Id,
                            ObjectId = request.Category.ObjectId,
                            Name = request.Category.Name,
                            Type = request.Category.Type
                        },
                        Title = request.Title.Or(""),
                        Description = request.Description.Or(""),
                        Budget = (float)request.Budget. Or(0),
                        Timeline = (long)request.Timeline.Choose(date => date.ConvertToMilliseconds()),
                        Status = request.Status
                    })
                    .ToList();

                Console.WriteLine("Streaming " + requests.Count() + "request models to client");

                if (requests.Count() == 0) break;

                currentTimeline = DateTime.UnixEpoch.AddMilliseconds(requests.Last().CreatedAt);
                Console.WriteLine("currentTimeline" + currentTimeline);

                await responseStream.WriteAsync(new CreateRequestStreamingResponseModel()
                    .Apl(x => x.Requests.Add(requests)));
            }
        }
    }
}

