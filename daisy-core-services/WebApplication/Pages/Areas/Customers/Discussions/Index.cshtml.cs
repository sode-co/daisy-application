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

namespace WebApplication.Pages.Areas.Customers.Discussions
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Discussion> Discussion { get;set; }

        public async Task OnGetAsync(int? workspaceId)
        {
            var work = _unitOfWorkFactory.Get;
            Discussion = work.DiscussionRepository.GetAll((d) => d.Workspace.Id == workspaceId, null, "Workspace").ToList(); ;
        }
    }
}
