using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Request
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public virtual User Customer { get; set; }

        [Required]
        public virtual ArtWorkType ArtWorkType { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Title { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Description { get; set; }

        public virtual Request ParentRequest { get; set; }

        public virtual ICollection<Request> Items { get; set; }

        [Required]
        public int Status { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        [Required]
        public DateTime UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        public String ObjectId { get; set; }

        public Request() { }
    }
}
