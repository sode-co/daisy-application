using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Discussion : Entity
    {
        public virtual User Sender { get; set; }

        [MaxLength(255)]
        public String Type { get; set; }

        [MaxLength(int.MaxValue)]
        public String Content { get; set; }

        public virtual Workspace Workspace { get; set; }

        [MaxLength(255)]
        public String Status { get; set; }

        public override string TableName => "Discussions";
    }
}
