using DataAccess.Repositories.Users;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers.UserController
{
    [ApiController]
    [Route("v1/users")]
    public partial class UserController : Controller
    {

        protected UnitOfWorkFactory _unitOfWorkFactory;
        public UserController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet("category/{id}")]
        public IEnumerable<User> GetDesignersByCategory(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var designers = _unitOfWorkFactory.Get.UserRepository.GetDesignersByCategory(id);
                if (designers is null)
                {
                    return (IEnumerable<User>)NotFound();
                }
                return designers;
            }

        }

    }
}
