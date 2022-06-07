using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Request : Entity
    {
        [Required]
        public virtual User Customer { get; set; }

        [Required]
        public virtual Category Category { get; set; }

        [MaxLength(255)]
        [Required]
        public String Title { get; set; }

        [MaxLength(255)]
        [Required]
        public String Description { get; set; }

        public decimal? Budget { get; set; }

        public virtual Request ParentRequest { get; set; }

        public virtual ICollection<Request> Items { get; set; }

        [Required]
        [MaxLength(255)]
        public String Status { get; set; }

        public override string TableName => "Requests";

        public Request() { }
    }
}
