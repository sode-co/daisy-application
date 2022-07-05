using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;
using WebApplication.Pages.Utils;
using SaleWebApp.Paging;

namespace WebApplication.Pages.Areas.Customers.Requests
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public PaginatedList<Request> Request { get;set; }

        public async Task<IActionResult> OnGetAsync(int? pageIndex)
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER" && role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }
            IQueryable<Request> requests;
            if(role == "CUSTOMER")
            {
                var email = UserAuthentication.UserLogin.Email;
                requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByCustomerEmail(email);
            } 
            else
            {
                requests = _unitOfWorkFactory.Get.RequestRepository.GetAll();
            }
            Request = await PaginatedList<Request>.CreateAsync(
                requests.AsNoTracking(), pageIndex ?? 1, 10);
            return Page();
        }
    }
}
