using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace DataAccess.Repositories
{
    public interface IRepository<T> where T : class
    {
        T Get(int Id);

        IQueryable<T> GetAll(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable, IOrderedQueryable<T>> orderBy = null,
            string includeProperties = null
            );

        T GetFirstOrDefault(
            Expression<Func<T, bool>> filter = null,
            string includeProperties = null
            );

        void Add(T t);
        void Remove(T t);
        void Remove(int id);
        void RemoveRange(IEnumerable<T> t);
    }
}
