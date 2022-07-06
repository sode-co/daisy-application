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
        Request GetRequest(int id);
        void CreateRequest(Request request);
        void UpdateRequest(Request request);
        void DeleteRequest(Request request);
        IEnumerable<Request> GetRequestsByTitle(string title);
        IEnumerable<Request> GetRequestsByTitleAndEmail(string title, string email);
        IEnumerable<Request> GetRequestsByCustomerEmail(string email);
        IEnumerable<Request> RequestPaging(DateTime timeOffset, int count);
    }
}
