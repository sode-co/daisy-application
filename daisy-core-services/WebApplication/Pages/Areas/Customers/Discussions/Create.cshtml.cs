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
using static Api.Common.Constants;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Areas.Customers.Discussions
{
    public class CreateModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public CreateModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Workspace Workspace { get; set; }
        [BindProperty]
        public string type { get; set; }

        public IActionResult OnGet(int? workspaceId)
        {
            string role = UserAuthentication.Role();

            if (role.Equals("CUSTOMER") && role.Equals("DESIGNER"))
            {
                return Redirect("/Unauthorized");
            }
            string[] type = new string[] { "img", "text" };
            ViewData["Type"] = new SelectList(type);

            var email = UserAuthentication.UserLogin.Email;

            using var work = _unitOfWorkFactory.Get;
            User user = work.UserRepository.GetUsersByEmail(email);
            Workspace = work.WorkspaceRepository.GetAll((d) => d.Id == workspaceId, null, "Project").FirstOrDefault();

            return Page();
        }

        [BindProperty]
        public Discussion Discussion { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync(int? workspaceId)
        {
            using var work = _unitOfWorkFactory.Get;

            var email = UserAuthentication.UserLogin.Email;
            Discussion.Type = type;
            Discussion.CreatedAt = DateTime.Now;
            Discussion.Status = DISCUSSION_STATUS.SENT;
            Discussion.Workspace = work.WorkspaceRepository.Get((int)workspaceId);
            Discussion.Sender = work.UserRepository.GetUsersByEmail(email);
            if (!ModelState.IsValid)
            {
                return Page();
            }

            work.DiscussionRepository.CreateDiscussion(Discussion);
            work.Save();

            return RedirectToPage("./Index", new { workspaceId = workspaceId });
        }
    }
}
