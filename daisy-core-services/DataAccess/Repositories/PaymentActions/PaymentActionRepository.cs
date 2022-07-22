using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.PaymentActions
{
    public class PaymentActionRepository : Repository<PaymentAction>, IPaymentActionRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PaymentActionRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public int AddPaymentAction(PaymentAction paymentAction)
        {
            _dbContext.PaymentActions.Add(paymentAction);
            _dbContext.SaveChanges();
            return paymentAction.Id;
        }

        public void UpdatePaymentActionStatus(int paymentActionId, string status)
        {
            var action = _dbContext.PaymentActions.FirstOrDefault(x => x.Id == paymentActionId);
            action.Status = status;
            _dbContext.PaymentActions.Update(action);
            _dbContext.SaveChanges();
        }
    }
}
