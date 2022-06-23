using Api.Common;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace Api.Controllers.UserController
{

    [Route("v1/designers")]
    [ApiController]
    public class DesignerController : ControllerBase
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public DesignerController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [Authorize]
        [HttpPut()]
        public IActionResult UpdateDesignerProfile([FromBody] User body)
        {
            int designerId = ((User) HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                var user = work.UserRepository.Get(designerId);
                if (user != null)
                {
                    user.FirstName = body.FirstName;
                    user.LastName = body.LastName;
                    user.DisplayName = body.DisplayName;
                    user.Address = body.Address;
                    user.Phone = body.Phone;

                    work.Save();
                    return Ok(user);
                }

                return Ok(designerId);
            }
        }
    }
}
