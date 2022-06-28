using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace WebApplication.Pages.Areas.Customers.Request
{
    public class CreateModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public CreateModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public DateTime timeline;
        public void OnGet()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var parentCategories = work.CategoryRepository.GetParentCategories();
                ViewData["CategoryId"] = new SelectList(parentCategories, "Id", "Name");
            }
        }
    }
}
