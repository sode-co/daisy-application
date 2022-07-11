using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using WebApplication.Pages.Utils;
using DataAccess.UnitOfWork;

namespace WebApplication.Pages.Areas.Designers
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
        public Domain.Models.Portfolio Portfolio { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            string email = UserAuthentication.UserLogin.Email;

            using var work = _unitOfWorkFactory.Get;
            User designer = work.UserRepository.GetUsersByEmail(email);
            Portfolio.Freelancer = designer;
            Portfolio.IsActive = true;
            Portfolio.CreatedAt = DateTime.Now;
            work.PortfolioRepository.Add(Portfolio);
            work.Save();
    
            return RedirectToPage("./Index");
        }
    }
}
