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

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class DeleteModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DeleteModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }


        [BindProperty]
        public JobApplication JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                JobApplication = work.JobApplicationRepository.GetAll().FirstOrDefault(m => m.Id == id);
            }

            string role = UserAuthentication.Role();
            if (role != "DESIGNER")
            {
                return Redirect("/Unauthorized");
            }

            if (JobApplication.Status != STATUS_JOB_APPLICATION.PENDING)
            {
                return Redirect("/Unauthorized");
            }


            if (JobApplication == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }


            using (var work = _unitOfWorkFactory.Get)
            {
                JobApplication = work.JobApplicationRepository.GetAll().FirstOrDefault(m => m.Id == id);

                if (JobApplication != null)
                {
                    work.JobApplicationRepository.DeleteJobApplication(JobApplication);
                    work.Save();
                }

            }

            return RedirectToPage("./Index");
        }
    }
}
