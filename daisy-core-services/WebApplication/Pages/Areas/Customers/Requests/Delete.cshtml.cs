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

namespace WebApplication.Pages.Areas.Customers.Requests
{
    public class DeleteModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public DeleteModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Request Request { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER" && role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }

            if (id == null)
            {
                return NotFound();
            }

            Request = await _context.Requests.FirstOrDefaultAsync(m => m.Id == id);

            if (Request == null)
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

            Request = await _context.Requests.FindAsync(id);

            if (Request != null)
            {
                _context.Requests.Remove(Request);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
