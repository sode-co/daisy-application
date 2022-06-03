using DataAccess.MssqlServerIntegration;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Payments
{
    public class PaymentRepository : Repository<Payment>, IPaymentRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public PaymentRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }
    }
}
