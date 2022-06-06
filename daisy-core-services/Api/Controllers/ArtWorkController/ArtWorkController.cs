using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers.ArtWorkController
{
    [ApiController]
    [Route("v1/artworks")]
    public partial class ArtWorkController : Controller
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public ArtWorkController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet("category/{id}")]
        public IEnumerable<ArtWork> GetArtWorksByCategory(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                IEnumerable<ArtWork> artWorks = work.ArtWorkRepository.GetArtWorksByCategory(id);
                if (artWorks is null)
                {
                    return (IEnumerable<ArtWork>)NotFound();
                }

                return artWorks;
            }
        }
    }

}

