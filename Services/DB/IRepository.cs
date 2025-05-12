using System.Linq.Expressions;

namespace scanner.Services.DB
{
    public interface IRepository<T> where T : class,new()
    {
        bool Exists(Expression<Func<T, bool>> expression);
        T Get(object id);
        List<T> GetAll();
        List<T> Get(Expression<Func<T, bool>> expresion);
        void Delete(T obj);
        void Save(T obj);
        void Update(T obj);
    }
}