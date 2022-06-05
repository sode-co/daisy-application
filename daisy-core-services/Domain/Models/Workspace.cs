using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class Workspace : Entity
    {
        [Required]
        [MaxLength(255)]
        public String Status { get; set; }

        [Required]
        public virtual Request Request { get; set; }

        [Required]
        public virtual Project Project { get; set; }

        public virtual ICollection<Discussion> Discussions { get; set; }
        public virtual ICollection<Resource> Resources { get; set; }

        public override string TableName => "Workspaces";
    }
}
