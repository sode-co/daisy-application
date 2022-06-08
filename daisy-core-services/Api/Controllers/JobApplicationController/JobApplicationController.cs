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
    [Route("v1/applications")]
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
        // GET: v1/applications/list
        [HttpGet("list")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public IEnumerable<JobApplicationVM> GetJobApplicationByFreelancerId()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                UserExposeModel user = (UserExposeModel) HttpContext.Items["User"];
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
