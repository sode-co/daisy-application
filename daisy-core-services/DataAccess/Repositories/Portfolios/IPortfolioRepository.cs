﻿using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Portfolios
{
    public interface IPortfolioRepository : IRepository<Portfolio>
    {
        void DeletePortfolio(Portfolio portfolio);
    }
}
