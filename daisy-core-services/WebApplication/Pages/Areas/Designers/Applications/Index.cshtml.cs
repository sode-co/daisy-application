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
using SaleWebApp.Paging;

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public PaginatedList<JobApplication> JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? pageIndex)
        {
            string email = UserAuthentication.UserLogin.Email;
            string role = UserAuthentication.Role();

            if (role != "DESIGNER")
            {
                return Redirect("/Unauthorized");
            }

            IQueryable<JobApplication> jobApplications = _unitOfWorkFactory.Get.JobApplicationRepository.GetAll(jobApplication => jobApplication.DeletedAt == null).Include(job => job.Freelancer).Include(job => job.Request).Where(job => job.Freelancer.Email.Equals(email));
            JobApplication = await PaginatedList<JobApplication>.CreateAsync(
                jobApplications.AsNoTracking(), pageIndex ?? 1, 10);

            return Page();
        }
    }
}
