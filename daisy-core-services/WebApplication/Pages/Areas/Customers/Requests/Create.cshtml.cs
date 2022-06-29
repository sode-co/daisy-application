using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

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
        public Domain.Models.Request request { get; set; }

        public void OnGet()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var parentCategories = work.CategoryRepository.GetParentCategories();
                ViewData["CategoryName"] = new SelectList(parentCategories, "Id", "Name");
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
                request.Items = null;
                work.RequestRepository.CreateRequest(request);
            }
            return RedirectToPage("./Index");
        }

    }
}
