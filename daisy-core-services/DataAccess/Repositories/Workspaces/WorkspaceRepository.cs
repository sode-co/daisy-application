using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Workspaces
{
    public class WorkspaceRepository : Repository<Workspace>, IWorkspaceRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public WorkspaceRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
