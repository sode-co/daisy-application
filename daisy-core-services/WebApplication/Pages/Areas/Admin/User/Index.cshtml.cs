using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using WebApplication.Pages.Utils;
using DataAccess.UnitOfWork;
using SaleWebApp.Paging;
using Microsoft.EntityFrameworkCore;

namespace WebApplication.Pages.UserCRUD
{
    public class IndexModel : PageModel
    {
        [BindProperty(SupportsGet = true)]
        public string SearchString { get; set; }
        [BindProperty(SupportsGet = true)]
        public string RoleFilter { get; set; }
        [BindProperty(SupportsGet = true)]
        public int ItemPerPage { get; set; }
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }
        public PaginatedList<User> User { get; set; }
        public decimal TotalPage { get; set; }
        public async Task<IActionResult> OnGetAsync(string searchString, int? pageIndex, string? roleUser)
        {
            string role = UserAuthentication.Role();

            if (role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }

            SearchString = searchString;
            RoleFilter = roleUser;
            IQueryable<User> userList;
            ItemPerPage = 10;

            var email = UserAuthentication.UserLogin.Email;

            if (roleUser == "CUSTOMER")
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                        u => u.DisplayName.ToUpper().Contains(SearchString.ToUpper()) &&
                        u.Role == roleUser &&
                        !u.Email.Equals(email) &&
                        u.DeletedAt == null);
                }
                else
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                       u => u.DeletedAt == null &&
                       u.Role == roleUser &&
                       !u.Email.Equals(email));
                }
            }
            else if (roleUser == "DESIGNER")
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                        u => u.DisplayName.ToUpper().Contains(SearchString.ToUpper()) &&
                        u.Role == roleUser &&
                        !u.Email.Equals(email) &&
                        u.DeletedAt == null);
                }
                else
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                       u => u.DeletedAt == null &&
                       u.Role == roleUser &&
                       !u.Email.Equals(email));
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                        u => u.DisplayName.ToUpper().Contains(SearchString.ToUpper()) &&
                        !u.Email.Equals(email) &&
                        u.DeletedAt == null);
                }
                else
                {
                    userList = (IQueryable<User>)_unitOfWorkFactory.Get.UserRepository.GetAll(
                        u => u.DeletedAt == null &&
                        !u.Email.Equals(email));
                }
            }

            User = await PaginatedList<User>.CreateAsync(
                        userList.AsNoTracking(), pageIndex ?? 1, ItemPerPage);
            return Page();
        }
    }
}
