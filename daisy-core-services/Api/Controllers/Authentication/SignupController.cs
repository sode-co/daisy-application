using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Utils.Authentication;
using Google.Apis.Auth;
using System.Threading.Tasks;
using static Utils.Utils;
using Utils;
using System;
using Api.Models.Authentication;
using Newtonsoft.Json;
using System.Collections.Generic;
using Domain.Models;
using AutoMapper;
using Utils.Models;
using static Api.Common.Constants;

namespace Api.Controllers.Authentication
{
    public class _SignupRequest
    {
        public string Role;
        public string DisplayName;
        public string PhoneNumber;
    }

    public partial class AuthenticationController : Controller
    {
        private readonly UnitOfWorkFactory _unitOfWorkFactory;
        private readonly JwtToken _jwtToken;
        private readonly IMapper _mapper;

        public AuthenticationController(UnitOfWorkFactory unitOfWorkFactory, JwtToken jwtToken, IMapper mapper)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _jwtToken = jwtToken;
            _mapper = mapper;
        }

        [HttpPost("v1/auth/signup")]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Index([FromHeader] string authorization, [FromBody] _SignupRequest body)
        {
            var token = authorization.Split(' ')[1];
            Console.WriteLine("Received token " + token);
            var validationSettings = new GoogleJsonWebSignature.ValidationSettings
            {
                Audience = new string[] { Config.Get().GOOGLE_CLIENT_ID }
            };


            GoogleJsonWebSignature.Payload payload = await GoogleJsonWebSignature.ValidateAsync(token, validationSettings);
            string email = payload.Email;

            //if (!IsFptOrganization(email)) return AuthenticationResponse.Failed();

            string lastName = payload.FamilyName;
            string firstName = payload.Name.Split(' ').Offset<string>(-1).Or(payload.GivenName);
            string displayName = body.DisplayName.Or(payload.GivenName).Or(payload.Name);
            string settings = JsonConvert.SerializeObject(new Dictionary<string, string>() {
                    { "locale", payload.Locale }
                });
            string avatar = payload.Picture;

            User addedUser;
            using (var work = _unitOfWorkFactory.Get)
            {
                User user = work.UserRepository.GetFirstOrDefault((user) => user.Email.ToLower() == email.ToLower());
                if (user != null) return AuthenticationResponse.Failed();

                User newUser = new User()
                {
                    Email = email,
                    LastName = lastName,
                    FirstName = firstName,
                    DisplayName = displayName,
                    Settings = settings,
                    Avatar = avatar,
                    Role = ROLE.CUSTOMER
                };

                work.UserRepository.Add(newUser);

                work.Save();
            }

            using (var work = _unitOfWorkFactory.Get)
            {
                addedUser = work.UserRepository.GetFirstOrDefault((user) => user.Email.ToLower() == email.ToLower());
            }

            if (addedUser == null) return AuthenticationResponse.Failed();

            string accessToken = _jwtToken.GenerateAccessToken(_mapper.Map<User, UserExposeModel>(addedUser));
            string refreshToken = _jwtToken.GenerateRefreshToken(_mapper.Map<User, UserExposeModel>(addedUser));
            return AuthenticationResponse.Success(refreshToken, accessToken);
        }
    }
}
