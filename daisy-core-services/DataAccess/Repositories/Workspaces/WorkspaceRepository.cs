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

        public void CreateWorkspace(Workspace workspace)
        {
            _dbContext.Workspaces.Add(workspace);
        }

        public Workspace GetWorkspace(int id)
        {
            return _dbContext.Workspaces.Find(id);
        }

        public IEnumerable<Workspace> GetWorkspaces()
        {
            return _dbContext.Workspaces.ToList();
        }
        public void DeleteWorkspace(Workspace workspace)
        {
            workspace.DeletedAt = DateTime.Now;
            _dbContext.Workspaces.Update(workspace);
        }
        public void DeleteWorkspacePermanently(Workspace workspace)
        {
            _dbContext.Workspaces.Remove(workspace);
        }
        public void UpdateWorkspace(Workspace workspace)
        {
            _dbContext.Workspaces.Update(workspace);
        }
        public IEnumerable<Workspace> GetWorkspaceByCustomerId(int customerId)
        {
            List<Workspace> workspaceList = new();

            return workspaceList;
        }
    }
}
