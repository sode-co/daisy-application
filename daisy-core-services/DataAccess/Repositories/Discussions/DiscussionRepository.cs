using DataAccess.MssqlServerIntegration;
using Domain.Models;
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
    }
}
