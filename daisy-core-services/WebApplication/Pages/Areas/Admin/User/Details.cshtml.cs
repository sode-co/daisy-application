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

namespace WebApplication.Pages.UserCRUD
{
    public class DetailsModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DetailsModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public Domain.Models.User User { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string role = UserAuthentication.Role();

            if (role != "ADMIN")
            {
                return Redirect("/Unauthorized");
            }

            if (id == null)
            {
                return NotFound();
            }

            User = _unitOfWorkFactory.Get.UserRepository.GetUser((int)id);

            if (User == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
