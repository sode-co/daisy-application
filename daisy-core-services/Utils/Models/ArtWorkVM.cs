using Domain.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class ArtWorkVM : ArtWork
    {
        [NotMapped]
        public String Description { get; set; }

        [NotMapped]
        public String ObjectId { get; set; }

        [Required]
        public int CategoryId { get; set; }

        public String Title { get; set; }
    }
}
