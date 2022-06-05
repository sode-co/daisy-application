using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace Domain.Models
{
    public class PaymentAction : Entity
    {
        [Required]
        public virtual User User { get; set; }

        [Required]
        [MaxLength(255)]
        public String PaymentMethod { get; set; }

        [Required]
        public virtual Payment Payment { get; set; }

        [Required]
        public decimal Amount { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        [Required]
        public String Type { get; set; }

        public override string TableName => "PaymentActions";

        public PaymentAction() { }
    }
}
