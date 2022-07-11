using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DataAccess.MssqlServerIntegration;
using Domain.Models;
using DataAccess.UnitOfWork;

namespace WebApplication.Pages.Areas.Designers.Artwork
{
    public class EditModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public EditModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [BindProperty]
        public ArtWork ArtWork { get; set; }

        public async Task<IActionResult> OnGetAsync(string? returnURL, int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork = await work.ArtWorkRepository.GetAll().FirstOrDefaultAsync(m => m.Id == id);
            }

            if (ArtWork == null)
            {
                return NotFound();
            }
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync(string? returnURL)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                ArtWork.UpdatedAt = DateTime.Now;
                work.ArtWorkRepository.UpdateArtWork(ArtWork);
                work.Save();
            }

            return Redirect(returnURL != null ? returnURL : "./Index" );
        }

    }
}
