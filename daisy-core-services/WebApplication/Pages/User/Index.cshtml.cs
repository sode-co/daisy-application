using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;

namespace WebApplication.Pages.UserCRUD
{
    public class IndexModel : PageModel
    {
        private readonly DataAccess.MssqlServerIntegration.ApplicationDbContext _context;

        [BindProperty(SupportsGet = true)]
        public string SearchString { get; set; }

        [BindProperty(SupportsGet = true)]
        public int CurrentPage { get; set; }
        public int ItemPerPage { get; set; }

        public IndexModel(DataAccess.MssqlServerIntegration.ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<Domain.Models.User> User { get;set; }
        
        public decimal TotalPage { get; set; }

        public async Task OnGetAsync(int p = 1)
        {
            ItemPerPage = 10;
            CurrentPage = p;
            var users = (from m in _context.Users
                       select m);
            
            if (!string.IsNullOrEmpty(SearchString))
            {
                users = users.Where(s => s.DisplayName.Contains(SearchString));
            }
            decimal tmp = Math.Ceiling(Convert.ToDecimal(await users.CountAsync() / ItemPerPage));
            TotalPage = tmp == 0 ? 1 : tmp;
            User = await users.Skip((CurrentPage - 1) * ItemPerPage).Take(ItemPerPage).ToListAsync();
        }
    }
}
