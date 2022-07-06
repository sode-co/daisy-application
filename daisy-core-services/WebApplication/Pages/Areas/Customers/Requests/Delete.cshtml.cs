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

namespace WebApplication.Pages.Areas.Customers.Requests
{
    public class DeleteModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DeleteModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Request Request { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER" && role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }

            if (id == null)
            {
                return NotFound();
            }

            Request = _unitOfWorkFactory.Get.RequestRepository.GetRequest((int)id);

            if (Request == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Request = _unitOfWorkFactory.Get.RequestRepository.GetRequest((int)id);

            if (Request != null)
            {
                _unitOfWorkFactory.Get.RequestRepository.DeleteRequest(Request);
                _unitOfWorkFactory.Get.Save();
            }

            return RedirectToPage("./Index");
        }
    }
}
