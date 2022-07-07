using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;
using Utils.Models;


namespace DataAccess.Repositories.Requests
{
    public class RequestRepository : Repository<Request>, IRequestRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public RequestRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateRequest(Request request)
        {
            _dbContext.Requests.Add(request);
        }

        public Request GetRequest(int id)
        {
            return _dbContext.Requests.Find(id);
        }

        public void UpdateRequest(Request request)
        {
            _dbContext.Requests.Update(request);
            _dbContext.SaveChanges();
        }

        public void DeleteRequest(Request request)
        {
            request.DeletedAt = DateTime.Now;
            _dbContext.Requests.Update(request);
            _dbContext.SaveChanges();
        }

        public IEnumerable<Request> GetRequestsByTitle(string title) => _dbContext.Requests.Where(req => req.Title.Contains(title) && req.DeletedAt == null);

        public IEnumerable<Request> GetRequestsByTitleAndEmail(string title, string email) => _dbContext.Requests.Include(req => req.Customer).Where(req => (req.Title.Contains(title) && req.Customer.Email.Equals(email) && req.DeletedAt == null));

        public IEnumerable<Request> GetRequestsByCustomerEmail(string email)
        {
            return _dbContext.Requests.Include(req => req.Customer).Where(req => req.Customer.Email.Equals(email) && req.DeletedAt == null);
        }

        public IEnumerable<Request> RequestPaging(DateTime timeOffset, int count) =>
            GetAll((request => request.CreatedAt < timeOffset), null, "Customer,Category")
                .OrderByDescending(request => request.CreatedAt)
                .Take(count)
                .ToList();

        public IEnumerable<Request> GetRequestsDesignerHasntAppliedYet(string designerEmail)
        {
            User designer = _dbContext.Users.ToList().FirstOrDefault(user => user.Email.Equals(designerEmail));
            List<JobApplication> appliedJobs = _dbContext.JobApplications.Include(jobApplication => jobApplication.Request).Where(jobApplication => jobApplication.Freelancer.Equals(designer) && jobApplication.DeletedAt == null).ToList();
            List<Request> appliedRequests = appliedJobs.Select((job) => job.Request).ToList();
            List<Request> allRequests = _dbContext.Requests.Where(req => req.DeletedAt == null).ToList();
            return _dbContext.Requests.Where(req => !appliedRequests.Contains(req)).ToList();
        }
    }
}
