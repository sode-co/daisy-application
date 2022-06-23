using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class JobApplication : Entity
    {
        public virtual User Freelancer { get; set; }

        public DateTime? ResolvedAt { get; set; }

        public virtual Request Request { get; set; }

        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        [MaxLength(255)]
        public String PreferredLanguage { get; set; }

        public DateTime? Timeline { get; set; }

        public decimal OfferedPrice { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        [MaxLength(255)]
        public String Status { get; set; }

        public override string TableName => "JobApplications";

        public JobApplication() { }
    }
}
