using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.UserController
{
    public partial class UserController : Controller
    {

        [Authorize]
        [HttpGet("/v1/user")]
        public IActionResult GetPersonalInfo()
        {
            User model = (User)HttpContext.Items["User"];
            return new JsonResult(model);
        }
    }
}
