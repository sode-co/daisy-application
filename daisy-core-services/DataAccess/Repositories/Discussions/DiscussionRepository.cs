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


        public IEnumerable<Discussion> DiscussionPaging(DateTime timeOffset, int count) =>
            GetAll((discussion => discussion.CreatedAt < timeOffset), null, "Sender,Workspace")
                .OrderByDescending(request => request.CreatedAt)
                .Take(count)
                .ToList();
    }
}
