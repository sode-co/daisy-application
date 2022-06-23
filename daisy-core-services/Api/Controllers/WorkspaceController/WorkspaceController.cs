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
        public Workspace GetWorkspaceById(int workspaceId)
        {
            using var work = _unitOfWorkFactory.Get;
            return work.WorkspaceRepository.GetFirstOrDefault(w => w.Id == workspaceId, "Project,Request,Discussions,Resources");
        }

        // GET v1/workspaces/request/:requestId
        [HttpGet("request/{requestId}")]
        public IEnumerable<Workspace> GetWorkspacesByRequestId(int requestId)
        {
            using (var work = _unitOfWorkFactory.Get)
            return work.WorkspaceRepository.GetAll(j => j.Request.Id == requestId, null, "Project,Request,Discussions,Resources");
        }

        // GET v1/workspaces/project/:projectId
        [HttpGet("project/{projectId}")]
        public IEnumerable<Workspace> GetListWorkspaceOfProject(int projectId)
        {
            using var work = _unitOfWorkFactory.Get;
            return work.WorkspaceRepository.GetAll(j => j.Project.Id == projectId, null, "Project,Request,Discussions,Resources");
        }
    }
}
