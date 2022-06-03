using Api.Common;
using Microsoft.AspNetCore.Mvc;
using Utils;

namespace Api.Models
{
    public class FailedResponse
    {
        public static IActionResult AuthFailed(string message = "")
        {
            var response = message == "" ? new JsonResult(new { message }) : null;
            response.StatusCode = Constants.STATUS_CODE.AUTH_FAILED;
            return response;
        }
    }
}
