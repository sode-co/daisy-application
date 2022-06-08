﻿using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Utils.Models
{
    public partial class WorkspaceVM
    {
        public int Id { get; set; }
        public String Status { get; set; }
        public virtual Request Request { get; set; }
        public virtual Project Project { get; set; }
        public virtual ICollection<Discussion> Discussions { get; set; }
        public virtual ICollection<Resource> Resources { get; set; }
    }
}
