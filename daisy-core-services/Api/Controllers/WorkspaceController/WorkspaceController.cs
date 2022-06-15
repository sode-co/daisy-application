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

namespace Api.Controllers.WorkspaceController
{
    [Route("v1/workspaces")]
    [ApiController]
    public partial class WorkspaceController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private IMapper _mapper;

        public WorkspaceController(UnitOfWorkFactory unitOfWorkFactory, IMapper mapper)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _mapper = mapper;
        }

        // GET v1/workspaces/:id
        [HttpGet("{workspaceId}")]
        public WorkspaceVM GetWorkspaceById(int workspaceId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var workspace = work.WorkspaceRepository.GetFirstOrDefault(w => w.Id == workspaceId, "Project,Request,Discussions,Resources");
                var result = _mapper.Map<Workspace, WorkspaceVM>(workspace);
                return result;
            }
        }

        // GET v1/workspaces/request/:requestId
        [HttpGet("request/{requestId}")]
        public IEnumerable<WorkspaceVM> GetWorkspacesByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var workspace = work.WorkspaceRepository.GetAll(j => j.Request.Id == requestId, null, "Project,Request,Discussions,Resources");
                var result = _mapper.Map<IEnumerable<Workspace>, IEnumerable<WorkspaceVM>>(workspace);
                return result;
            }
        }

        // GET v1/workspaces/project/:projectId
        [HttpGet("project/{projectId}")]
        public IEnumerable<WorkspaceVM> GetListWorkspaceOfProject(int projectId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var workspace = work.WorkspaceRepository.GetAll(j => j.Project.Id == projectId, null, "Project,Request,Discussions,Resources");
                var result = _mapper.Map<IEnumerable<Workspace>, IEnumerable<WorkspaceVM>>(workspace);
                return result;
            }
        }
    }
}
