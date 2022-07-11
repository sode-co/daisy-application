using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http.Extensions;
using SaleWebApp.Paging;
using WebApplication.Pages.Utils;

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

        public PaginatedList<Domain.Models.ArtWork> ArtWork { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id, int? pageIndex)
        {
            string role = UserAuthentication.Role();

            if (role.Equals(""))
            {
                return Redirect("/Unauthorized");
            }


            currentURL = HttpContext.Request.GetEncodedPathAndQuery();
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio = work.PortfolioRepository.GetAll().Include(p => p.Freelancer).FirstOrDefault(m => m.Id == id);
                IQueryable<Domain.Models.ArtWork> listArtWorks = (IQueryable<Domain.Models.ArtWork>)work.ArtWorkRepository.GetArtWorkByPortfolioId(Portfolio.Id);
                ArtWork = await PaginatedList<Domain.Models.ArtWork>.CreateAsync(
                listArtWorks.AsNoTracking(), pageIndex ?? 1, 10);
            }

            if (Portfolio == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
