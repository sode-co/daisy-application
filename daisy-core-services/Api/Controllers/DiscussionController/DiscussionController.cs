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

namespace Api.Controllers.DiscussionController
{
    [Route("v1/discussions")]
    [ApiController]
    public partial class DiscussionController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private IMapper _mapper;

        public DiscussionController(UnitOfWorkFactory unitOfWorkFactory, IMapper mapper)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
            _mapper = mapper;
        }

        // GET v1/discussions/workspace/:workspaceId
        [HttpGet("workspace/{workspaceId}")]
        public IEnumerable<DiscussionVM> GetDiscussionsByWorkspaceId(int workspaceId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var discussions = work.DiscussionRepository.GetAll(j => j.Workspace.Id == workspaceId, null, "Sender,Workspace");
                var result = _mapper.Map<IEnumerable<Discussion>, IEnumerable<DiscussionVM>>(discussions);
                return result;
            }
        }

        // POST v1/discussions/workspace/:workspaceId
        [HttpPost("workspace/{workspaceId}")]
        public JsonResult InsertNewDiscussion(int workspaceId, DiscussionVM dis)
        {
            try
            {
                UserExposeModel sender = (UserExposeModel)HttpContext.Items["User"];
                using (var work = _unitOfWorkFactory.Get)
                {
                    
                    return Json(new { message = "ok" });
                }
            }
            catch (Exception er)
            {
                return Json(new
                {
                    message = "Something went wrong!!!",
                    detail = er.Message
                });
            }
        }
    }
}
