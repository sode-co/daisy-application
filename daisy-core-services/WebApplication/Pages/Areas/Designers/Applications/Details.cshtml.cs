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

namespace WebApplication.Pages.Areas.Designers.Applications
{
    public class DetailsModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public DetailsModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
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

            JobApplication = await _context.JobApplications.FirstOrDefaultAsync(m => m.Id == id);

            if (JobApplication == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
