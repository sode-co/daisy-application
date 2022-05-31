using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class PaymentAction
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public virtual User User { get; set; }

        [Required]
        [MaxLength(255)]
        public String PaymentMethod { get; set; }

        [Required]
        public virtual Payment Payment { get; set; }

        [Required]
        public int Amount { get; set; }

        public String Data { get; set; }

        [Required]
        public String Type { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        [MaxLength(255)]
        public String ObjectId { get; set; }

        public PaymentAction() { }
    }
}
