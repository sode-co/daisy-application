using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Project : Entity
    {
        public virtual User Customer { get; set; }

        public virtual User Freelancer { get; set; }

        public virtual Category Category { get; set; }

        public DateTime? ResolvedAt { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        [MaxLength(255)]
        public String PreferredLanguage { get; set; }

        [MaxLength(255)]
        public String Name { get; set; }

        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        public DateTime Timeline { get; set; }

        public decimal Budget { get; set; }

        public bool IsAllowedPublic { get; set; }

        [MaxLength(255)]
        public String Status { get; set; }

        public virtual Payment Payment { get; set; }
        public virtual ICollection<Workspace> Workspaces { get; set; }

        public virtual Request Request { get; set; }

        public override string TableName => "Projects";

        public Project() { }
    }
}
