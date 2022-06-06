using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Utils;
using Utils.Authentication;

namespace Api.Middlewares
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class AuthenticationMiddleware
    {
        JwtToken _jwtToken;

        private readonly RequestDelegate _next;

        public AuthenticationMiddleware(RequestDelegate next, JwtToken jwtToken)
        {
            _jwtToken = jwtToken;
            _next = next;
        }

        public Task Invoke(HttpContext httpContext)
        {
            var authorization = httpContext.Request.Headers["Authorization"];
            var token = authorization.ToString().Split(' ').Offset<string>(-1);

            var userData = _jwtToken.ValidateAccessToken(token);

            if (userData != null)
            {
                Console.WriteLine("Authentication middleware" + userData.DisplayName);
                httpContext.Items.Add("User", userData);
            }

            return _next(httpContext);
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class AuthenticationExtensions
    {
        public static IApplicationBuilder useAuthenticationMiddleWare(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<AuthenticationMiddleware>();
        }
    }
}
