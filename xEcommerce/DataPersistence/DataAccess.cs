using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataPersistence
{
    public class DataAccess
    {
        private SqlConnection conexionDB;

        public DataAccess()
        {

            string connectionString = "Server=.\\PROGRAMACION_III;Database=XECOMMERCE;Trusted_Connection=True;";

            conexionDB = new SqlConnection(connectionString);
        }

        public SqlConnection getConnection()
        {
            return conexionDB;
        }

        public void openConnection()
        {
            if (conexionDB.State == System.Data.ConnectionState.Closed)
            {
                conexionDB.Open();
            }
        }

        public void closeConnection()
        {
            if (conexionDB.State == System.Data.ConnectionState.Open)
            {
                conexionDB.Close();
            }
        }
    }
}
