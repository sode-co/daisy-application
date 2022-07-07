using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.JobApplications
{
    public class JobApplicationRepository : Repository<JobApplication>, IJobApplicationRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public JobApplicationRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateJobApplication(JobApplication jobApplication)
        {
            _dbContext.JobApplications.Add(jobApplication);
        }
        public void UpdateJobApplication(JobApplication jobApplication)
        {
            _dbContext.JobApplications.Update(jobApplication);
        }
        public void DeleteJobApplication(JobApplication jobApplication)
        {
            jobApplication.DeletedAt = DateTime.Now;
            _dbContext.JobApplications.Update(jobApplication);
        }

    }
}
