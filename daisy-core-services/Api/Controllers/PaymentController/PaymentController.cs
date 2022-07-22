
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Transactions;
using Domain.Models;
using System;
using Api.Common;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using Api.Services;
using Api.Models;
using Utils;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.PaymentController
{

    //[Authorize]
    [ApiController]
    [Route("v1/payment")]
    public class PaymentController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private MomoPaymentService _paymentService = new MomoPaymentService();

        public PaymentController(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }

        [HttpGet("payment-action/list")]
        [Authorize(Roles = Constants.ROLE.DESIGNER + "," + Constants.ROLE.CUSTOMER)]
        public IList<PaymentAction> GetAllPaymentActionsByUserId()
        {
            using (var work = _unitOfWorkFactory.Get){
                User loginUser = (User)HttpContext.Items["User"];
                var res =  work.PaymentActionRepository.GetAll(p => p.User.Id == loginUser.Id, null, "Payment,User").ToList();
                return res;
            }
        }

        [HttpGet("payment-action/{paymentId}")]
        [Authorize(Roles = Constants.ROLE.DESIGNER + "," + Constants.ROLE.CUSTOMER)]
        public IList<PaymentAction> GetAllPaymentActionsByUserIdAndPaymentId(int paymentId)
        {
            using var work = _unitOfWorkFactory.Get;
            User loginUser = (User)HttpContext.Items["User"];
            return work.PaymentActionRepository.GetAll(p => p.User.Id == loginUser.Id && p.Payment.Id == paymentId, null, "Payment,User").ToList();
        }

        // called by momo only when customer purchased successfully
        [HttpGet("momo/callback")]
        public IActionResult CallBackMomo([FromQuery] MoMoCallBackDto body)
        {
            using var work = _unitOfWorkFactory.Get;
            var paymentAction = work.PaymentActionRepository.GetFirstOrDefault(x => x.OrderId == body.OrderId, "Payment");
            Project project = work.ProjectRepository.GetFirstOrDefault(prj => prj.Payment.Id == paymentAction.Payment.Id, "Payment,Customer,Freelancer");
            if (paymentAction == null || (long)Decimal.Round(paymentAction.Amount) != body.Amount)
            {
                return NotFound();
            }
            if (int.Parse(body.ResultCode) == 0)
            {
                // UPDATE PAYMENT ACTION
                work.PaymentActionRepository.UpdatePaymentActionStatus(paymentAction.Id, Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY);
                //_________________________

                // UPDATE PAYMENT
                work.PaymentRepository.UpdatePaymentStatus(paymentAction.Payment.Id, Constants.PAYMENT_STATUS.WAITING_FOR_SYSTEM, body.Amount);
                //_________________________
            }

            var payload = JObject.Parse(paymentAction.Data);
            project.Status = Constants.PROJECT_STATUS.DONE;

            work.Save();
            return Redirect((string) payload["clientUrl"]);
        }

        [HttpPost("system/callback")]
        public IActionResult CallBackSystemForChecking([FromBody] MoMoCallBackDto body)
        {
            using var work = _unitOfWorkFactory.Get;
            var paymentAction = work.PaymentActionRepository.GetFirstOrDefault(x => x.OrderId == body.OrderId, "Payment");
            if (paymentAction == null || (long)Decimal.Round(paymentAction.Amount) != body.Amount)
            {
                return NotFound();
            }
            if (int.Parse(body.ResultCode) == 0)
            {
                // UPDATE PAYMENT ACTION
                work.PaymentActionRepository.UpdatePaymentActionStatus(paymentAction.Id, Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY);
                //_________________________

                // UPDATE PAYMENT
                work.PaymentRepository.UpdatePaymentStatus(paymentAction.Payment.Id, Constants.PAYMENT_STATUS.WAITING_FOR_SYSTEM, 0);
                //_________________________
            }

            return Ok();
        }

        [HttpPost("customer/momo")]
        [Authorize(Policy = Constants.ROLE.CUSTOMER)]
        public IActionResult GenerateMomoUrlForCustomer([FromBody] DepositoryDto body)
        {
            using var work = _unitOfWorkFactory.Get;

                Payment payment = work.PaymentRepository.GetFirstOrDefault(p => p.Id == body.paymentId);
                Project project = work.ProjectRepository.GetFirstOrDefault(prj => prj.Payment.Id == body.paymentId, "Payment,Customer,Freelancer");
                if (payment == null || project == null)
                {
                    return new JsonResult(new
                    {
                        error = "Something went wrong!!! Payment or project not found!"
                    });
                }
                if(project.Customer.Id != ((User)HttpContext.Items["User"]).Id)
                {
                    return new JsonResult(new
                    {
                        error = "You are not author of the request!"
                    });
                }
                if (payment.Status != Constants.PAYMENT_STATUS.IN_COMPLETE)
                {
                    return new JsonResult(new
                    {
                        error = "You have paid this request!"
                    });
                }
                var user = work.UserRepository.GetUser(((User)HttpContext.Items["User"]).Id);
            // todo: insert payment_action
            PaymentAction action = new PaymentAction()
            {
                    Amount = payment.TotalAmount,
                    OrderId = Guid.NewGuid().ToString(),
                    User = user,
                    Data = JsonConvert.SerializeObject(new {
                        clientUrl = body.RedirectUrl
                    }),
                    Payment = payment,
                    PaymentMethod = Constants.PAYMENT_METHOD.MOMO,
                    Type = Constants.PAYMENT_METHOD.MOMO,
                    Status = Constants.PAYMENT_ACTION_STATUS.FAILED, //initial status is failed => if transaction's status is successfully only -> update status
                };
                int paymentActionId = work.PaymentActionRepository.AddPaymentAction(action);
            // _____________________________
            // update Payment status
            //work.PaymentRepository.UpdatePaymentStatus(payment.Id, Constants.PAYMENT_STATUS.WAITING);
            try
            {
                var momoDeposit = new MoMoDepositDto();
                momoDeposit.Amount = (long)Decimal.Round(payment.TotalAmount);
                
                momoDeposit.OrderId = action.OrderId;
                momoDeposit.OrderInfo = "Purchasing for Daisy, project: " + project.Name;

                momoDeposit.RequestId = action.OrderId;
                momoDeposit.RedirectUrl = $"http://{Config.Get().API_HOST}:{Config.Get().API_PORT}/v1/payment/momo/callback";

                var responseFromMomo = _paymentService.MonoDeposit(momoDeposit);
                work.Save();

                return new JsonResult(new { PaymentRedirectUrl = responseFromMomo });
            }
            catch(Exception ex)
            {
                Console.WriteLine("Some error happend while creating transaction " + ex.Message);
                work.Dispose();
                return new JsonResult(new
                {
                    error = "Something went wrong!!! Error: " + ex.Message
                });
            }
        }

        [HttpPost("system/momo")]
        //[Authorize(Policy = Constants.ROLE.ADMIN)] // chưa có admin
        [Authorize]
        //[SwaggerOperation("Deposit Momo into user wallet")]
        public IActionResult AddPaymentActionBySystemToDesigner([FromBody] DepositoryDto body)
        {
            using var work = _unitOfWorkFactory.Get;
            try
            {
                Payment payment = work.PaymentRepository.GetFirstOrDefault(p => p.Id == body.paymentId);
                Project project = work.ProjectRepository.GetFirstOrDefault(prj => prj.Payment.Id == body.paymentId, "Payment,Customer,Freelancer");
                User freelancer = work.UserRepository.GetFirstOrDefault(u => u.Id == project.Freelancer.Id);
                if (payment == null || project == null)
                {
                    return new JsonResult(new
                    {
                        error = "Something went wrong!!! Payment or project not found!"
                    });
                }
                if (payment.Status == Constants.PAYMENT_STATUS.IN_COMPLETE)
                {
                    return new JsonResult(new
                    {
                        error = "Customer has not paid yet!"
                    });
                }
                if (payment.Status == Constants.PAYMENT_STATUS.IN_COMPLETE)
                {
                    return new JsonResult(new
                    {
                        error = "This payment has completed!"
                    });
                }

                // insert payment_action
                PaymentAction action = new PaymentAction()
                {
                    Amount = payment.Amount,
                    OrderId = Guid.NewGuid().ToString(),
                    User = freelancer,
                    Payment = payment,
                    PaymentMethod = Constants.PAYMENT_METHOD.MOMO,
                    Type = Constants.PAYMENT_TYPE.SYSTEM_PAID,
                    Status = Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY,
                };
                int paymentActionId = work.PaymentActionRepository.AddPaymentAction(action);
                // _____________________________
                // update Payment status
                work.PaymentRepository.UpdatePaymentStatus(payment.Id, Constants.PAYMENT_STATUS.COMPLETE, 0);

                work.Save();
                return Ok();
            }
            catch (Exception ex)
            {
                work.Dispose();
                return new JsonResult(new
                {
                    error = "Something went wrong!!! Error: " + ex.Message
                });
            }

        }

        //[HttpPut("momo")]
        ////[SwaggerOperation("Deposit Momo into user wallet")]
        //public async Task<IActionResult> CompleteTransaction([FromBody] int paymentActions)
        //{
        //    using var work = _unitOfWorkFactory.Get;
        //    try
        //    {
        //        // todo: insert payment_action
        //        PaymentAction action = new PaymentAction()
        //        {
        //            Amount = payment.TotalAmount,
        //            OrderId = Guid.NewGuid().ToString(),
        //            User = (User)HttpContext.Items["User"],
        //            Payment = payment,
        //            PaymentMethod = "MOMO",
        //            Type = "",
        //            Status = Constants.PAYMENT_ACTION_STATUS.PENDING,
        //        };
        //        int paymentActionId = work.PaymentActionRepository.AddPaymentAction(action);
        //        // _____________________________
        //        // update Payment status
        //        work.PaymentRepository.UpdatePaymentStatus(payment.Id, Constants.PAYMENT_STATUS.WAITING);

        //        var momoDeposit = new MoMoDepositDto();
        //        momoDeposit.Amount = (long)Decimal.Round(payment.TotalAmount);

        //        momoDeposit.OrderId = action.OrderId;

        //        momoDeposit.RequestId = action.OrderId;
        //        momoDeposit.RedirectUrl = body.RedirectUrl;

        //        var responseFromMomo = _paymentService.MonoDeposit(momoDeposit);
        //        work.Save();
        //        // trigger scheduled task
        //        UpdateActionPayment(paymentActionId, payment.Status);
        //        return new ObjectResult(responseFromMomo);
        //    }
        //    catch (Exception ex)
        //    {
        //        return new JsonResult(new
        //        {
        //            error = "Something went wrong!!! Error: " + ex.Message
        //        });
        //        work.Dispose();
        //    }

        //}

        //private async Task UpdateActionPayment(int paymentActionId, string initialPaymentStatus) //note the return type of Task. This is required to get the async test 'waitable' by the framework
        //{
        //    await Task.Delay(900000/5); // 15/3 minutes
        //    await Task.Run(async () => //Task.Run automatically unwraps nested Task types!
        //    {
        //        using var work = _unitOfWorkFactory.Get;
        //        var action = work.PaymentActionRepository.GetFirstOrDefault(act => act.Id == paymentActionId, "Payment");
        //        if(action == null)
        //        {
        //            // todo: handle error
        //        }
        //        // this transaction had begun but not finished yet
        //        if (action.Status != Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY && action.Status != Constants.PAYMENT_ACTION_STATUS.CANCELED)
        //        {
        //            work.PaymentActionRepository.UpdatePaymentActionStatus(paymentActionId, Constants.PAYMENT_ACTION_STATUS.FAILED);
        //        }
        //        //if (action.Payment.Status == Constants.PAYMENT_STATUS.WAITING)
        //        //{
        //        //    work.PaymentRepository.UpdatePaymentStatus(action.Payment.Id, initialPaymentStatus);
        //        //}
        //    });
        //    Console.WriteLine("Transaction with payment action Id: " + paymentActionId + " has ended");
        //}
    }
}
