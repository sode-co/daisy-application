using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Areas.Customers.Requests
{
    public class CreateModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public CreateModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public Request request { get; set; }
        [BindProperty]
        public string category { get; set; }

        public IActionResult OnGet()
        {
            string role = UserAuthentication.Role();

            if (role != "CUSTOMER")
            {
                return Redirect("/Unauthorized");
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                var parentCategories = work.CategoryRepository.GetParentCategories();
                ViewData["CategoryName"] = new SelectList(parentCategories, "Name", "Name");
            }
            return Page();
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            using (var work = _unitOfWorkFactory.Get)
            {
                var email = UserAuthentication.UserLogin.Email;
                var user = work.UserRepository.GetUsersByEmail(email);
                request.Category = work.CategoryRepository.GetCategoryByName(category);
                request.Customer = user;
                request.Status = "AVAILABLE";
                work.RequestRepository.CreateRequest(request);
                work.Save();
            }
            return RedirectToPage("./Index");
        }

    }
}
