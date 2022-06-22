using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class RequestJobPostVM
    {
        public int CategoryId { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public string Status { get; set; }
        public decimal Budget { get; set; }
        public DateTime Timeline { get; set; }
        public List<RequestJobPostVM> Items { get; set; }
    }
}
