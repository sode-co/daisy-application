using Api.Models.Authentication;
using AutoMapper;
using System.Linq;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using static Api.Common.Constants;
using System.Collections.Generic;
using Utils;
using System;

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
        public IActionResult CreateRequest([FromBody] Request body)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var user = (User)HttpContext.Items["User"];
                List<Request> requestItems = body.Items.ToList();
                User customer = work.UserRepository.Get(user.Id);
                Category category = work.CategoryRepository.Get(body.Category.Id);

                Request request = new()
                {
                    Customer = customer,
                    Category = category,
                    Title = body.Title,
                    Description = body.Description,
                    Budget = body.Budget,
                    Timeline = body.Timeline,
                    ParentRequest = null,
                    Status = REQUEST_STATUS.AVAILABLE,
                };

                request.Items = requestItems.Select(item =>
                {
                    item.Customer = customer;
                    item.Category = category;
                    item.ParentRequest = request;
                    item.Category = work.CategoryRepository.Get(item.Category.Id);

                    return item;
                }).ToList();

                work.RequestRepository.Add(request);
                work.Save();
                return Json(new { message = "ok" });
            }
        }

        [HttpPatch("{requestId}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult UpdateAllFieldRequest([FromBody] Request Request, int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                Request request = work.RequestRepository.GetFirstOrDefault(req => req.Id == requestId);
                
                request.Category = work.CategoryRepository.GetFirstOrDefault(cate => cate.Id == Request.Category.Id);
                request.Description = Request.Description.Or(request.Description);
                request.Title = Request.Title.Or(request.Title);
                request.Status = Request.Status.Or(request.Status);
                request.Budget = Request.Budget.Or(request.Budget);

                work.Save();
            }

            return Json(new { message = "ok" });
        }

        [HttpPut("{requestId}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult UpdateFieldsRequest([FromBody] Request Request, int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                Request request = work.RequestRepository.GetFirstOrDefault(req => req.Id == requestId);

                // Update data of each field
                request.Category = work.CategoryRepository.GetFirstOrDefault(cate => cate.Id == Request.Category.Id);
                request.Description = Request.Description;
                request.Title = Request.Title;
                request.Status = Request.Status;
                request.Budget = Request.Budget;

                work.Save();
            }

            return Json(new { message = "ok" });
        }

        [HttpGet("title/{title}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IEnumerable<Request> FindRequestsByTitle(string title)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                IEnumerable<Request> requests = work.RequestRepository.GetRequestsByTitle(title);

                return requests;
            }
        }

        [Authorize]
        [HttpGet("category/{categoryId}")]
        public IEnumerable<Request> FindRequestsByCategoryId(int categoryId)
        {
            int freelancerId = ((User)HttpContext.Items["User"]).Id;
            using var work = _unitOfWorkFactory.Get;
            return work.RequestRepository.GetAll((request => request.Category.Id == categoryId)).ToList();
        }

        [AllowAnonymous]
        [HttpGet("{id}")]
        public IActionResult GetRequest(int id)
        {

            using var work = _unitOfWorkFactory.Get;
            var request = work.RequestRepository.Get(id);

            return NotFound();
        }

    }
}