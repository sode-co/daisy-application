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
    public class IndexModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public IndexModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<JobApplication> JobApplication { get;set; }

        public async Task OnGetAsync()
        {
            JobApplication = await _context.JobApplications.ToListAsync();
        }
    }
}
