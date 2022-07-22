using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.PaymentActions
{
    public interface IPaymentActionRepository : IRepository<PaymentAction>
    {
        public int AddPaymentAction(PaymentAction paymentAction);
        public void UpdatePaymentActionStatus(int paymentActionId, string status);
    }
}
