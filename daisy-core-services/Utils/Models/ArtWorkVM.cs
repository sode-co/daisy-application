using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utils.Models
{
    public class ArtWorkVM
    {
        public String Description { get; set; }

        public int CategoryId { get; set; }

        public String Title { get; set; }
    }
}
