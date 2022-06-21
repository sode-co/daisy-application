using Api.Common;
using AutoMapper;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Utils.Authentication;
using Utils.Models;
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
        public IActionResult CreateJobApplication([FromBody] JobApplicationVM jobApplicationVM)
        {
            int freelancerId = ((UserExposeModel)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(freelancerId);
                Request request;
                if (freelancer == null) return NotFound();

                request = work.RequestRepository.Get(jobApplicationVM.RequestId);
                if (request == null) return NotFound();

                work.JobApplicationRepository.Add(new JobApplication()
                {
                    Request = request,
                    Freelancer = freelancer,
                    Description = jobApplicationVM.Description,
                    PreferredLanguage = jobApplicationVM.PreferedLanguage,
                    Timeline = jobApplicationVM.Timeline,
                    Status = Constants.STATUS_JOB_APPLICATION.PENDING,
                    OfferedPrice = jobApplicationVM.OfferedPrice
                });

                work.Save();
                return Ok();
            }
        }

        // GET: v1/applications/list
        [HttpGet("list")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IEnumerable<JobApplicationVM> GetJobApplicationByFreelancerId()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                UserExposeModel user = (UserExposeModel)HttpContext.Items["User"];
                var jobApplications = work.JobApplicationRepository.GetAll(j => j.Freelancer.Id == user.Id, null, "Freelancer,Request");
                var result = _mapper.Map<IEnumerable<JobApplication>, IEnumerable<JobApplicationVM>>(jobApplications);
                return result;
            }
        }

        // GET v1/applications/:id
        [HttpGet("{jobApplicationId}")]
        public JobApplicationVM GetJobApplicationByJobApplicationId(int jobApplicationId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var jobApplication = work.JobApplicationRepository.GetFirstOrDefault(j => j.Id == jobApplicationId, "Freelancer,Request");
                var result = _mapper.Map<JobApplication, JobApplicationVM>(jobApplication);
                return result;
            }
        }

        // GET v1/applications/request/{requestId}
        [HttpGet("request/{requestId}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IEnumerable<JobApplicationVM> GetJobApplicationByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var jobApplications = work.JobApplicationRepository.GetAll(j => j.Request.Id == requestId, null, "Freelancer,Request");
                var result = _mapper.Map<IEnumerable<JobApplication>, IEnumerable<JobApplicationVM>>(jobApplications);
                return result;
            }
        }
    }
}
