using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Utils;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.Authentication
{
    public partial class AuthenticationController
    {
        [HttpGet("/v1/auth/access-token")]
        public IActionResult Index([FromHeader] string authorization)
        {
            var token = authorization.Split(' ')[1];
            Console.WriteLine("Generating new access token from refresh token " + token);
            var userData = _jwtToken.ValidateRefreshToken(token);

            if (userData == null)
            {
                return AuthenticationResponse.Failed();
            }

            using var work = _unitOfWorkFactory.Get;
            var user = work.UserRepository.GetUsersByEmail(userData.Email);
            var newAccessToken = _jwtToken.GenerateAccessToken(user);
            return AuthenticationResponse.Success(RefreshToken: "", AccessToken: newAccessToken);
        }
    }
}
