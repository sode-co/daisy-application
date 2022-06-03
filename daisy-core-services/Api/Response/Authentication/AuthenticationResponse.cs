using Api.Common;
using Microsoft.AspNetCore.Mvc;

namespace Api.Models.Authentication
{
    public class AuthenticationResponse
    {
        public static ActionResult Failed() =>
            new StatusCodeResult(Constants.STATUS_CODE.AUTH_FAILED);

        public static ActionResult Success(string RefreshToken, string AccessToken) =>
            new OkObjectResult(new { RefreshToken, AccessToken });
    }
}
