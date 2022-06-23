using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class AuthToken : Entity
    {
        [MaxLength(500)]
        public String RefreshToken { get; set; }

        public virtual User User { get; set; }

        public override string TableName => "AuthTokens";

        public AuthToken()
        {
        }
    }
}
