﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Models.Authentication;
using DataAccess.UnitOfWork;
using Domain.Models;
using Google.Apis.Auth;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Utils;
using Utils.Authentication;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.Authentication
{
    public partial class AuthenticationController : Controller
    {
        [AllowAnonymous]
        [HttpPost("v1/auth/signin")]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> IndexAsync([FromHeader] string authorization)
        {
            var token = authorization.Split(' ')[1];
            var validationSettings = new GoogleJsonWebSignature.ValidationSettings
            {
                Audience = new string[] { Config.Get().GOOGLE_CLIENT_ID }
            };

            GoogleJsonWebSignature.Payload payload = await GoogleJsonWebSignature.ValidateAsync(token, validationSettings);
            string email = payload.Email;

            using (var work = _unitOfWorkFactory.Get)
            {
                var users = work.UserRepository.GetAll((u) => u.Email.Equals(email));
                if (users.Count() > 0)
                {
                    string accessToken = _jwtToken.GenerateAccessToken(users.First());
                    string refreshToken = _jwtToken.GenerateRefreshToken(users.First());
                    return AuthenticationResponse.Success(refreshToken, accessToken);
                }
            }

            return AuthenticationResponse.Failed();
        }
    }
}
