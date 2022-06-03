using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Resource
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public String FileType { get; set; }

        [Required]
        [MaxLength(255)]
        public String WorkStatus { get; set; }

        public virtual ICollection<ArtWork> ArtWorks { get; set; }

        public virtual Workspace Workspace { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }

        public Resource() { }
    }
}
