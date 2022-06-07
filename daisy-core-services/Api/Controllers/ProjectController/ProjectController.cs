using AutoMapper;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Utils;
using Utils.Authentication;
using Utils.Models;
using static Api.Common.Constants;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.ProjectController
{
    [Route("v1/project")]
    [ApiController]
    public partial class ProjectController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private IMapper _mapper;

        public ProjectController(UnitOfWorkFactory unitOfWorkFactory, IMapper mapper)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _mapper = mapper;
        }

        // GET v1/project/:projectId
        [HttpGet("{projectId}")]
        public ProjectVM GetProjectById(int projectId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var project = work.ProjectRepository.GetFirstOrDefault(project => project.Id == projectId, "Customer,Freelancer,Category,Payment,Request");
                var result = _mapper.Map<Project, ProjectVM>(project);
                return result;
            }
        }

        // GET v1/project/request/:requestId
        [HttpGet("request/{requestId}")]
        public IEnumerable<ProjectVM> GetProjectsByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var project = work.ProjectRepository.GetAll(prj => prj.Request.Id == requestId, null, "Customer,Freelancer,Category,Payment,Request");
                var result = _mapper.Map<IEnumerable<Project>, IEnumerable<ProjectVM>>(project);
                return result;
            }
        }

        // POST v1/project
        [HttpPost]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public void CreateProjectAndWorkspaceWhenApproveJobApplication(JObject project)
        {
            //using (var work = _unitOfWorkFactory.Get)
            //{
            //    int applicationId = (int) project["jobApplicationId"];
            //    JobApplication jobApplication = work.JobApplicationRepository.GetFirstOrDefault(j => j.Id == applicationId, "Freelancer,Request");
            //    Request request = work.RequestRepository.GetFirstOrDefault(r => r.Id == jobApplication.Request.Id, "Customer,Category");
            //    Project pro = new Project()
            //    {
            //        Customer = work.UserRepository.Get(request.Customer.Id),
            //        Freelancer = jobApplication.Freelancer,
            //        Category = request.Category,
            //        Data = jobApplication.Data,
            //        PreferredLanguage = jobApplication.PreferredLanguage,
            //        Name = request.Title,
            //        Description = request.Description,
            //        Timeline = jobApplication.Timeline,
            //        Budget = request.Budget ?? jobApplication.OfferedPrice,
            //        IsAllowedPublic = (bool) project["IsAllowedPublic"],
            //        Status = PROJECT_STATUS.IN_PROGRESS,
            //    };
            //    work.ProjectRepository.Add(pro);
            //    work.Save();
            //}
        }
    }
}
