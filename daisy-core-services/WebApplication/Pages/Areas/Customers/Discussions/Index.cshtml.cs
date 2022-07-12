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
using static Api.Common.Constants;

namespace WebApplication.Pages.Areas.Customers.Discussions
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Discussion> Discussion { get; set; }
        public Workspace Workspace { get; set; }

        public async Task<IActionResult> OnGetAsync(int? workspaceId)
        {
            string role = UserAuthentication.Role();

            if (!role.Equals("CUSTOMER") && !role.Equals("DESIGNER"))
            {
                return Redirect("/Unauthorized");
            }
            var email = UserAuthentication.UserLogin.Email;

            using var work = _unitOfWorkFactory.Get;
            User user = work.UserRepository.GetUsersByEmail(email);
            Workspace = work.WorkspaceRepository.GetAll((d) => d.Id == workspaceId, null, "Project").Include(p => p.Project.Freelancer).FirstOrDefault();

            if(!Workspace.Project.Freelancer.Equals(user) && !Workspace.Project.Customer.Equals(user))
            {
                return Redirect("/Unauthorized");
            }

            Discussion = work.DiscussionRepository.GetAll((d) => d.Workspace.Id == workspaceId, null, "Workspace").Where(d => d.DeletedAt == null).ToList(); ;

            return Page();
        }

        public IActionResult OnPostUpdate(int? workspaceId)
        {
            using var work = _unitOfWorkFactory.Get;

            var email = UserAuthentication.UserLogin.Email;
            
            if (!ModelState.IsValid)
            {
                return Page();
            }
            Workspace = work.WorkspaceRepository.GetAll((d) => d.Id == workspaceId, null, "Project").FirstOrDefault();
            Workspace.Project.Status = PROJECT_STATUS.DONE;
            Workspace.Status = PROJECT_STATUS.DONE;
            work.Save();

            return RedirectToPage("./Index", new { workspaceId = workspaceId });
        }
    }
}
