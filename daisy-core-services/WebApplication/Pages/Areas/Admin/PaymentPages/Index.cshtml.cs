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
using SaleWebApp.Paging;
using Api.Common;

namespace WebApplication.Pages.Areas.Admin.PaymentPages
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
        public PaginatedList<(Project pro, Payment pay)> Payments { get; set; }

        public async Task<IActionResult> OnGetAsync(string? searchString, int? pageIndex, string? status)
        {
            CurrentFilter = searchString;
            CurrentStatus = status;
            IQueryable<Payment> payments;
            IList<(Project, Payment)> response = new List<(Project, Payment)>();

            if (status == null || status == "ALL")
            {
                payments = _unitOfWorkFactory.Get.PaymentRepository.GetAll();
            } else
            {
                payments = _unitOfWorkFactory.Get.PaymentRepository.GetAll(p => p.Status.Equals(status));
            }
            foreach(Payment payment in payments) {
                Project project;
                if (searchString == null)
                {
                    project = _unitOfWorkFactory.Get.ProjectRepository.GetFirstOrDefault(pro => pro.Payment.Id == payment.Id, "Payment");
                } else
                {
                    project = _unitOfWorkFactory.Get.ProjectRepository.GetFirstOrDefault(pro => pro.Payment.Id == payment.Id && pro.Name.ToLower().Contains(searchString.ToLower()), "Payment");
                }
                if (project == null)
                {
                    continue;
                }
                var paymentActions = _unitOfWorkFactory.Get.PaymentActionRepository.GetAll(a => a.Payment.Id == payment.Id, null, "User");
                payment.PaymentActions = paymentActions.ToList();
                response.Add((project, payment));
            }
            Payments = PaginatedList<(Project, Payment)>.Create(
                response.AsQueryable(), pageIndex ?? 1, 5);
            return Page();
        }
    }
}
