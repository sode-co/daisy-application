using Api.Common;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using Utils.Models;
using System.Linq;

namespace Api.Controllers.UserController
{

    [Route("v1/designer")]
    [ApiController]
    public class DesignerController : ControllerBase
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public DesignerController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [Authorize]
        [HttpPut("profile")]
        public IActionResult UpdateDesignerProfile([FromBody] UserExposeModel userVM)
        {
            int designerId = ((UserExposeModel) HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                var user = work.UserRepository.Get(designerId);
                if (user != null)
                {
                    user.FirstName = userVM.FirstName;
                    user.LastName = userVM.LastName;
                    user.DisplayName = userVM.DisplayName;
                    user.Address = userVM.Address;
                    user.Phone = userVM.Phone;

                    work.Save();
                    return Ok(user);
                }

                return Ok(designerId);
            }
        }

        [Authorize]
        [HttpPost("portfolio")]
        public IActionResult CreatePortfolio([FromBody] PortfolioVM portfolioVM)
        {
            int designerId = ((UserExposeModel) HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(designerId);
                if (freelancer != null)
                {
                    work.PortfolioRepository.Add(new Portfolio()
                    {
                        Freelancer = freelancer,
                        Biography = portfolioVM.biography,
                        CreatedAt = DateTime.Now
                    });
                    work.Save();

                    return Ok();
                }

                return NotFound();
            }
        }

        [Authorize]
        [HttpPost("job-application")]
        public IActionResult CreateJobApplication([FromBody] JobApplicationVM jobApplicationVM)
        {
            int freelancerId = ((UserExposeModel) HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(freelancerId);
                Request request;
                if (freelancer != null)
                {
                    request = work.RequestRepository.Get(jobApplicationVM.RequestId);
                    if (request != null)
                    {
                        work.JobApplicationRepository.Add(new JobApplication()
                        {
                            CreatedAt = DateTime.Now,
                            Request = request,
                            Freelancer = freelancer,
                            Description = jobApplicationVM.Description,
                            PreferredLanguage = jobApplicationVM.PreferedLanguage,
                            Timeline = jobApplicationVM.Timeline,
                            Status = Constants.STATUS_JOB_APPLICATION.PENDING,
                            OfferedPrice = jobApplicationVM.Budget
                        });
                        work.Save();
                        return Ok();
                    }

                }

                return NotFound();
            }
        }

    }
}
