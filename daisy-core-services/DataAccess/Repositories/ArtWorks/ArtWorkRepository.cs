using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.ArtWorks
{
    public class ArtWorkRepository : Repository<ArtWork>, IArtWorkRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public ArtWorkRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
