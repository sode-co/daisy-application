using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Requests
{
    public interface IRequestRepository : IRepository<Request>
    {
        void CreateRequest(Request request);
        IEnumerable<Request> GetRequestsByTitle(string title);
        IList<Request> GetRequestsByCustomerEmail(string email);
        IEnumerable<Request> RequestPaging(DateTime timeOffset, int count);
    }
}
