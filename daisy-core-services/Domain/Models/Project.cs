using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Project : Entity
    {
        [Required]
        public virtual User Customer { get; set; }

        [Required]
        public virtual User Freelancer { get; set; }

        [Required]
        public virtual Category Category { get; set; }

        public DateTime? ResolvedAt { get; set; }

        [MaxLength(int.MaxValue)]
        [Required]
        public String Data { get; set; } = "{}";

        [Required]
        [MaxLength(255)]
        public String PreferredLanguage { get; set; }

        [Required]
        [MaxLength(255)]
        public String Name { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [Required]
        [MaxLength(255)]
        public String ReferenceFile { get; set; }

        [Required]
        public long Timeline { get; set; }

        [Required]
        public decimal Budget { get; set; }

        [Required]
        public bool IsAllowedPublic { get; set; }

        [Required]
        [MaxLength(255)]
        public String Status { get; set; }

        public virtual Payment Payment { get; set; }
        public virtual ICollection<Workspace> Workspaces { get; set; }

        [Required]
        public virtual Request Request { get; set; }

        public override string TableName => "Projects";

        public Project() { }
    }
}
