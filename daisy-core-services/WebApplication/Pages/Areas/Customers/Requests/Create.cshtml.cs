using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;

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

        public void OnGet()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var parentCategories = work.CategoryRepository.GetParentCategories();
                ViewData["CategoryName"] = new SelectList(parentCategories, "Name", "Name");
            }
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            using (var work = _unitOfWorkFactory.Get)
            {
                string email = "ngocptse150112@fpt.edu.vn";
                request.Category = work.CategoryRepository.GetCategoryByName(category);
                var user = work.UserRepository.GetUsersByEmail(email);
                request.Customer = user;
                request.Status = "AVAILABLE";
                work.RequestRepository.CreateRequest(request);
                work.Save();
            }
            return RedirectToPage("./Index");
        }

    }
}
