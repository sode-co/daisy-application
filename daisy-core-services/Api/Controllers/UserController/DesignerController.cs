﻿using Api.Common;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using Utils.Models;
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
        public IActionResult UpdateDesignerProfile([FromBody] UserExposeModel userVM)
        {
            int designerId = ((UserExposeModel) HttpContext.Items["User"]).Id;

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

                return Ok(designerId);
            }
        }
    }
}
