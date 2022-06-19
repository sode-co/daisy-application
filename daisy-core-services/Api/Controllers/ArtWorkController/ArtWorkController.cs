using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Utils.Models;
using static Api.Common.Constants;

namespace Api.Controllers.ArtWorkController
{
    [AllowAnonymous]
    [ApiController]
    [Route("v1/artworks")]
    public partial class ArtWorkController : Controller
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public ArtWorkController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet("{artworkId}")]

        public IActionResult GetArtworkById(int artworkId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork artWork = work.ArtWorkRepository.GetFirstOrDefault(art => art.Id.Equals(artworkId));
                if (artWork != null)
                {
                    return Json(artWork);
                }

                return NotFound();
            }
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

        [HttpDelete("{artworkId}")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IActionResult DeleteArtworkById(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork artWork = work.ArtWorkRepository.GetFirstOrDefault(wa => wa.Id == id);
                if (artWork is null) return NotFound();
                
                artWork.DeletedAt = System.DateTime.Now;
                work.Save();
                return Json(new { message = "ok" });
            }
        }
    }

}

