using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace Api.Controllers.CategoryController
{
    [ApiController]
    [Route("v1/categories")]
    public partial class CategoryController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public CategoryController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet()]
        public IActionResult GetCategories()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var categories = work.CategoryRepository.GetAll(null, null, "ChildrenCategory").ToList();

                return new JsonResult(new { categories = categories });
            }
        }

        [HttpGet("/parents")]
        public IActionResult GetParentCategories()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var parentCategories = work.CategoryRepository.GetParentCategories();

                return new JsonResult(new { parentCategories = parentCategories });
            }
        }

        [HttpGet("/childrens/parent")]
        public IActionResult GetChildCategories(string parentName)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var childCategories = work.CategoryRepository.GetChildCategories(parentName);

                return new JsonResult(new { childCategories = childCategories });
            }
        }

        [HttpGet("/detail/name")]
        public IActionResult GetCategoryByName(string name)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var category = work.CategoryRepository.GetCategoryByName(name);

                return new JsonResult(new { category = category });
            }
        }
    }
}
