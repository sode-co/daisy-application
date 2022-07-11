using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;

namespace WebApplication.Pages.Areas.Customers.Workspaces
{
    public class DetailsModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public DetailsModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        public Workspace Workspace { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Workspace = await _context.Workspaces.FirstOrDefaultAsync(m => m.Id == id);

            if (Workspace == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
