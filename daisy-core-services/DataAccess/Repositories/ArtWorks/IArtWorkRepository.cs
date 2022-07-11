using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.ArtWorks
{
    public interface IArtWorkRepository : IRepository<ArtWork>
    {
        IEnumerable<ArtWork> GetArtWorksByCategory(int id);
        IEnumerable<ArtWork> GetArtWorkByPortfolioId(int id);
        void UpdateArtWork(ArtWork aw);
        void DeleteArtWork(ArtWork aw);
        void CreateArtWork(ArtWork aw);
    }
}
