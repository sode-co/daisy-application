using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Users
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public UserRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateUser(User user)
        {
            _dbContext.Users.Add(user);
        }     

        public IEnumerable<User> GetDesignersByCategory(int categoryId)
        {
            var artWorks = _dbContext.ArtWorks.ToList();
            var category = _dbContext.Categories.Find(categoryId);
            var artWorkList = artWorks.Where(art => art.Category.Id == categoryId).ToList();
            var portfolioList = _dbContext.Portfolios.ToList();
            var userList = _dbContext.Users.ToList();
            Portfolio portfolio;
            User user;
            List<User> designerList = new();

            foreach (var artWork in artWorkList)
            {
                portfolio = portfolioList.Where(port => port.Id == artWork.Portfolio.Id).SingleOrDefault();
                user = userList.Where(user => user.Id == portfolio.Freelancer.Id).SingleOrDefault();
                designerList.Add(user);
            }

            designerList.Distinct();

            return designerList;
        }

        public User GetUser(int id)
        {
            return _dbContext.Users.Find(id);
        }

        public IEnumerable<User> GetUsers()
        {
            return _dbContext.Users.ToList();
        }
        public void DeleteUser(User user)
        {          
            user.DeletedAt = DateTime.Now;
            _dbContext.Users.Update(user);
        }
        public void UpdateUser(User user)
        {
            _dbContext.Users.Update(user);
            
        }

        public IEnumerable<User> GetUsersByName(string name) => _dbContext.Users.ToList().
                Where(user => user.DisplayName.ToUpper().Contains(name.ToUpper())).ToList();
    }
}
