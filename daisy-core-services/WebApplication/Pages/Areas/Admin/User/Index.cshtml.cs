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
using DataAccess.UnitOfWork;
using SaleWebApp.Paging;

namespace WebApplication.Pages.UserCRUD
{
    public class IndexModel : PageModel
    {
        [BindProperty(SupportsGet = true)]
        public string SearchString { get; set; }

        [BindProperty(SupportsGet = true)]
        public int CurrentPage { get; set; }
        public int ItemPerPage { get; set; }

        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<User> User { get;set; }
        
        public decimal TotalPage { get; set; }

        public async Task<IActionResult> OnGetAsync(int p = 1)
        {
            string role = UserAuthentication.Role();

            if (role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }

            ItemPerPage = 10;
            CurrentPage = p;

            string email = UserAuthentication.UserLogin.Email;

            var users = _unitOfWorkFactory.Get.UserRepository.GetUsers().Where(u => !u.Email.Equals(email));
            
            if (!string.IsNullOrEmpty(SearchString))
            {
                users = _unitOfWorkFactory.Get.UserRepository.GetUsersByName(SearchString).Where(u => !u.Email.Equals(email));
            }
            decimal tmp = Math.Ceiling(Convert.ToDecimal(users.Count()/ ItemPerPage));
            TotalPage = tmp == 0 ? 1 : tmp;
            User = users.Skip((CurrentPage - 1) * ItemPerPage).Take(ItemPerPage).ToList();
            
            return Page();
        }
    }
}
