using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Workspaces
{
    public interface IWorkspaceRepository : IRepository<Workspace>
    {
        void CreateWorkspace(Workspace workspace);
        Workspace GetWorkspace(int id);
        IEnumerable<Workspace> GetWorkspaces();
        void DeleteWorkspace(Workspace workspace);
        void DeleteWorkspacePermanently(Workspace workspace);
        void UpdateWorkspace(Workspace workspace);
        IEnumerable<Workspace> GetWorkspaceByCustomerId(int customerId);
    }
}
