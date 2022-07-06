using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class DeleteModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public DeleteModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public JobApplication JobApplication { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            JobApplication = await _context.JobApplications.FirstOrDefaultAsync(m => m.Id == id);

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

            JobApplication = await _context.JobApplications.FindAsync(id);

            if (JobApplication != null)
            {
                _context.JobApplications.Remove(JobApplication);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
