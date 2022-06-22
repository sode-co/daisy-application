using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class DiscussionVM
    {
        public int Id { get; set; }
        public int SenderId { get; set; }
        public String Type { get; set; }
        public String Content { get; set; }
        public int WorkspaceId { get; set; }
        public String Status { get; set; }
    }
}
