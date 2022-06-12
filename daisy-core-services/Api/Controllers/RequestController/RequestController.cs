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
                var user = (UserExposeModel) HttpContext.Items["User"];
                List<RequestJobPostVM> requestJobPostVmList = requestJobPostVM.Items;
                User customer = work.UserRepository.Get(user.Id);
                Category category = work.CategoryRepository.Get(requestJobPostVM.CategoryId);

                Request parentRequest = new()
                {
                    Customer = customer,
                    Category = category,
                    Title = requestJobPostVM.Title,
                    Description = requestJobPostVM.Description,
                    Budget = requestJobPostVM.Budget,
                    ParentRequest = null,
                    Status = REQUEST_STATUS.AVAILABLE,
                };

                parentRequest.Items = requestJobPostVmList.Select(request => {
                    var item = _mapper.Map<RequestJobPostVM, Request>(request);
                    item.Customer = customer;
                    item.Category = category;
                    item.ParentRequest = parentRequest;
                    return item;
                }).ToList();

                work.RequestRepository.Add(parentRequest);
                work.Save();
                return Ok();
            }
        }

        [HttpPut("/{requestId}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult UpdateRequest([FromBody] RequestVM requestVM, int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                // Get Request obj from DB
                Request request = work.RequestRepository.GetFirstOrDefault(req => req.Id == requestId);
                
                // Update data of each field
                request.Category = work.CategoryRepository.GetFirstOrDefault(cate => cate.Id == requestVM.categoryId);
                request.Description = requestVM.description;
                request.Title = requestVM.title;
                request.Status = requestVM.status;

                // Save
                work.Save();
            }
                
            return Ok();
        }

        [HttpGet("/{title}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IActionResult FindRequestsByTitle(string title)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                // Get All Requests which given title 
                IEnumerable<RequestVM> requestVMs = work.RequestRepository.GetRequestsByTitle(title).Select(reqObj => new RequestVM()
                {
                    categoryId = reqObj.Category.Id,
                    title = reqObj.Title,
                    description = reqObj.Description,
                    status = reqObj.Status
                });

                return Ok(requestVMs);
            }
        }
    }
}