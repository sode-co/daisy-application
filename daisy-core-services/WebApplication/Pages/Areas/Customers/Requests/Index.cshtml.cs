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

namespace WebApplication.Pages.Areas.Customers.Requests
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Request> Request { get;set; }

        public IActionResult OnGet()
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER" && role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }
            if(role == "CUSTOMER")
            {
                var email = UserAuthentication.UserLogin.Email;
                Request = _unitOfWorkFactory.Get.RequestRepository.GetRequestsByCustomerEmail(email);
            } 
            else
            {
                Request = _unitOfWorkFactory.Get.RequestRepository.GetAll().ToList();
            }
            return Page();
        }
    }
}
