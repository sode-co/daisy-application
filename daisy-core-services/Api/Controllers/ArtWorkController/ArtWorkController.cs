using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System;
using static Api.Common.Constants;
using Microsoft.EntityFrameworkCore;

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
                ArtWork artWork = work.ArtWorkRepository.Get(artworkId);
                if (artWork != null) return Json(artWork);

                return NotFound();
            }
        }

        [HttpGet("category/{id}")]
        [Authorize(Policy = ROLE.DESIGNER)]
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

        [HttpGet("designer/{designerEmail}")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public ArtWork GetLastArtWorksByDesignerEmail(String designerEmail)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio portfolio = work.PortfolioRepository.GetAll(null, null, "Freelancer").Where(p => p.Freelancer.Email.Equals(designerEmail)).FirstOrDefault();
                IEnumerable<ArtWork> artWorks = work.ArtWorkRepository.GetAll(null, null, "Portfolio");
                ArtWork artWork = artWorks.Where(a => a.Portfolio.Id.Equals(portfolio.Id)).LastOrDefault();

                return artWork;
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

        [HttpPut("{artworkId}")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IActionResult UpdateArtWorkById(int artworkId, [FromBody] ArtWork body)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork artWork = work.ArtWorkRepository.Get(artworkId);
                if (artWork is null) return NotFound();               
                artWork.Description = body.Description;
                artWork.Title = body.Title;
                artWork.Category = work.CategoryRepository.Get(body.Category.Id);
                work.Save();

                return Json(new { message = "ok" });
            }
            
        }

        [Authorize(Policy = ROLE.DESIGNER)]
        [HttpPost()]
        public IActionResult CreateArtwork([FromBody] ArtWork body)
        {
            int designerId = ((User)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(designerId);
                var portfolioList = work.PortfolioRepository.GetAll(null, null, "Freelancer");
                Portfolio portfolio = portfolioList.FirstOrDefault(p => p.Freelancer.Id == designerId);
                portfolio.UpdatedAt = DateTime.Now;
                if(freelancer != null && portfolio != null)
                {
                    work.ArtWorkRepository.Add(new ArtWork()
                    {
                        Description = body.Description,
                        Image = body.Image,
                        Portfolio = portfolio,
                        Title = body.Title
                    });

                    work.Save();
                    return Ok();
                }

                work.Save();
                return NotFound();
            }
        }

    }

}

