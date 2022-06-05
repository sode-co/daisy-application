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

        [Required]
        [MaxLength(255)]
        public String Status { get; set; }

        [Required]
        public decimal Amount { get; set; }

        [Required]
        [MaxLength(255)]
        public String Currency { get; set; }

        [MaxLength(int.MaxValue)]
        [Required]
        public String Data { get; set; } = "{}";

        [Required]
        public decimal TotalAmount { get; set; }

        [Required]
        public int Commission { get; set; }

        public override string TableName => "Payments";

        public Payment() { }
    }
}
