using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Discussion : Entity
    {
        [Required]
        public virtual User Sender { get; set; }

        [Required]
        [MaxLength(255)]
        public String Type { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Content { get; set; }

        [Required]
        public virtual Workspace Workspace { get; set; }

        [Required]
        [MaxLength(255)]
        public String Status { get; set; }

        public override string TableName => "Discussions";
    }
}
