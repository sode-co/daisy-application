using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class ArtWork : Entity
    {
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(455)]
        public String Image { get; set; }

        public virtual Portfolio Portfolio { get; set; }

        public virtual Category Category { get; set; }

        [MaxLength(455)]
        public String Title { get; set; }

        [MaxLength(int.MaxValue)]
        [System.ComponentModel.DefaultValue("{}")]
        public String Data { get; set; } = "{}";

        public virtual ICollection<Resource> Resources { get; set; }

        public override string TableName => "ArtWorks";

        public ArtWork() { }
    }
}
