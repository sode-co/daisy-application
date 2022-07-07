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

namespace WebApplication.Pages.Areas.Customers.Applications
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public PaginatedList<JobApplication> JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? pageIndex, int? requestId)
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER")
            {
                return Redirect("/Unauthorized");
            }

            IQueryable<JobApplication> jobApplications;
                jobApplications = _unitOfWorkFactory.Get.JobApplicationRepository.GetAll(jobApplication => jobApplication.Request.Id == requestId && jobApplication.DeletedAt == null).Include(jobApplication => jobApplication.Freelancer);

            JobApplication = await PaginatedList<JobApplication>.CreateAsync(
                jobApplications.AsNoTracking(), pageIndex ?? 1, 10);

            return Page();
        }
    }
}
