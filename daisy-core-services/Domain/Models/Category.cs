﻿using System;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class Category : Entity
    {
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(455)]
        [Required]
        public String Name { get; set; }

        [MaxLength(255)]
        [Required]
        public String Type { get; set; }

        public override string TableName => "Categories";

        public Category() { }
    }
}
