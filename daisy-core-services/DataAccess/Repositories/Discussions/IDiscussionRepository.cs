using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Discussions
{
    public interface IDiscussionRepository : IRepository<Discussion>
    {
        public void RemoveDiscussion(int workspaceId, int discussionId, string discussionStatus);
        public void CreateDiscussion(Discussion discussion);
        public Discussion GetDiscussion(int id);
        public IEnumerable<Discussion> GetDiscussions();
        public void UpdateDiscussion(Discussion discussion);
    }
}
