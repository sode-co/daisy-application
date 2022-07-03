using DataAccess.Repositories.Users;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers.CustomerController
{
    [ApiController]
    [Route("v1/users")]
    public partial class UserController : Controller
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
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
        [HttpGet()]
        public IEnumerable<User> GetUsers()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var users = work.UserRepository.GetUsers();

                return users;
            }

        }

        [HttpPut]
        public IActionResult CreateUser(User user)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                work.UserRepository.Add(user);
                work.Save();

                return Created(nameof(GetUser), user);
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult UpdateUser([FromBody] User newUser)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                User user = (User)HttpContext.Items["User"];
                User existingUser = work.UserRepository.Get(user.Id);
                if (existingUser is null) return NotFound();

                existingUser.FirstName = newUser.FirstName;
                existingUser.LastName = newUser.LastName;
                existingUser.DisplayName = newUser.DisplayName;
                existingUser.Role = newUser.Role;
                existingUser.Description = newUser.Description;
                existingUser.Settings = newUser.Settings;
                existingUser.Avatar = newUser.Avatar;
                existingUser.Address = newUser.Address;
                existingUser.Phone = newUser.Phone;

                work.UserRepository.UpdateUser(existingUser);
                work.Save();
            }
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteItem(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var deletedUser = work.UserRepository.Get(id);

                if (deletedUser is null)
                {
                    return NotFound();
                }

                work.UserRepository.DeleteUser(deletedUser);
                work.Save();
                return NoContent();
            }
        }

        [HttpGet("{name}")]
        public IEnumerable<User> GetUsersByName(string name)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var users = work.UserRepository.GetUsersByName(name);
                if (users is null) return (IEnumerable<User>)NotFound();

                return users;
            }
        }
        [HttpGet("designers/customer/{customerId}")]
        public IEnumerable<User> GetDesignersByCustomerId(int customerId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var projectList = work.ProjectRepository.GetAll(null, null, "Customer,Freelancer,Category,Payment,Request");
                IEnumerable<User> designers = work.UserRepository.GetDesignersByCustomerId(customerId, projectList);

                return designers;
            }
        }
    }
}
