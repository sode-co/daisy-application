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
    public class DetailsModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public DetailsModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

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
    }
}
