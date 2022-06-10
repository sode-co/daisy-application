using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Utils.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.UserController
{
    public partial class UserController : Controller
    {

        [Authorize]
        [HttpGet("/v1/user")]
        public IActionResult GetPersonalInfo()
        {
            UserExposeModel model = (UserExposeModel)HttpContext.Items["User"];
            return new JsonResult(model);
        }
    }
}
