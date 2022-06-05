using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Utils.Authentication;

namespace Api.Middlewares
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class Authentication
    {
        JwtToken _jwtToken;

        private readonly RequestDelegate _next;

        public Authentication(RequestDelegate next, JwtToken jwtToken)
        {
            _jwtToken = jwtToken;
            _next = next;
        }

        public Task Invoke(HttpContext httpContext)
        {
            var authorization = httpContext.Request.Headers["Authorization"];
            var token = authorization.ToString().Split(' ')[1];

            var userData = _jwtToken.ValidateAccessToken(token);

            return _next(httpContext);
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class AuthenticationExtensions
    {
        public static IApplicationBuilder UseMiddlewareClassTemplate(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<Authentication>();
        }
    }
}
