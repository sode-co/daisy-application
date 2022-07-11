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
    public class DeleteModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public DeleteModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public ArtWork ArtWork { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork = work.ArtWorkRepository.GetFirstOrDefault(m => m.Id == id);
            }

            if (ArtWork == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(string? returnURL, int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                work.ArtWorkRepository.DeleteArtWork(ArtWork);
            }

            return Redirect(returnURL != null ? returnURL : "./Index");
        }
    }
}
