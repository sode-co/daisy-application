using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Review
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public virtual Portfolio Portfolio { get; set; }

        [Required]
        [MaxLength(255)]
        public String Content { get; set; }

        public String Data { get; set; }

        [Required]
        public virtual ArtWork ArtWork { get; set; }

        [Required]
        public bool Like { get; set; }

        public int Rating { get; set; }

        [Required]
        public virtual User User { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }

        public Review() { }
    }
}
