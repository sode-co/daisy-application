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

namespace WebApplication.Pages.Areas.Designers
{
    public class IndexModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public IndexModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public IList<Domain.Models.Portfolio> Portfolio { get;set; }

        public async Task OnGetAsync()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                Portfolio = await work.PortfolioRepository.GetAll().ToListAsync();
            }
        }
    }
}
