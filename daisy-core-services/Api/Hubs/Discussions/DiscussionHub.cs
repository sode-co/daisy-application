using System;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Utils;

namespace Api.Hubs.Discussions
{
	public class DiscussionHub : Hub
	{
		private UnitOfWorkFactory _unitOfWorkFactory;

		public DiscussionHub(UnitOfWorkFactory unitOfWorkFactory)
		{
			_unitOfWorkFactory = unitOfWorkFactory;
		}

		public async Task SendMessage(String json)
        {
            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Ignore,
                MissingMemberHandling = MissingMemberHandling.Ignore
            };

            var discussion = JsonConvert.DeserializeObject<Discussion>(json, settings);
			var key = $"discussion-workspace-{discussion.Workspace.Id}";

            using var savingDiscussionWork = _unitOfWorkFactory.Get;
            discussion.Sender = savingDiscussionWork.UserRepository.Get(discussion.Sender.Id);
            discussion.Workspace = savingDiscussionWork.WorkspaceRepository.Get(discussion.Workspace.Id);
            savingDiscussionWork.DiscussionRepository.Add(discussion);
            savingDiscussionWork.Save();

            await Clients.All.SendAsync(key, JsonConvert.SerializeObject(discussion, Formatting.Indented, new JsonSerializerSettings
            {
                ContractResolver = new StandardizeJsonConverter.LowercaseContractResolver(),
                PreserveReferencesHandling = PreserveReferencesHandling.Objects,
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            }));
        }
	}
}

