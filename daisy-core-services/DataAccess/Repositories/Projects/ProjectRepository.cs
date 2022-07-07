using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
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

        public void CreateProjectAndWorkspace (int jobApplicationId, bool isAllowedPublic, string projectStatus, string requestStatus, string parentRequestStatus, int loginUserId)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            JobApplication job = _dbContext.JobApplications
                            .Include(j => j.Request)
                            .Include(j => j.Freelancer)
                            .FirstOrDefault(j => j.Id == jobApplicationId);
            if (job == null) {
                throw new Exception("Job application not found!");
            }

            List<JobApplication> appliedJobs = new List<JobApplication>();
            int? v = 2;
            int x = v.Value;
            List<Request> appliedRequests = appliedJobs.Select((job) => job.Request).ToList();

            Request req = _dbContext.Requests
                    .Include(r => r.Customer)
                    .Include(r => r.Category)
                    .Include(r => r.Items)
                    .FirstOrDefault(r => r.Id == job.Request.Id);
            if (req.Customer.Id != loginUserId)
            {
                throw new Exception("You are not the requester of this request!");
            }
            Project pro = new Project()
            {
                Customer = req.Customer,
                Freelancer = job.Freelancer,
                Category = req.Category,
                Data = job.Data,
                PreferredLanguage = job.PreferredLanguage,
                Name = req.Title,
                Description = req.Description,
                Timeline = job.Timeline ?? req.Timeline,
                Budget = req.Budget ?? job.OfferedPrice,
                IsAllowedPublic = isAllowedPublic,
                Status = projectStatus,
                Request = req,
            };
            _dbContext.Projects.Add(pro);
            _dbContext.SaveChanges();

            // int projectid = pro.Id;

            foreach (Request requestItem in req.Items)
            {
                Workspace workspace = new Workspace()
                {
                    Project = pro,
                    Request = requestItem,
                    Status = requestStatus,
                };
                _dbContext.Workspaces.Add(workspace);
                _dbContext.SaveChanges();
            }

            req.Status = parentRequestStatus;
            transaction.Commit();
        }

        public void DeactivateProject (int projectId, string projectStatus, string requestStatus, int loginUserId)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            Project pro = _dbContext.Projects.Include(p => p.Request).FirstOrDefault(p => p.Id == projectId);
            if (pro == null)
            {
                throw new Exception("Project is not found!");
            }
            Request req = _dbContext.Requests
                    .Include(r => r.Customer)
                    .Include(r => r.Items)
                    .FirstOrDefault(r => r.Id == pro.Request.Id);
            if (req.Customer.Id != loginUserId)
            {
                throw new Exception("You are not the customer of this project!");
            }
            pro.Status = projectStatus;
            foreach (Request requestItem in req.Items)
            {
                requestItem.Status = requestStatus;
                _dbContext.Requests.Update(requestItem);
            }
            req.Status = requestStatus;
            _dbContext.Projects.Update(pro);
            _dbContext.SaveChanges();
            transaction.Commit();
        }

        public IEnumerable<Project> GetProjectsByStatus(int customerId, IQueryable<Project> projectList, string projectStatus)
                    => projectList.Where(pro => pro.Customer.Id == customerId && pro.Status.Equals(projectStatus)).ToList();
    }
}
