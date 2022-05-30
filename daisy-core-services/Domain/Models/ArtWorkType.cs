using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class ArtWorkType
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Description { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Name { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }
        
        [Required]
        public DateTime UpdatedAt { get; set; }
        
        public DateTime? DeletedAt { get; set; }
        
        [Required]
        public String ObjectId { get; set; }

        public ArtWorkType() { }
    }
}
