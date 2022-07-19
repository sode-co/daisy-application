using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static Api.Common.Constants;

namespace Api.Controllers.PortfolioController
{
    [Route("v1/portfolios")]
    [ApiController]
    public class PortfolioController : ControllerBase
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public PortfolioController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [Authorize(Policy = ROLE.DESIGNER)]
        [HttpPost()]
        public IActionResult CreatePortfolio([FromBody] Portfolio body)
        {
            int designerId = ((User)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(designerId);
                if (freelancer != null)
                {
                    work.PortfolioRepository.Add(new Portfolio()
                    {
                        IsActive = body.IsActive,
                        Freelancer = freelancer,
                        Biography = body.Biography
                    });

                    work.Save();

                    return Ok();
                }

                return NotFound();
            }
        }

        [Authorize(Policy = ROLE.DESIGNER)]
        [HttpPut()]
        public IActionResult UpdatePortfolio([FromBody] Portfolio body)
        {
            int designerId = ((User)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(designerId);
                var portfolioList = work.PortfolioRepository.GetAll(null, null, "Freelancer");
                Portfolio portfolio = portfolioList.FirstOrDefault(p => p.Freelancer.Id == designerId);
                if (freelancer != null && portfolio != null)
                {
                    portfolio.IsActive = body.IsActive;
                    portfolio.Biography = body.Biography;
                    portfolio.UpdatedAt = DateTime.Now;
                    work.PortfolioRepository.UpdatePortfolio(portfolio);
                    work.Save();

                    return Ok();
                }

                return NotFound();
            }
        }

        [HttpDelete("{id}")]
        [Authorize(Policy = ROLE.DESIGNER)]
        public ActionResult DeletePortfolio(int id)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var deletedPort = work.PortfolioRepository.Get(id);
                if (deletedPort is null) return NotFound();
                work.PortfolioRepository.DeletePortfolio(deletedPort);
                work.Save();
                return NoContent();
            }
        }

        [HttpGet("{designerEmail}")]
        [Authorize(Policy = ROLE.CUSTOMER)]
        public IActionResult GetPortfolioByEmail(string designerEmail)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                var portfolioList = work.PortfolioRepository.GetAll(null, null, "Freelancer");
                Portfolio portfolio = portfolioList.FirstOrDefault(p => p.Freelancer.Email == designerEmail);
                if (portfolio is null) return NotFound();
                return new JsonResult(new { portfolio = portfolio }); ;
            }
        }
    }
}
