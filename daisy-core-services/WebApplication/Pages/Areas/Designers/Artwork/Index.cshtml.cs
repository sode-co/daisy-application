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

namespace WebApplication.Pages.Areas.Designers.Artwork
{
    public class IndexModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        public IndexModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<ArtWork> ArtWork { get;set; }

        public async Task<IActionResult> OnGetAsync()
        {
            string role = UserAuthentication.Role();

            if (role.Equals(""))
            {
                return Redirect("/Unauthorized");
            }

            ArtWork = await _context.ArtWorks.ToListAsync();
            return Page();
        }
    }
}
