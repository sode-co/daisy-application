﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class User : Entity
    {
        [MaxLength(255)]
        public String FirstName { get; set; }

        [MaxLength(255)]
        public String LastName { get; set; }

        [MaxLength(255)]
        public String DisplayName { get; set; }

        [EmailAddress]
        public String Email { get; set; }

        public String Role { get; set; }

        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(int.MaxValue)]
        public String Settings { get; set; } = "{}";

        [MaxLength(255)]
        public String Avatar { get; set; }

        [MaxLength(255)]
        public String Address { get; set; }

        public String Phone { get; set; }
        public override string TableName { get => "Users"; }

        public User() { }
    }
}
