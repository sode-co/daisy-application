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

        public void CreateProjectAndWorkspace (int jobApplicationId, bool isAllowedPublic, string projectStatus, string requestStatus, string parentRequestStatus)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            JobApplication job = _dbContext.JobApplications
                            .Include(j => j.Request)
                            .Include(j => j.Freelancer)
                            .FirstOrDefault(j => j.Id == jobApplicationId);
            Request req = _dbContext.Requests
                        .Include(r => r.Customer)
                        .Include(r => r.Category)
                        .Include(r => r.Items)
                        .FirstOrDefault(r => r.Id == job.Request.Id);
            Project pro = new Project()
            {
                Customer = req.Customer,
                Freelancer = job.Freelancer,
                Category = req.Category,
                Data = job.Data,
                PreferredLanguage = job.PreferredLanguage,
                Name = req.Title,
                Description = req.Description,
                Timeline = job.Timeline,
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

        public void DeactivateProject (int projectId, string projectStatus)
        {
            using var transaction = _dbContext.Database.BeginTransaction();
            Project pro = _dbContext.Projects.Find(projectId);
            pro.Status = projectStatus;
            _dbContext.Projects.Update(pro);
            _dbContext.SaveChanges();
            transaction.Commit();
        }
    }
}
