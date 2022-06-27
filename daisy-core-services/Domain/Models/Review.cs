using System;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class Review : Entity
    {
        public virtual Portfolio Portfolio { get; set; }

        [MaxLength(int.MaxValue)]
        public String Content { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "";

        public virtual ArtWork ArtWork { get; set; }

        public bool Like { get; set; }

        public float Rating { get; set; }

        public virtual User User { get; set; }

        public override string TableName => "Reviews";

        public Review() { }
    }
}
