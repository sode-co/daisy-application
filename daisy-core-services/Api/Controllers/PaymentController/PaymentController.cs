
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Transactions;
using Api.Controllers.PaymentServices;
using Domain.Models;
using System;
using Api.Common;
using System.Threading.Tasks;


// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.PaymentController
{

    //[Authorize]
    [ApiController]
    [Route("v1/payment")]
    public class PaymentController : Controller
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        private PaymentService _paymentService = new PaymentService();

        public PaymentController(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }
        [HttpPost("momo/callback")]
        //[SwaggerOperation("Call Back Momo into user wallet")]
        public IActionResult CallBackMomo([FromBody] MoMoCallBackDto body)
        {
            //var res = new ServiceApiResponse<Transaction>();
            using var work = _unitOfWorkFactory.Get;

            //
            var action = work.PaymentActionRepository.GetFirstOrDefault(x => x.OrderId == body.OrderId, "Payment");
            if (action == null || (long)Decimal.Round(action.Amount) != body.Amount)
            {
                return NotFound();
            }
                // UPDATE PAYMENT ACTION
                work.PaymentActionRepository.UpdatePaymentActionStatus(action.Id, Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY);
                //_________________________

                // UPDATE PAYMENT
                work.PaymentRepository.UpdatePaymentStatus(action.Payment.Id, Constants.PAYMENT_STATUS.SUCCESSFULLY);
                //_________________________

                return Ok();
        }

        [HttpPost("momo")]
        //[SwaggerOperation("Deposit Momo into user wallet")]
        public async Task<IActionResult> DepositoryMomo([FromBody] DepositoryDto body) {
            using var work = _unitOfWorkFactory.Get;
            try
            {
                Payment payment = work.PaymentRepository.Get(body.paymentId);
                string initialPaymentStatus = payment.Status;
                if (initialPaymentStatus != Constants.PAYMENT_STATUS.PENDING && initialPaymentStatus != Constants.PAYMENT_STATUS.URGENT)
                {
                    return new JsonResult(new
                    {
                        error = "This transaction had begun or completed!"
                    });
                }

                // todo: insert payment_action
                PaymentAction action = new PaymentAction()
                {
                    Amount = payment.TotalAmount,
                    OrderId = Guid.NewGuid().ToString(),
                    User = (User)HttpContext.Items["User"],
                    Payment = payment,
                    PaymentMethod = "MOMO",
                    Type = "",
                    Status = Constants.PAYMENT_ACTION_STATUS.PENDING,
                };
                int paymentActionId = work.PaymentActionRepository.AddPaymentAction(action);
                // _____________________________
                // update Payment status
                work.PaymentRepository.UpdatePaymentStatus(payment.Id, Constants.PAYMENT_STATUS.WAITING);

                var momoDeposit = new MoMoDepositDto();
                momoDeposit.Amount = (long)Decimal.Round(payment.TotalAmount);
                
                momoDeposit.OrderId = action.OrderId;
                
                momoDeposit.RequestId = action.OrderId;
                momoDeposit.RedirectUrl = body.RedirectUrl;

                var responseFromMomo = _paymentService.MonoDeposit(momoDeposit);
                work.Save();
                // trigger scheduled task
                UpdateActionPayment(paymentActionId, payment.Status);
                return new ObjectResult(responseFromMomo);
            }
            catch(Exception ex)
            {
                return new JsonResult(new
                {
                    error = "Something went wrong!!! Error: " + ex.Message
                });
                work.Dispose();
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

        private async Task UpdateActionPayment(int paymentActionId, string initialPaymentStatus) //note the return type of Task. This is required to get the async test 'waitable' by the framework
        {
            await Task.Delay(900000); // 15 minutes
            await Task.Run(async () => //Task.Run automatically unwraps nested Task types!
            {
                using var work = _unitOfWorkFactory.Get;
                var action = work.PaymentActionRepository.GetFirstOrDefault(act => act.Id == paymentActionId, "Payment");
                if(action == null)
                {
                    // todo: handle error
                }
                // this transaction had begun but not finished yet
                if (action.Status != Constants.PAYMENT_ACTION_STATUS.SUCCESSFULLY && action.Status != Constants.PAYMENT_ACTION_STATUS.CANCELED)
                {
                    work.PaymentActionRepository.UpdatePaymentActionStatus(paymentActionId, Constants.PAYMENT_ACTION_STATUS.FAILED);
                }
                if (action.Payment.Status == Constants.PAYMENT_STATUS.WAITING)
                {
                    work.PaymentRepository.UpdatePaymentStatus(action.Payment.Id, initialPaymentStatus);
                }
            });
            Console.WriteLine("Transaction with payment action Id: " + paymentActionId + " has ended");
        }
    }
}
