using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.UserCRUD
{
    public class EditModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public EditModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public User User { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string role = UserAuthentication.Role();

            if (role.Equals(""))
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

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            using var work = _unitOfWorkFactory.Get;
            work.UserRepository.UpdateUser(User);
            work.Save();
            string role = UserAuthentication.Role();
            if(role.Equals("ADMIN"))
            {
                return RedirectToPage("./Index");
            }
            else
            {
                return RedirectToPage("/Index");
            }
        }
    }
}
