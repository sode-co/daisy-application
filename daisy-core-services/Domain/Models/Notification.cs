using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BusinessObject;

namespace Domain.Models
{
    public class Notification : Entity
    {
        [MaxLength(int.MaxValue)]
        public String Description { get; set; }

        public virtual User Receiver { get; set; }

        [MaxLength(255)]
        public String Title { get; set; }

        [MaxLength(int.MaxValue)]
        public String Data { get; set; } = "{}";

        [MaxLength(255)]
        public String Type { get; set; }

        public override string TableName => "Notifications";

        public Notification() { }
    }
}
