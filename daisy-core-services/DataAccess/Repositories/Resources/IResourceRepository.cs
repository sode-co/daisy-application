using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Resources
{
    public interface IResourceRepository : IRepository<Resource>
    {
        IEnumerable<Resource> ResourcePaging(DateTime timeOffset, int count, int workId, string workStatus);
    }
}
