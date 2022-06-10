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

        [HttpPost()]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult CreateRequest([FromBody] RequestJobPostVM requestJobPostVM)
        {

            using (var work = _unitOfWorkFactory.Get)
            {
                var user = (UserExposeModel)HttpContext.Items["User"];
                List<RequestJobPostVM> requestJobPostVmList = requestJobPostVM.Items;
                User customer = work.UserRepository.Get(user.Id);
                Category category = work.CategoryRepository.Get(requestJobPostVM.CategoryId);

                Request requestParent = new()
                {
                    Customer = customer,
                    Category = category,
                    Title = requestJobPostVM.Title,
                    Description = requestJobPostVM.Description,
                    Budget = requestJobPostVM.Budget,
                    ParentRequest = null,
                    Status = REQUEST_STATUS.AVAILABLE,

                };

                var requestItemList = requestJobPostVmList.Select(
                        request => _mapper.Map<RequestJobPostVM, Request>(request)).ToList();
                foreach (var request in requestItemList)
                {
                    request.Customer = customer;
                    request.Category = category;
                }

                requestParent.Items = requestItemList;
                requestItemList.ForEach(request => request.ParentRequest = requestParent);
                requestParent.Items = requestItemList;

                work.RequestRepository.Add(requestParent);
                work.Save();

                return Ok();
            }
        }
    }
}