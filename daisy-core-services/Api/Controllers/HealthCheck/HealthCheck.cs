
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.HealthCheck
{

    [AllowAnonymous]
    [ApiController]
    public class HealthCheck : Controller
    {
        [HttpGet("/v1/healthcheck")]
        public JsonResult Index()
        {
            return Json(new { message = "Ok" });
        }
    }
}
