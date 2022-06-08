using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils.Models;

namespace DataAccess.Repositories.Requests
{
    public interface IRequestRepository : IRepository<Request>
    {
        IEnumerable<RequestVM> GetRequestsByCategoryId(int categoryId);
    }
}
