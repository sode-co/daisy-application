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

namespace WebApplication.Pages.Areas.Customers.Workspaces
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Workspace> Workspace { get;set; }

        public async Task<IActionResult> OnGetAsync()
        {
            string role = UserAuthentication.Role();

            if (role.Equals("CUSTOMER") && role.Equals("DESIGNER"))
            {
                return Redirect("/Unauthorized");
            }
            var email = UserAuthentication.UserLogin.Email;

            using var work = _unitOfWorkFactory.Get;
            User user = work.UserRepository.GetUsersByEmail(email);

            Workspace = work.WorkspaceRepository.GetAll().Include(w => w.Project).Where(w => w.Project.Freelancer.Equals(user) || w.Project.Customer.Equals(user) && w.DeletedAt == null).ToList();

            return Page();
        }
    }
}
