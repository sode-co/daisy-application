using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;

namespace WebApplication.Pages.Areas.Designers
{
    public class EditModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public EditModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Domain.Models.Portfolio Portfolio { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio = await work.PortfolioRepository.GetAll().FirstOrDefaultAsync(m => m.Id == id);
            }
           
            if (Portfolio == null)
            {
                return NotFound();
            }
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync(string? returnURL)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio.UpdatedAt = DateTime.Now;
                work.PortfolioRepository.UpdatePortfolio(Portfolio);
                work.Save();
            }

            return Redirect(returnURL != null ? returnURL : "./Index");
        }
    }
}
