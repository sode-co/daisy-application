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

        [HttpGet("{id}")]
        public ActionResult<User> GetUser(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var user = work.UserRepository.Get(id);

                if (user is null)
                {
                    return NotFound();
                }

                return user;
            }   
        }
        [HttpGet]
        public IEnumerable<User> GetUsers()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var users = work.UserRepository.GetUsers();

                return users;
            }

        }

        [HttpPost("create")]
        public IActionResult CreateUser(User user)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                work.UserRepository.Add(user);

                return Created(nameof(GetUser), user);
            }
        }

        //[HttpPut("{id}")]
        //public ActionResult UpdateUser(int id, User newUser)
        //{
        //    using (var work = _unitOfWorkFactory.Get)
        //    {
        //        var existingUser = work.UserRepository.Get(id);
        //        if (existingUser is null)
        //        {
        //            return NotFound();
        //        }
        //        User updateUser = existingUser with
        //        {
        //            FirstName = newUser.Name,
        //            Price = newUser.Price
        //        };

        //        work.UserRepository.UpdateUser(updateUser);

        //    }
        //    return NoContent();
        //}

        [HttpDelete("delete/{id}")]
        public ActionResult DeleteItem(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var deletedUser = work.UserRepository.Get(id);

                if (deletedUser is null)
                {
                    return NotFound();
                }

                work.UserRepository.Remove(id);
                return NoContent();
            }               
        }
    }
}
