using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Portfolios
{
    public class PortfolioRepository : Repository<Portfolio>, IPortfolioRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PortfolioRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void DeletePortfolio(Portfolio portfolio)
        {
            portfolio.DeletedAt = DateTime.Now;
            _dbContext.Portfolios.Update(portfolio);
            _dbContext.SaveChanges();

        }
        public void UpdatePortfolio(Portfolio portfolio)
        {
            _dbContext.Portfolios.Update(portfolio);
            _dbContext.SaveChanges();

        }
    }
}
