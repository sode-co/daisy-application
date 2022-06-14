using Domain.Models;
using Microsoft.AspNetCore.Mvc;
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

        void CreateUser(User user);
        User GetUser(int id);
        IEnumerable<User> GetUsers();
        IEnumerable<User> GetUsersByName(string name);
        void UpdateUser(User user);
        void DeleteUser(User user);
       
    }
}
