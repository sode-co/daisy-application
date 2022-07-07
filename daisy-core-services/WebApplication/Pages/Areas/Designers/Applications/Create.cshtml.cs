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
using static Api.Common.Constants;

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class CreateModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public CreateModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context, UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }
        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public JobApplication JobApplication { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync(int? requestId)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            using (var work = _unitOfWorkFactory.Get)
            {
                Request request = work.RequestRepository.GetRequest((int)requestId);
                var email = UserAuthentication.UserLogin.Email;
                var freelancer = work.UserRepository.GetUsersByEmail(email);
                JobApplication.Freelancer = freelancer;
                JobApplication.Request = request;
                JobApplication.OfferedPrice = (decimal)request.Budget;
                JobApplication.CreatedAt = DateTime.Now;
                JobApplication.UpdatedAt = DateTime.Now;
                JobApplication.ResolvedAt = DateTime.Now;
                JobApplication.Timeline = request.Timeline;
                JobApplication.Status = STATUS_JOB_APPLICATION.PENDING;
                JobApplication.ObjectId = "";

                work.JobApplicationRepository.Add(JobApplication);
                work.Save();
            }

            return RedirectToPage("./Index");
        }
    }
}
