using System;
using System.ComponentModel.DataAnnotations;
using BusinessObject;

namespace Domain.Models
{
    public class Review : Entity
    {
        [Required]
        public virtual Portfolio Portfolio { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Content { get; set; }

        [Required]
        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "";

        [Required]
        public virtual ArtWork ArtWork { get; set; }

        [Required]
        public bool Like { get; set; }

        public float Rating { get; set; }

        [Required]
        public virtual User User { get; set; }

        public override string TableName => "Reviews";

        public Review() { }
    }
}
