using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class EditModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public EditModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
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

            if (JobApplication == null)
            {
                return NotFound();
            }
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                JobApplication.UpdatedAt = DateTime.Now;
                work.JobApplicationRepository.UpdateJobApplication(JobApplication);
                work.Save();
            }

            return RedirectToPage("./Index");
        }
    }
}
