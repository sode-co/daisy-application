using DataAccess.MssqlServerIntegration;
using Domain.Models;
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

        public IEnumerable<User> GetDesignersByCategory(int categoryId)
        {
            var artWorks = _dbContext.ArtWorks.ToList();
            var category = _dbContext.Categories.ToList().Where(cate => cate.Id == categoryId).SingleOrDefault();
            var artWorkList = artWorks.Where(art => art.Category.Id == categoryId).ToList();
            var portfolioList = _dbContext.Portfolios.ToList();
            var userList = _dbContext.Users.ToList();
            Portfolio portfolio;
            User user;
            List<User> designerList = new();

            foreach (var artWork in artWorkList)
            {
                portfolio= portfolioList.Where(port => port.Id == artWork.Portfolio.Id).SingleOrDefault();
                user = userList.Where(user => user.Id == portfolio.Freelancer.Id).SingleOrDefault();
                designerList.Add(user);
            }

            designerList.Distinct();

            return designerList;
        }
    }
}
