using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class JobApplicationVM
    {
        public int RequestId { get; set; }
        public string Description { get; set; }
        public string PreferedLanguage { get; set; }
        public long Timeline { get; set; }
        public decimal Budget { get; set; }
    }
}
