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

        [Authorize]
        [HttpGet("requests/{categoryId}")]
        public IActionResult FindRequestsByCategoryId(int categoryId)
        {
            int freelancerId = ((UserExposeModel)HttpContext.Items["User"]).Id;
            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(freelancerId);
                if (freelancer != null)
                {
                    //System.Collections.ArrayList<RequestVM> arrayListRequestVM = new ArrayList<RequestVM>();
                    System.Collections.Generic.IEnumerable<RequestVM> requestVMs = work.RequestRepository.GetRequestsByCategoryId(categoryId);
                    return Ok(requestVMs);
                }
            }
            return NotFound();
        }

    }
}