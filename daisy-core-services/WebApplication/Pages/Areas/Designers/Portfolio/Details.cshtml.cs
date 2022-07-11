using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http.Extensions;

namespace WebApplication.Pages.Areas.Designers
{
    public class DetailsModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public string currentURL;

        public DetailsModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public Domain.Models.Portfolio Portfolio { get; set; }

        public List<Domain.Models.ArtWork> ArtWork { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            currentURL = HttpContext.Request.GetEncodedPathAndQuery();
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio = work.PortfolioRepository.GetAll().FirstOrDefault(m => m.Id == id);
                ArtWork = work.ArtWorkRepository.GetArtWorkByPortfolioId(Portfolio.Id).ToList();
            }

            if (Portfolio == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
