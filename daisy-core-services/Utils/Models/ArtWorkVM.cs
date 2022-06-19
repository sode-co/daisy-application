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

        public virtual Category Category { get; set; }

        public String Title { get; set; }
    }
}
