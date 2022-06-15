using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utils.Models;
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

        [Authorize]
        [HttpPost()]
        public IActionResult CreatePortfolio([FromBody] PortfolioVM portfolioVM)
        {
            int designerId = ((UserExposeModel)HttpContext.Items["User"]).Id;

            using (var work = _unitOfWorkFactory.Get)
            {
                User freelancer = work.UserRepository.Get(designerId);
                if (freelancer != null)
                {
                    work.PortfolioRepository.Add(new Portfolio()
                    {
                        Freelancer = freelancer,
                        Biography = portfolioVM.biography
                    });

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
    }
}
