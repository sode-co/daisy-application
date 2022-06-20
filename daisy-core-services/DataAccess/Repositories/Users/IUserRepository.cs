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
        User GetUser(int id);
        IEnumerable<User> GetUsers();
        IEnumerable<User> GetUsersByName(string name);
        IEnumerable<User> GetDesignersByCategory(int categoryId);
        IEnumerable<User> GetDesignersByCustomerId(int customerId, IQueryable<Project> projectList);
        void CreateUser(User user);
        void UpdateUser(User user);
        void DeleteUser(User user);
    }
}
