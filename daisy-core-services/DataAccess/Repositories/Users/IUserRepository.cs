using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Users
{
    public interface IUserRepository : IRepository<User>
    {
        IEnumerable<User> GetDesignersByCategory(int categoryId);
    }
}
