using AutoMapper;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Utils.Authentication;
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

        [Authorize]
        //[Authorize(Policy = ROLE.DESIGNER)]
        // GET v1/discussions/workspace/:workspaceId
        [HttpGet("workspace/{workspaceId}")]
        public IList<Discussion> GetDiscussionsByWorkspaceId(int workspaceId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var discussions = work.DiscussionRepository.GetAll(j => j.Workspace.Id == workspaceId, null, "Sender,Workspace").ToList();
                return discussions;
            }
        }

        [Authorize(Policy = ROLE.CUSTOMER)]
        [Authorize(Policy = ROLE.DESIGNER)]
        // GET v1/discussions"workspace/{workspaceId}/{discussionId}"
        [HttpGet("workspace/{workspaceId}/{discussionId}")]
        public Discussion GetDiscussionByDiscussionId(int workspaceId, int discussionId)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var discussion = work.DiscussionRepository.GetFirstOrDefault(j => j.Workspace.Id == discussionId, "Sender,Workspace");
                if (discussion != null && discussion.Workspace.Id == workspaceId)
                {
                    return discussion;
                }
                return null;
            }
        }

        [Authorize(Policy = ROLE.CUSTOMER)]
        [Authorize(Policy = ROLE.DESIGNER)]
        // POST v1/discussions/workspace/:workspaceId
        [HttpPost("workspace/{workspaceId}")]
        public JsonResult InsertNewDiscussion(int workspaceId, Discussion dis)
        {
            try
            {
                int senderId = ((User)HttpContext.Items["User"]).Id;

                using (var work = _unitOfWorkFactory.Get)
                {
                    User sender = work.UserRepository.Get(senderId);
                    Workspace workspace = work.WorkspaceRepository.Get(workspaceId);
                    Discussion discussion = new Discussion()
                    {
                        Type = dis.Type,
                        Sender = sender,
                        Workspace = workspace,
                        Content = dis.Content,
                        Status = DISCUSSION_STATUS.SENT,
                    };
                    work.DiscussionRepository.Add(discussion);
                    work.Save();
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

        [Authorize(Policy = ROLE.CUSTOMER)]
        [Authorize(Policy = ROLE.DESIGNER)]
        // DELETE v1/discussions"workspace/{workspaceId}/{discussionId}"
        [HttpDelete("workspace/{workspaceId}/{discussionId}")]
        public JsonResult DeleteDiscussion(int workspaceId, int discussionId)
        {
            try
            {
                int senderId = ((User)HttpContext.Items["User"]).Id;

                using (var work = _unitOfWorkFactory.Get)
                {
                    Discussion dis = work.DiscussionRepository.GetFirstOrDefault(d => d.Id == discussionId, "Sender");
                    if (dis.Sender.Id != senderId)
                    {
                        throw new Exception("You are not authorized to delete this message!");
                    }
                    dis.Status = DISCUSSION_STATUS.REMOVED;
                    work.DiscussionRepository.RemoveDiscussion(workspaceId, discussionId, DISCUSSION_STATUS.REMOVED);
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
