using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Areas.Designers
{
    public class MyPortfoliosModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public MyPortfoliosModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Domain.Models.Portfolio> Portfolio { get; set; }

        public async Task<IActionResult> OnGetAsync(int? freelancerId)
        {
            string role = UserAuthentication.Role();

            if (role.Equals(""))
            {
                return Redirect("/Unauthorized");
            }
            string email = UserAuthentication.UserLogin.Email;

            using (var work = _unitOfWorkFactory.Get)
            {
                if (freelancerId == null)
                {
                    Portfolio = await work.PortfolioRepository.GetAll().Include(p => p.Freelancer).Where(p => p.Freelancer.Email.Equals(email) && p.DeletedAt == null).ToListAsync();
                }
                else
                {
                    Portfolio = await work.PortfolioRepository.GetAll().Include(p => p.Freelancer).Where(p => p.Freelancer.Id.Equals(freelancerId) && p.DeletedAt == null).ToListAsync();
                }
            }

            return Page();
        }
    }
}
