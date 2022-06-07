using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers.RequestController
{
    [ApiController]
    [Route("v1/requests")]
    public partial class RequestController : Controller
    {

        private UnitOfWorkFactory _unitOfWorkFactory;
        public RequestController(UnitOfWorkFactory unitOfWorkFactory)
        {
            this._unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpPost]
        public ActionResult CreateRequest(Request request)
        {

            using (var work = _unitOfWorkFactory.Get)
            {
                work.RequestRepository.CreateRequest(request);
               
                return null;
            }

        }
    }
}