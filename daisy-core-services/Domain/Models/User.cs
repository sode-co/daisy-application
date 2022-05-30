using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String FirstName { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String LastName { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String DisplayName { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Email { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Password { get; set; }
        
        [Range(0,9)]
        [Required]
        public int Role { get; set; }
        
        [MaxLength(255)]
        [Required]
        public String Description { get; set; }
        
        [Required]
        public String Settings { get; set; }
        
        [MaxLength(255)]
        public String Avatar { get; set; }
        
        [MaxLength(255)]
        public String Address { get; set; }
        
        [Range(0,9999999999)]
        public int Phone { get; set; }
        
        [Required]
        public DateTime CreatedAt { get; set; }
        
        [Required]
        public DateTime UpdatedAt { get; set; }
        
        public DateTime? DeletedAt { get; set; }
        
        [Required]
        public String ObjectId { get; set; }

        public User() { }
    }
}
