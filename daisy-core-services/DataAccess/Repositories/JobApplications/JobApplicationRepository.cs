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
    }
}
