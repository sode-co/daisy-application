using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Resources
{
    public class ResourceRepository : Repository<Resource>, IResourceRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public ResourceRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
