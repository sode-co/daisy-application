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
    }
}
