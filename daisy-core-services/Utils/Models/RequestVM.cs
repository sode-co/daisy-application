using Domain.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Utils.Models
{
    public partial class RequestVM
    {
        public int CategoryId { get; set; }
        public String Title { get; set; }
        public String Description { get; set; }
        public ICollection<RequestVM> Items { get; set; }
        public String Status { get; set; }

        //public override string TableName => "Requests";
    }
}
