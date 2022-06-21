using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Categories
{
    public interface ICategoryRepository : IRepository<Category>
    {
        IEnumerable<Category> GetParentCategories();
        IEnumerable<Category> GetChildCategories(string parentName);
        Category GetCategoryByName(string name);
    }
}
