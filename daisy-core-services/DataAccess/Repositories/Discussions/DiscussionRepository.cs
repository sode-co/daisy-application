using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Discussions
{
    public class DiscussionRepository : Repository<Discussion>, IDiscussionRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public DiscussionRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void RemoveDiscussion(int workspaceId, int discussionId, string discussionStatus)
        {
            Discussion dis = _dbContext.Discussions
                .Include(d => d.Workspace)
                .FirstOrDefault(d => d.Id == discussionId);
            if (workspaceId == dis.Workspace.Id)
            {
                dis.Status = discussionStatus;
                _dbContext.Discussions.Update(dis);
                _dbContext.SaveChanges();
            }
        }

        public void CreateDiscussion(Discussion discussion)
        {
            _dbContext.Discussions.Add(discussion);
        }

        public Discussion GetDiscussion(int id)
        {
            return _dbContext.Discussions.Find(id);
        }

        public IEnumerable<Discussion> GetDiscussions()
        {
            return _dbContext.Discussions.ToList();
        }

        public void UpdateDiscussion(Discussion discussion)
        {
            _dbContext.Discussions.Update(discussion);
        }

    }
}
