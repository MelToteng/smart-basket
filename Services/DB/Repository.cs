using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace scanner.Services.DB
{
    public class Repository<T> : IRepository<T> where T: class, new()
    {
        protected SQLiteConnection dbConnec;
        public Repository()
        {
            dbConnec = DatabaseHelper.GetDatabaseConnection();
        }

       
        public void Save(T obj)
        {
            try
            {
                dbConnec.Insert(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Update(T obj)
        {
            try
            {
                dbConnec.Update(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Delete(T obj)
        {
            try
            {
                dbConnec.Delete(obj);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool Exists(Expression<Func<T, bool>> expression)
        {
            var obj = dbConnec.Find<T>(expression);

            return obj != null;
        }

        public List<T> GetAll()
        {
            return dbConnec.Table<T>().ToList();
        }

        public List<T> Get(Expression<Func<T, bool>> expresion)
        {
            return dbConnec.Table<T>().Where(expresion).ToList();
        }

        public T Get(object id)
        {
            return dbConnec.Get<T>(id);
        }
    }
}
