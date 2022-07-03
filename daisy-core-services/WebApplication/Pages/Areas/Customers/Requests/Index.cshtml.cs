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

        public void OnGet()
        {
            // This email will be replaced after @KhangNV7 set current user
            var email = "ngocptse150112@fpt.edu.vn";
            Request = _unitOfWorkFactory.Get.RequestRepository.GetRequestsByCustomerEmail(email);
        }
    }
}
