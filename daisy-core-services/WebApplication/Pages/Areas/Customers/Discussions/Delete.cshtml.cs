using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using WebApplication.Pages.Utils;
using DataAccess.UnitOfWork;
using static Api.Common.Constants;

namespace WebApplication.Pages.Areas.Customers.Discussions
{
    public class DeleteModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DeleteModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Discussion Discussion { get; set; }
        [BindProperty]
        public Workspace Workspace { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id, int? workspaceId)
        {
            if (id == null)
            {
                return NotFound();
            }

            string role = UserAuthentication.Role();

            if (role.Equals("CUSTOMER") && role.Equals("DESIGNER"))
            {
                return Redirect("/Unauthorized");
            }
            var email = UserAuthentication.UserLogin.Email;

            using var work = _unitOfWorkFactory.Get;
            User user = work.UserRepository.GetUsersByEmail(email);
            Workspace = work.WorkspaceRepository.GetAll((d) => d.Id == workspaceId, null, "Project").FirstOrDefault();

            if (!Workspace.Project.Freelancer.Equals(user) && !Workspace.Project.Customer.Equals(user))
            {
                return Redirect("/Unauthorized");
            }


            Discussion = work.DiscussionRepository.Get((int)id);

            if (Discussion == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id, int? workspaceId)
        {
            using var work = _unitOfWorkFactory.Get;
            Discussion = work.DiscussionRepository.Get((int)id);

            Discussion.DeletedAt = DateTime.Now;
            Discussion.Status = DISCUSSION_STATUS.REMOVED;
            work.DiscussionRepository.UpdateDiscussion(Discussion);
            work.Save();

            return RedirectToPage("./Index", new { workspaceId = workspaceId });
        }
    }
}
