using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Project
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public virtual User Customer { get; set; }

        [Required]
        public virtual User Freelancer { get; set; }

        [Required]
        public virtual Category Category { get; set; }

        public DateTime? ResolvedAt { get; set; }

        public String Data { get; set; }

        [Required]
        [MaxLength(255)]
        public String PreferredLanguage { get; set; }

        [Required]
        [MaxLength(255)]
        public String Name { get; set; }

        [Required]
        [MaxLength(255)]
        public String Description { get; set; }

        [Required]
        [MaxLength(255)]
        public String ReferenceFile { get; set; }

        [Required]
        public long Timeline { get; set; }

        [Required]
        public int Budget { get; set; }

        [Required]
        public bool IsAllowedPublic { get; set; }

        [Required]
        public int Status { get; set; }

        public virtual Payment Payment { get; set; }

        public virtual ICollection<Workspace> Workspaces { get; set; }

        [Required]
        public virtual Request Request { get; set; }
        


        [Required]
        public DateTime CreatedAt { get; set; }

        [Required]
        public DateTime UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }
        public Project() { }
    }
}
