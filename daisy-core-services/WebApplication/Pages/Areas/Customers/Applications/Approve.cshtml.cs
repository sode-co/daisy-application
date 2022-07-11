using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using WebApplication.Pages.Utils;
using DataAccess.UnitOfWork;
using static Api.Common.Constants;
using Microsoft.EntityFrameworkCore;

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
            using var work = _unitOfWorkFactory.Get;
            JobApplication = work.JobApplicationRepository.Get(id.Value);
            Designer = work.UserRepository.GetUser(freelancerId.Value);

            if (!role.Equals("CUSTOMER"))
            {
                return Redirect("/Unauthorized");
            }
            if (JobApplication.Status != STATUS_JOB_APPLICATION.PENDING)
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
                JobApplication = work.JobApplicationRepository.GetAll(j => j.Id.Equals(id.Value)).Include(j => j.Freelancer).FirstOrDefault();
                JobApplication.Status = STATUS_JOB_APPLICATION.APPROVE;
                work.JobApplicationRepository.UpdateJobApplication(JobApplication);
                work.Save();
                List<JobApplication> listRejectedApplication = work.JobApplicationRepository.GetAll((job) => job.Request.Id == requestId && job.Id != id, null, "Request").ToList();
                foreach (var application in listRejectedApplication)
                {
                    application.Status = STATUS_JOB_APPLICATION.REJECT;
                    work.Save();
                }
                User user = UserAuthentication.UserLogin;

                Request req = work.RequestRepository.GetAll(r => r.Id.Equals(requestId)).Include(r => r.Customer).Include(r => r.Category).FirstOrDefault();
                Project project = new Project()
                {
                    Customer = req.Customer,
                    Freelancer = JobApplication.Freelancer,
                    Category = req.Category,
                    Data = JobApplication.Data,
                    PreferredLanguage = JobApplication.PreferredLanguage,
                    Name = req.Title,
                    Description = req.Description,
                    Timeline = JobApplication.Timeline ?? req.Timeline,
                    Budget = req.Budget ?? JobApplication.OfferedPrice,
                    IsAllowedPublic = false,
                    Status = PROJECT_STATUS.IN_PROGRESS,
                    Request = req,
                };
                work.ProjectRepository.Add(project);
                work.Save();
                Workspace workspace = new Workspace()
                {
                    Project = project,
                    Request = req,
                    Status = REQUEST_STATUS.TAKEN,
                };
                work.WorkspaceRepository.Add(workspace);
                work.Save();

            }
            return RedirectToPage("./Index", new { requestId = requestId });
        }
    }
}
