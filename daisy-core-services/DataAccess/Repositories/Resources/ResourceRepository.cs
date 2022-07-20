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

        public IEnumerable<Resource> ResourcePaging(DateTime timeOffset, int count, int workId, string workStatus)
        {
            return GetAll((resource => resource.CreatedAt < timeOffset &&
                            resource.Workspace.Id == workId &&
                            workStatus.Equals(resource.WorkStatus)),
                          null, "Workspace")
                .OrderByDescending(resource => resource.CreatedAt)
                .Take(count)
                .ToList();
        }
    }
}
