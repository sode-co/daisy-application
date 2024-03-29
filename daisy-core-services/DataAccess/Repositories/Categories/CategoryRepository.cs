﻿using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Categories
{
    public class CategoryRepository : Repository<Category>, ICategoryRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public CategoryRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public IEnumerable<Category> GetChildCategories(string parentName)
        {
            var parentCatgories = _dbContext.Categories
                .Include(p => p.ParentCategory)
                .Include(p => p.ChildrenCategory)
                .Where(p => p.ChildrenCategory.Count > 0).ToList();

            return parentCatgories.FirstOrDefault(c => c.Name.Equals(parentName)).ChildrenCategory;
        }

        public Category GetCategoryByName(string categoryName)
        {
            var category = _dbContext.Categories.SingleOrDefault(c => c.Name.Equals(categoryName));

            return category;
        }

        public IEnumerable<Category> GetParentCategories()
            => _dbContext.Categories
                .Include(p => p.ParentCategory)
                .Include(p => p.ChildrenCategory)
                .Where(p => p.ChildrenCategory.Count > 0).ToList();
    }
}
