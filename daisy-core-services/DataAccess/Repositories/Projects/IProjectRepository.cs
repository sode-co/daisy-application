using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Projects
{
    public interface IProjectRepository : IRepository<Project>
    {
        public IEnumerable<Project> GetProjectsByStatus(int customerId, IQueryable<Project> projectList, string projectStatus);
        public void CreateProjectAndWorkspace(int jobApplicationId, bool isAllowedPublic, string projectStatus, string requestStatus, string parentRequestStatus, int loginUserId);
        public void DeactivateProject(int projectId, string projectStatus, string requestStatus, int loginUserId);
    }
}
