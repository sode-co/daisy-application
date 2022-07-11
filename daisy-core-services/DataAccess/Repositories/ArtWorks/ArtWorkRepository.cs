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

        public IEnumerable<ArtWork> GetArtWorkByPortfolioId(int id)
        {
            var artWorksByPortfolio = _dbContext.ArtWorks.Where(aw => aw.Portfolio.Id == id);
            return artWorksByPortfolio;
        }

        public IEnumerable<ArtWork> GetArtWorksByCategory(int id)
        {
            var artWorks = _dbContext.ArtWorks.ToList();
            var category = _dbContext.Categories.Find(id);
            var artWorksByCategory = artWorks.Where(aw => aw.Category.Id == id).ToList();

            return artWorksByCategory;
        }

        public void DeleteArtWork(ArtWork aw)
        {
            aw.DeletedAt = DateTime.Now;
            _dbContext.ArtWorks.Update(aw);
            _dbContext.SaveChanges();
        }
        public void UpdateArtWork(ArtWork aw)
        {
            aw.UpdatedAt = DateTime.Now;
            _dbContext.SaveChanges();
            _dbContext.ArtWorks.Update(aw);

        }

        public void CreateArtWork(ArtWork aw)
        {
            aw.UpdatedAt = DateTime.Now;
            aw.ObjectId = DateTime.Now.ToString();
            _dbContext.ArtWorks.Add(aw);
            _dbContext.SaveChanges();

        }
    }
}
