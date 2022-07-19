using System;
using System.Linq;
using System.Threading.Tasks;
using Daisy;
using DataAccess.UnitOfWork;
using Grpc.Core;
using Utils;
using static Daisy.DiscussionService;

namespace GrpcServices.Services
{
	public class DiscussionService : DiscussionServiceBase
	{
        private UnitOfWorkFactory _unitOfWorkFactory;

        public DiscussionService(UnitOfWorkFactory factory)
        {
            _unitOfWorkFactory = factory;
        }

        public override async Task FetchDiscussions(FetchDiscussionRequestModel request, IServerStreamWriter<FetchDiscussionResponseModel> responseStream, ServerCallContext context)
        {
            int count = 0;
            int countPerRate = request.Count / request.Rate;
            Console.WriteLine("Start streaming discussion model to client with rate: " + request.Rate + " and Count " + request.Count);
            DateTime currentTimeline = DateTime.UnixEpoch.AddMilliseconds(request.TimeOffset);
            while (!context.CancellationToken.IsCancellationRequested && count < request.Rate)
            {
                count++;
                using var work = _unitOfWorkFactory.Get;
                var discussions = work.DiscussionRepository.DiscussionPaging(currentTimeline, countPerRate)
                    .Select(discussion => new Discussion()
                    {
                        CreatedAt = (long)discussion.CreatedAt.ConvertToMilliseconds(),
                        Id = discussion.Id,
                        ObjectId = discussion.ObjectId,
                        Type = discussion.Type,
                        Content = discussion.Content,
                        Sender = new User()
                        {
                            Id = discussion.Sender.Id,
                            Email = discussion.Sender.Email,
                            Phone = discussion.Sender.Phone.Or(""),
                            DisplayName = discussion.Sender.DisplayName.Or(""),
                            LastName = discussion.Sender.LastName.Or(""),
                            FirstName = discussion.Sender.FirstName.Or(""),
                            Role = discussion.Sender.Role,
                            Avatar = discussion.Sender.Avatar,
                            Address = discussion.Sender.Address.Or("")
                        },
                        Workspace = new Workspace()
                        {
                            Id = discussion.Workspace.Id,
                            Status = discussion.Workspace.Status
                        }
                    })
                    .ToList();

                Console.WriteLine("Streaming " + discussions.Count() + "discussion models to client");

                if (discussions.Count() == 0) break;

                currentTimeline = DateTime.UnixEpoch.AddMilliseconds(discussions.Last().CreatedAt);
                Console.WriteLine("currentTimeline" + currentTimeline);

                await responseStream.WriteAsync(new FetchDiscussionResponseModel()
                    .Apl(x => x.Discussions.Add(discussions)));
            }
        }
    }
}

