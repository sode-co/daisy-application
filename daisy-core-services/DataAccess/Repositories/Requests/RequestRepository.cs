using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

        public IEnumerable<RequestVM> GetRequestsByCategoryId(int categoryId)
        {
            List<RequestVM> requestVMs = new List<RequestVM>();
            _dbContext.Requests.Where(req => req.Category.Id == categoryId).ToList().ForEach(reqObj => requestVMs.Add(new RequestVM()
            {
                description = reqObj.Description,
                status = reqObj.Status,
                title = reqObj.Title,
                categoryId = reqObj.Category.Id
            }));
            return requestVMs;
        }

        public IEnumerable<Request> GetRequestsByTitle(string title) => _dbContext.Requests.Where(req => req.Title.Equals(title)).ToList();
    }
}
