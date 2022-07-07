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

namespace WebApplication.Pages.Areas.Customers.Applications
{
    public class ApproveModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public ApproveModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Request Request { get; set; }
        [BindProperty]
        public User Designer { get; set; }
        public JobApplication JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id, int? freelancerId, int? requestId)
        {
            string role = UserAuthentication.Role();
            using (var work = _unitOfWorkFactory.Get)
            {
                JobApplication = work.JobApplicationRepository.Get((int)id);
                Designer = work.UserRepository.GetUser((int)freelancerId);
            }

            if (role != "CUSTOMER" && role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }
            if(JobApplication.Status != STATUS_JOB_APPLICATION.PENDING)
            {
                return Redirect("/Unauthorized");
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id, int? requestId)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
               JobApplication = work.JobApplicationRepository.Get((int)id);
                JobApplication.Status = STATUS_JOB_APPLICATION.APPROVE;
                work.JobApplicationRepository.UpdateJobApplication(JobApplication);
                work.Save();
                List<JobApplication> listRejectedApplication = work.JobApplicationRepository.GetAll().Include(job => job.Request).Where(job => job.Request.Id == requestId && job.Id != id).ToList();
                foreach(var application in listRejectedApplication)
                {
                    application.Status = STATUS_JOB_APPLICATION.REJECT;
                    work.JobApplicationRepository.UpdateJobApplication(application);
                    work.Save();
                }
            }
            return RedirectToPage("./Index", new { requestId = requestId });
        }
    }
}
