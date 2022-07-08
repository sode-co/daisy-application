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

namespace WebApplication.Pages.Areas.Customers.Projects
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public string CurrentFilter { get; set; }
        public PaginatedList<Project> Project { get; set; }

        public async Task OnGetAsync(int? pageIndex)
        {
            IQueryable<Project> projects = _unitOfWorkFactory.Get.ProjectRepository.GetAll();
            Project = await PaginatedList<Project>.CreateAsync(projects.AsNoTracking(), pageIndex ?? 1, 10);
        }
    }
}
