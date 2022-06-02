using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class JobApplication
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public virtual User Freelancer { get; set; }

        public DateTime? ResolvedAt { get; set; }

        [Required]
        public virtual Request Request { get; set; }

        [MaxLength(255)]
        public String Description { get; set; }

        [Required]
        [MaxLength(255)]
        public String PreferredLanguage { get; set; }

        [Required]
        public long Timeline { get; set; }

        [Required]
        public decimal Budget { get; set; }

        public String Data { get; set; }

        [Required]
        [MaxLength(255)]
        public String Status { get; set; }
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }

        public JobApplication() { }
    }
}
