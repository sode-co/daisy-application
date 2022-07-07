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
using static Api.Common.Constants;
using DataAccess.UnitOfWork;

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class DetailsModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public DetailsModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public JobApplication JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string role = UserAuthentication.Role();
            if (role != "DESIGNER")
            {
                return Redirect("/Unauthorized");
            }


            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                JobApplication = work.JobApplicationRepository.GetAll().FirstOrDefault(m => m.Id == id);
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
    }
}
