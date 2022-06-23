using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class Category : Entity
    {
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(455)]
        public String Name { get; set; }

        [MaxLength(255)]
        public String Type { get; set; }

        public virtual ICollection<Category> ParentCategory { get; set; }

        public virtual ICollection<Category> ChildrenCategory { get; set; }

        public override string TableName => "Categories";

        public Category() { }
    }
}
