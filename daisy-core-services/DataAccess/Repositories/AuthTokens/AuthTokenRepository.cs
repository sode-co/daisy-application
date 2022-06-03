using System;
using DataAccess.MssqlServerIntegration;
using Domain.Models;

namespace DataAccess.Repositories.AuthTokens
{
    public class AuthTokenRepository : Repository<AuthToken>, IAuthTokenRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public AuthTokenRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
