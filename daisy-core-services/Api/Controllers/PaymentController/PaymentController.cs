
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers.PaymentController
{

    [Authorize]
    [ApiController]
    public class HealthCheck : Controller
    {
        [HttpPost("callback")]
        [SwaggerOperation("Call Back Momo into user wallet")]
        public IActionResult CallBackMomo([FromBody] MoMoCallBackDto body) {
            var res = new ServiceApiResponse<Transaction>();
            var transaction = _unitOfWork.Transaction.GetFirstOrDefault(x => x.TransactionId == body.OrderId);
            if (transaction == null || transaction.Amount != body.Amount) {
                res.setErrorMessage(CustomLanguageValidator.ErrorMessageKey.ERROR_NOT_FOUND, "Transaction");
                return new NotFoundObjectResult(res.getResponse());
            }
            transaction.Status = TransactionStatusEnum.SUCCESS;
            var wallet = _unitOfWork.Wallet.GetById(transaction.ReceiverWalletId);
            wallet.Balance += transaction.Amount;
            _unitOfWork.Transaction.Update(transaction);
            _unitOfWork.Wallet.Update(wallet);

            res.data = transaction;
            res.setMessage(CustomLanguageValidator.MessageKey.MESSAGE_ADD_SUCCESS);

            return new ObjectResult(res.getResponse());
        }

        [HttpPost("deposit")]
        [SwaggerOperation("Deposit Momo into user wallet")]
        public IActionResult DepositoryMomo([FromBody] DepositoryDto body) {
            var res = new ServiceApiResponse<string>();
            ValidationResult result = new DepositoryDtoValidator().Validate(body);
            if (!result.IsValid) {
                res.mapDetails(result);
                return new BadRequestObjectResult(res.getResponse());
            }

            var user = (User) ViewData["user"];
            var userWallet = _unitOfWork.Wallet.GetFirstOrDefault(x => x.UserId == user.UserId);
            // tạo payment với type là REQUEST 
            var transaction = _unitOfWork.Transaction.customerDepositTransition(userWallet, body.Amount, "MOMO");

            var momoDeposit = new MoMoDepositDto();
            momoDeposit.Amount = body.Amount;
            // ID của payment
            momoDeposit.OrderId = transaction.TransactionId;
            // ID của payment
            momoDeposit.RequestId = transaction.TransactionId;
            momoDeposit.RedirectUrl = body.RedirectUrl;

            var requestString = _paymentService.MonoDeposit(momoDeposit);
            res.data = requestString;
            res.setMessage(CustomLanguageValidator.MessageKey.MESSAGE_ADD_SUCCESS);

            return new ObjectResult(res.getResponse());
        }
    }
}
