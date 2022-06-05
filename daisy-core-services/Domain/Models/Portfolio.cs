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
    public class Portfolio : Entity
    {
        [Required]
        public bool IsActive { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Biography { get; set; }

        [Required]
        public virtual User Freelancer { get; set; }

        public override string TableName => "Portfolios";

        public Portfolio() { }
    }
}
