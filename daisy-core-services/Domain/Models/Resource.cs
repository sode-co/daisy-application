using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Resource : Entity
    {
        [MaxLength(255)]
        public String FileType { get; set; }

        [MaxLength(255)]
        public String FileName { get; set; }

        [MaxLength(255)]
        public String WorkStatus { get; set; }

        [MaxLength(255)]
        public String ResourceKey { get; set; }

        public virtual ICollection<ArtWork> ArtWorks { get; set; }

        public virtual Workspace Workspace { get; set; }

        public override string TableName => "Resources";

        public Resource() { }
    }
}
