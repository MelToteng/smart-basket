using scanner.Model;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace scanner.Services.DB
{
    public class DatabaseHelper
    {
        private static SQLiteConnection _database;

        public static SQLiteConnection GetDatabaseConnection()
        {
            try
            {
                if (_database == null)
                {
                    string dbPath = Path.Combine(FileSystem.AppDataDirectory, "AppDatabase.db");
                    _database = new SQLiteConnection(dbPath);
                }
                return _database;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static void InitializeDatabase() 
        {
            try
            {
                var dbConnec = GetDatabaseConnection();

                var result= dbConnec.CreateTables<Item,ListItem>();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
