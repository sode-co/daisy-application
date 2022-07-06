﻿using System;
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
        public PaginatedList<Request> Request { get;set; }

        public async Task<IActionResult> OnGetAsync(string searchString, int? pageIndex)
        {

            string role = UserAuthentication.Role();

            if (role != "DESIGNER")
            {
                return Redirect("/Unauthorized");
            }

            CurrentFilter = searchString;
            IQueryable<Request> requests;
            
            if (searchString != null)
            {
                pageIndex = 1;
                requests = (IQueryable<Request>)_unitOfWorkFactory.Get.RequestRepository.GetRequestsByTitle(searchString);
            }
            else
            {
                requests = _unitOfWorkFactory.Get.RequestRepository.GetAll(req => req.DeletedAt == null);
            }
            Request = await PaginatedList<Request>.CreateAsync(
                requests.AsNoTracking(), pageIndex ?? 1, 10);
            return Page();
        }
    }
}
