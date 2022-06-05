﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class User : Entity
    {
        [MaxLength(255)]
        [Required]
        public String FirstName { get; set; }

        [MaxLength(255)]
        [Required]
        public String LastName { get; set; }

        [MaxLength(255)]
        [Required]
        public String DisplayName { get; set; }

        [Required]
        [EmailAddress]
        public String Email { get; set; }

        [Range(0, 9)]
        [Required]
        public String Role { get; set; }

        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(int.MaxValue)]
        [Required]
        public String Settings { get; set; } = "{}";

        [MaxLength(255)]
        public String Avatar { get; set; }

        [MaxLength(255)]
        public String Address { get; set; }

        [Phone]
        public String Phone { get; set; }
        public override string TableName { get => "Users"; }

        public User() { }
    }
}
