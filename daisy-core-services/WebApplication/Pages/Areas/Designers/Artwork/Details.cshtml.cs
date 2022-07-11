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

namespace WebApplication.Pages.Areas.Designers.Artwork
{
    public class DetailsModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;

        public DetailsModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        public ArtWork ArtWork { get; set; }

        public async Task<IActionResult> OnGetAsync(string? returnURL, int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork = work.ArtWorkRepository.GetAll().FirstOrDefault(m => m.Id == id);
            }

            if (ArtWork == null)
            {
                return NotFound();
            }
            return Redirect(returnURL != null ? returnURL : "./Index");
        }
    }
}
