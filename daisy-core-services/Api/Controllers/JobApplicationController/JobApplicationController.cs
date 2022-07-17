using Api.Common;
using AutoMapper;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using static Api.Common.Constants;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.JobApplicationController
{
    [Route("v1/application")]
    [ApiController]
    public partial class JobApplicationController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private IMapper _mapper;

        public JobApplicationController(UnitOfWorkFactory unitOfWorkFactory, IMapper mapper)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _mapper = mapper;
        }

        [Authorize]
        [HttpPost()]
        public IActionResult CreateJobApplication([FromBody] JobApplication body)
        {
            int freelancerId = ((User)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(freelancerId);
                Request request;
                if (freelancer == null) return NotFound();

                request = work.RequestRepository.Get(body.Request.Id);
                if (request == null) return NotFound();

                work.JobApplicationRepository.Add(new JobApplication()
                {
                    Request = request,
                    Freelancer = freelancer,
                    Description = body.Description,
                    PreferredLanguage = body.PreferredLanguage,
                    Timeline = body.Timeline,
                    Status = Constants.STATUS_JOB_APPLICATION.PENDING,
                    OfferedPrice = body.OfferedPrice
                });

                work.Save();
                return Ok();
            }
        }

        // GET: v1/applications
        [HttpGet("")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IEnumerable<JobApplication> GetJobApplicationByFreelancerId()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                User user = (User)HttpContext.Items["User"];
                var jobApplications = work.JobApplicationRepository.GetAll(j => j.Freelancer.Id == user.Id, null, "Freelancer,Request");
                var result = _mapper.Map<IEnumerable<JobApplication>, IEnumerable<JobApplication>>(jobApplications);
                return result;
            }
        }

        // GET v1/applications/:id
        [HttpGet("{jobApplicationId}")]
        public JobApplication GetJobApplicationByJobApplicationId(int jobApplicationId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var jobApplication = work.JobApplicationRepository.GetFirstOrDefault(j => j.Id == jobApplicationId, "Freelancer,Request");
                var result = _mapper.Map<JobApplication, JobApplication>(jobApplication);
                return result;
            }
        }

        // GET v1/applications/request/{requestId}
        [HttpGet("request/{requestId}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IEnumerable<JobApplication> GetJobApplicationByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var jobApplications = work.JobApplicationRepository.GetAll(j => j.Request.Id == requestId, null, "Freelancer,Request");
                var result = _mapper.Map<IEnumerable<JobApplication>, IEnumerable<JobApplication>>(jobApplications);
                return result;
            }
        }

        [HttpPut()]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult ApproveJobApplication(int requestId, string freelancerEmail)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                // Update status of request
                User customer = (User)HttpContext.Items["User"];
                Request request = work.RequestRepository.GetFirstOrDefault(r => r.Id == requestId, "Category");
                User freelancer = work.UserRepository.GetUsersByEmail(freelancerEmail);
                request.Status = Constants.REQUEST_STATUS.TAKEN;

                // Create Payment object to save to Project
                Payment payment = new Payment()
                {
                    Status = Constants.PAYMENT_STATUS.IN_COMPLETE,
                    // amount of money has been paid
                    Amount = 0,
                    Currency = Constants.PAYMENT_CURRENCY.VND,
                    // amount of money must to paid
                    TotalAmount = (decimal)request.Budget,
                };

                // From Request info create Project
                Project project = new()
                {
                    Customer = work.UserRepository.Get(customer.Id),
                    Freelancer = freelancer,
                    Category = request.Category,
                    Name = request.Title,
                    Description = request.Description,
                    Timeline = request.Timeline,
                    Budget = (decimal)request.Budget,
                    Status = Constants.PROJECT_STATUS.IN_PROGRESS,
                    Request = request,
                    Payment = payment
                };

                work.ProjectRepository.Add(project);
                work.Save();

                // Create workspace?
                Workspace workspace = new()
                {
                    Status = Constants.WORKSPACE_STATUS.IN_PROGRESS,
                    Request = request,
                    Project = work.ProjectRepository.GetFirstOrDefault(pro => pro.Id == project.Id, "Customer,Freelancer,Category,Payment,Request")
                };

                work.WorkspaceRepository.Add(workspace);
                work.Save();

                return Ok();
            }
        }
    }
}
