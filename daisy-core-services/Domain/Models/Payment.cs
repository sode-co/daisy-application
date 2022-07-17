using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Payment : Entity
    {
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(255)]
        public String Status { get; set; }

        public decimal Amount { get; set; }

        [MaxLength(255)]
        public String Currency { get; set; }

        public ICollection<PaymentAction> PaymentActions { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        public decimal TotalAmount { get; set; }

        public int Commission { get; set; }

        public override string TableName => "Payments";

        public Payment() { }
    }
}
