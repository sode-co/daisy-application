﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models
{
    public class Notification
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public String Description { get; set; }

        [Required]
        public virtual User Receiver { get; set; }

        [Required]
        [MaxLength(255)]
        public String Title { get; set; }

        public String Data { get; set; }

        [Required]
        [MaxLength(255)]
        public String Type { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        [Required]
        public DateTime UpdatedAt { get; set; }

        public DateTime? DeletedAt { get; set; }

        [Required]
        public String ObjectId { get; set; }

        public Notification() { }
    }
}
