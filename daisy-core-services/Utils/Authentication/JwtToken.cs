using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Utils.Models;

namespace Utils.Authentication
{
    public class JwtToken
    {
        public JwtToken()
        {
        }

        private Claim[] _getClaims(UserExposeModel user) => new[] {
            new Claim("id", user.Id.ToString()),
            new Claim("email", user.Email.ToString()),
            new Claim("firstName", user.FirstName.ToString()),
            new Claim("lastName", user.LastName.ToString()),
            new Claim("phone", user.Phone.ToString()),
            new Claim("role", user.Role.ToString()),
            new Claim("address", user.Address.ToString()),
            new Claim("displayName", user.DisplayName.ToString()),
            new Claim("avatar", user.Avatar.ToString()),
            new Claim("settings", user.Settings.ToString()),
        };

        public string GenerateAccessToken(UserExposeModel user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Config.Get().ACCESS_TOKEN_SECRET);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(_getClaims(user)),
                Expires = DateTime.UtcNow.AddMinutes(15),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        public string GenerateRefreshToken(UserExposeModel user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Config.Get().REFRESH_TOKEN_SECRET);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(_getClaims(user)),
                Expires = DateTime.UtcNow.AddYears(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
