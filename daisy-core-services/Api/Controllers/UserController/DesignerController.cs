using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Utils.Authentication;
using Utils.Models;

namespace Api.Controllers.UserController
{
    [AllowAnonymous]
    [Route("api/designer")]
    [ApiController]
    public class DesignerController : ControllerBase
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public DesignerController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpPost("update-profile")]
        public IActionResult UpdateDesignerProfile([FromHeader] string authorization, [FromBody]UserVM userVM)
        {
            JwtToken jwt = new JwtToken();
            int designerId = jwt.ValidateAccessToken(authorization).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                var user = work.UserRepository.Get(designerId);
                if (user != null)
                {
                    user.FirstName = userVM.FirstName;
                    user.LastName = userVM.LastName;
                    user.DisplayName = userVM.DisplayName;
                    user.Address = userVM.Address;
                    user.Phone = userVM.Phone;

                    work.Save();
                    return Ok(user);
                }

                return NotFound();
            }
        }


    }
}
