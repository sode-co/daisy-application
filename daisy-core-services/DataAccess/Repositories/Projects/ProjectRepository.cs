using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Projects
{
    public class ProjectRepository : Repository<Project>, IProjectRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public ProjectRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
