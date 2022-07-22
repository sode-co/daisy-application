using AutoMapper;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
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
        public IActionResult GetProjectById(int projectId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var projects = work.ProjectRepository.GetAll(project => project.Id == projectId, null, "Customer,Freelancer,Category,Payment,Request,Workspaces");
                if (projects.Count() == 0) return NotFound();

                var p = projects.First();

                return Ok(p);
            }
        }

        // GET v1/project/request/:requestId
        [HttpGet("request/{requestId}")]
        public IEnumerable<Project> GetProjectsByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var project = work.ProjectRepository.GetAll(prj => prj.Request.Id == requestId, null, "Customer,Freelancer,Category,Payment,Request");
                var result = _mapper.Map<IEnumerable<Project>, IEnumerable<Project>>(project);
                return result;
            }
        }

        // POST v1/project
        [HttpPost]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public JsonResult CreateProjectAndWorkspaceWhenApproveJobApplication(JObject project)
        {
            try
            {
                User loginUser = (User)HttpContext.Items["User"];
                using (var work = _unitOfWorkFactory.Get)
                {
                    int applicationId = (int)project["jobApplicationId"];
                    bool IsAllowedPublic = (bool)project["isAllowedPublic"];
                    work.ProjectRepository.CreateProjectAndWorkspace(applicationId, IsAllowedPublic, PROJECT_STATUS.IN_PROGRESS, REQUEST_STATUS.TAKEN, REQUEST_STATUS.TAKEN, loginUser.Id);
                    work.Save();
                    return Json(new { message = "ok" });
                }
            } catch (Exception er)
            {
                return Json(new { 
                    message = "Something went wrong!!!",
                    detail = er.Message
                });
            }

        }

        // DELETE v1/project
        [HttpDelete]
        public JsonResult DeactivateProject(int projectId)
        {
            User loginUser = (User)HttpContext.Items["User"];
            try
            {
                using (var work = _unitOfWorkFactory.Get)
                {
                    work.ProjectRepository.DeactivateProject(projectId, PROJECT_STATUS.CANCELED, REQUEST_STATUS.AVAILABLE, loginUser.Id);
                    work.Save();
                    return Json(new { message = "ok" });
                }
            } catch (Exception er)
            {
                return Json(new
                {
                    message = "Something went wrong!!!",
                    detail = er.Message
                });
            }
        }

        // GET v1/project/list
        [HttpGet("list")]
        public IEnumerable<Project> GetListAllProject()
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var project = work.ProjectRepository.GetAll(null, null,"Customer,Freelancer,Category,Payment,Request");
                var result = _mapper.Map<IEnumerable<Project>, IEnumerable<Project>>(project);
                return result;
            }
        }

        // GET v1/project/title
        [HttpGet("title/{keyword}")]
        public IEnumerable<Project> SearchListProjectByTitle(string keyword)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var project = work.ProjectRepository.GetAll(pro => pro.Request.Title.ToLower().Contains(keyword.ToLower()), null, "Customer,Freelancer,Category,Payment,Request");
                var result = _mapper.Map<IEnumerable<Project>, IEnumerable<Project>>(project);
                return result;
            }
        }

        [HttpGet("")]
        public IEnumerable<Project> GetProjects()
        {
            using var work = _unitOfWorkFactory.Get;
            User loginUser = (User)HttpContext.Items["User"];
            return work.ProjectRepository.GetAll((project) =>
                      (project.Customer.Id.Equals(loginUser.Id) || project.Freelancer.Id.Equals(loginUser.Id)),
                   null, "Customer,Freelancer,Category,Payment,Request").OrderByDescending((x) => x.CreatedAt).ToList();
        }

        [HttpGet("status/{status}")]
        [Authorize]
        public IEnumerable<Project> GetProjectByStatus(string status)
        {
            using var work = _unitOfWorkFactory.Get;
            User loginUser = (User)HttpContext.Items["User"];
            return work.ProjectRepository.GetAll((project) =>
                      (project.Customer.Id == loginUser.Id || project.Freelancer.Id == loginUser.Id) &&
                      status.Equals(project.Status),
                   null, "Customer,Freelancer,Category,Payment,Request").OrderByDescending((x) => x.CreatedAt).ToList();
        }
    }
}