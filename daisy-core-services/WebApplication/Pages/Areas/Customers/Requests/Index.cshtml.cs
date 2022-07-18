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

        public string CurrentFilter { get; set; }
        public string CurrentStatus { get; set; }
        public PaginatedList<Request> Request { get;set; }

        public async Task<IActionResult> OnGetAsync(string searchString, int? pageIndex, string? status)
        {

            string role = UserAuthentication.Role();

            if (role.Equals("CUSTOMER") && role.Equals("ADMIN"))
            {
                return Redirect("/Unauthorized");
            }

            CurrentFilter = searchString;
            IQueryable<Request> requests;
            CurrentStatus = status;
            if (status == null)
            {
                if (role == "CUSTOMER")
                {
                    var email = UserAuthentication.UserLogin.Email;
                    if (searchString != null)
                    {
                        pageIndex = 1;
                        requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByTitleAndEmail(searchString, email);
                    }
                    else
                    {
                        requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByCustomerEmail(email);
                    }
                }
                else
                {
                    if (searchString != null)
                    {
                        pageIndex = 1;
                        requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByTitle(searchString);
                    }
                    else
                    {
                        requests = _unitOfWorkFactory.Get.RequestRepository.GetAll(req => req.DeletedAt == null);
                    }
                }
            }
            else
            {
                if (role == "CUSTOMER")
                {
                    var email = UserAuthentication.UserLogin.Email;
                    if (searchString != null)
                    {
                        pageIndex = 1;
                        requests = _unitOfWorkFactory.Get.RequestRepository.GetAll().Include(req => req.Customer).Where(req => (req.Title.Contains(searchString) && req.Customer.Email.Equals(email) && req.DeletedAt == null && req.Status.Equals(status)));
                    }
                    else
                    {
                        requests = _unitOfWorkFactory.Get.RequestRepository.GetAll().Include(req => req.Customer).Where(req => req.Customer.Email.Equals(email) && req.DeletedAt == null && req.Status.Equals(status));
                    }
                }
                else
                {
                    if (searchString != null)
                    {
                        pageIndex = 1;
                        requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByTitle(searchString).Where(r => r.Status.Equals(status));
                    }
                    else
                    {
                        requests = _unitOfWorkFactory.Get.RequestRepository.GetAll(req => req.DeletedAt == null).Where(r => r.Status.Equals(status));
                    }
                }
            }
            
            Request = await PaginatedList<Request>.CreateAsync(
                requests.AsNoTracking(), pageIndex ?? 1, 10);
            return Page();
        }
    }
}
