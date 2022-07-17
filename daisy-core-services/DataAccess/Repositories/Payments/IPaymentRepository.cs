using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Payments
{
    public interface IPaymentRepository : IRepository<Payment>
    {
        public void UpdatePaymentStatus(int paymentId, string status);
    }
}
