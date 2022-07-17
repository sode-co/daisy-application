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
        public virtual User User { get; set; }

        [MaxLength(255)]
        public String PaymentMethod { get; set; }

        public String OrderId { get; set; }

        public virtual Payment Payment { get; set; }

        public decimal Amount { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        public String Type { get; set; }
        public String Status { get; set; }

        public override string TableName => "PaymentActions";

        public PaymentAction() { }
    }
}
