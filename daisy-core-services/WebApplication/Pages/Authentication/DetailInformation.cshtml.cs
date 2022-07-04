using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using DataAccess.UnitOfWork;

namespace WebApplication.Pages.Authentication
{
    public class DetailInformationModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DetailInformationModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public User User { get; set; }
        [BindProperty]
        public String Email { get; set; }
        public void OnGet(string email)
        {
            Email = email;
        }

        public IActionResult OnPost(User updateUser)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var user = work.UserRepository.GetUsersByEmail(Email);

                if (!ModelState.IsValid)
                {
                    return Page();
                }

                user.FirstName = User.FirstName;
                user.LastName = User.LastName;
                user.Address = User.Address;
                user.Phone = User.Phone;
                user.Role = User.Role;
                work.UserRepository.UpdateUser(user);
                work.Save();

                return RedirectToPage("../Index");
            }
        }
    }
}
