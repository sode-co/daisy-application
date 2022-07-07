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
using AutoMapper.QueryableExtensions;

namespace WebApplication.Pages.Areas.Designers.Requests
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public string CurrentFilter { get; set; }
        public List<Request> Request { get;set; }

        public async Task<IActionResult> OnGetAsync(string searchString, int? pageIndex)
        {

            string role = UserAuthentication.Role();

            if (role != "DESIGNER")
            {
                return Redirect("/Unauthorized");
            }
            CurrentFilter = searchString;
            List<Request> requests;

            using (var work = _unitOfWorkFactory.Get)
            {
                var designerEmail = UserAuthentication.UserLogin.Email;
                if (searchString != null)
                {
                    pageIndex = 1;
                    requests = work.RequestRepository.GetRequestsDesignerHasntAppliedYet(designerEmail).Where(req => req.Title.ToLower().Contains(searchString.ToLower())).ToList();
                }
                else
                {
                    requests = work.RequestRepository.GetRequestsDesignerHasntAppliedYet(designerEmail).ToList();
                }
            }
            Request = requests;
            return Page();
        }
    }
}
