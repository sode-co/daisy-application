using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public IEnumerable<ArtWork> GetArtWorksByCategory(int id)
        {
            var artWorks = _dbContext.ArtWorks.ToList();
            var category = _dbContext.Categories.Find(id);
            var artWorksByCategory = artWorks.Where(aw => aw.Category.Id == id).ToList();

            return artWorksByCategory;
        }

    }
}
