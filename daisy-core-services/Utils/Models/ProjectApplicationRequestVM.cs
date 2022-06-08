﻿using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Utils.Models
{
    public partial class JobApplicationRequestVM
    {
        public int Id { get; set; }
        public int FreelancerId { get; set; }
        public DateTime? ResolvedAt { get; set; }
        public int RequestId { get; set; }
        public String Description { get; set; }
        public String PreferredLanguage { get; set; }
        public long Timeline { get; set; }
        public decimal Budget { get; set; }
        public String Data { get; set; }
        public String Status { get; set; }
    }
}
