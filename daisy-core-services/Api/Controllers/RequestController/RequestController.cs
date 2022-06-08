using Api.Models.Authentication;
using AutoMapper;
using System.Linq;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;

using Microsoft.AspNetCore.Mvc;

using Utils.Models;
using static Api.Common.Constants;
using System.Collections.Generic;

namespace Api.Controllers.RequestController
{
    [AllowAnonymous]
    [ApiController]
    [Route("v1/requests")]
    public partial class RequestController : Controller
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        private IMapper _mapper;
        public RequestController(UnitOfWorkFactory unitOfWorkFactory, IMapper mapper)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
            this._mapper = mapper;
        }

        [HttpPost("create")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult CreateRequest([FromBody] RequestVM requestVM)
        {

            using (var work = _unitOfWorkFactory.Get)
            {
                var user = (UserExposeModel)HttpContext.Items["User"];

                Request requestParent = new()
                {
                    Customer = new User() { Id = user.Id },
                    Category = new Category() { Id = requestVM.CategoryId },
                    Title = requestVM.Title,
                    Description = requestVM.Description,
                    ParentRequest = null,
                    Items = listRequest,
                };

                work.RequestRepository.Add(requestParent);
                work.Save();

            return Ok();


        }
    }

}
}