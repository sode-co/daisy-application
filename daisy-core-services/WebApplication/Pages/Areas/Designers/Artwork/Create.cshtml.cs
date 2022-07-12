using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Areas.Designers.Artwork
{
    public class CreateModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public CreateModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IActionResult OnGet()
        {
            string role = UserAuthentication.Role();

            if (!role.Equals("DESIGNER"))
            {
                return Redirect("/Unauthorized");
            }

            return Page();
        }

        [BindProperty]
        public ArtWork ArtWork { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync(int? creatorID, string? returnURL)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                if (creatorID != null)
                {
                    Domain.Models.Portfolio portfolio = work.PortfolioRepository.Get((int)creatorID);
                    ArtWork.Portfolio = portfolio;
                    portfolio.UpdatedAt = DateTime.Now;
                    work.PortfolioRepository.UpdatePortfolio(portfolio);
                    work.Save();
                    work.ArtWorkRepository.CreateArtWork(ArtWork);
                    work.Save();
                }
            }

            return Redirect(returnURL != null ? returnURL : "./Index");
        }
    }
}
