using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class RequestVM
    {
        public int categoryId { get; set; }
        public string? description { get; set; }
        public string? title { get; set; }
        public string? status { get; set; }
        public decimal? budget { get; set; }
    }
}
