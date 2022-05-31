using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class ArtWork
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [MaxLength(255)]
        [Required]
        public String Description { get; set; }

        [MaxLength(255)]
        [Required]
        public String Image { get; set; }

        [Required]
        public virtual Portfolio Portfolio { get; set; }

        [Required]
        public virtual Category Category { get; set; }

        [MaxLength(255)]
        [Required]
        public String Title { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }

        public virtual ICollection<Resource> Resources { get; set; }

        public ArtWork() { }
    }
}
