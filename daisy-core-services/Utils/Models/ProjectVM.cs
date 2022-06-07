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
        public virtual User Customer { get; set; }
        public virtual User Freelancer { get; set; }
        public virtual Category Category { get; set; }
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
        public virtual Payment Payment { get; set; }
        public virtual ICollection<Workspace> Workspaces { get; set; }
        public virtual Request Request { get; set; }
    }
}
