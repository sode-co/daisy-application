using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Utils.Models
{
    public partial class ProjectVM
    {
        public int Id { get; set; }
        public string CustomerId { get; set; }
        public string FreelancerId { get; set; }
        public string CategoryId { get; set; }
        public DateTime? ResolvedAt { get; set; }
        public String Data { get; set; } = "{}";
        public String PreferredLanguage { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public String ReferenceFile { get; set; }
        public long Timeline { get; set; }
        public decimal Budget { get; set; }
        public bool IsAllowedPublic { get; set; }
        public String Status { get; set; }
        public string PaymentId { get; set; }
        public string RequestId { get; set; }
    }
}
