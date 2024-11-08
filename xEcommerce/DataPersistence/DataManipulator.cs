using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataPersistence
{
    public class DataManipulator
    {
        public SqlCommand sqlQuery { get; set; }
        public SqlConnection connection { get; set; }

        public DataManipulator()
        {
            sqlQuery = new SqlCommand();
        }

        public void configSqlQuery(string query) // Se le brinda el string con la query que se desea ejecutar.
        {
            sqlQuery = new SqlCommand();
            sqlQuery.CommandType = System.Data.CommandType.Text;
            sqlQuery.CommandText = query;
        }

        public void configSqlProcedure(string sp) // Se le brinda el string con el nombre del SP (previamente creado en la DB) que se desea ejecutar.
        {
            sqlQuery = new SqlCommand();
            sqlQuery.CommandType = System.Data.CommandType.StoredProcedure;
            sqlQuery.CommandText = sp;
        }

        public void configSqlConexion(SqlConnection conexion) // Se usa para configurar la conexion.
        {
            if (sqlQuery == null)
            {
                sqlQuery = new SqlCommand();
            }

            sqlQuery.Connection = conexion;
        }

        public void configSqlParams(string nombre, object valor) // Se usa para configurar los parametros a setear en la query.
        {
            if (sqlQuery == null)
            {
                throw new InvalidOperationException("sqlQuery no está inicializado.");
            }

            sqlQuery.Parameters.AddWithValue(nombre, valor);
        }

        public SqlDataReader exectQuerry() // Se usa para ejecutar consultas (acciones que devuelven un resultado esperado en formato de tabla sql).
        {
            if (sqlQuery.Connection == null)
            {
                throw new InvalidOperationException("La conexión no ha sido configurada.");
            }

            SqlDataReader result = sqlQuery.ExecuteReader();
            return result;
        }

        public void exectCommand() // Se usa para ejecutar una accion (comandos que no devuelven resultados, por ejemplo un UPDATE o DROP)
        {
            if (sqlQuery.Connection == null)
            {
                throw new InvalidOperationException("La conexión no ha sido configurada.");
            }

            sqlQuery.ExecuteNonQuery();

        }

        public object exectScalar() // Se usa para ejecuctar comandos y capturar el RESULTADO de la PRIMER CELDA en la PRIMER FILA y PRIMERA COLUMNA.
        {
            if (sqlQuery.Connection == null)
            {
                throw new InvalidOperationException("La conexión no ha sido configurada.");
            }
            try
            {
                object result = sqlQuery.ExecuteScalar();
                return result; 
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("Error al ejecutar la consulta", ex);
            }
        }
        public int getLastInsertedId()
        {
            int lastId = -1; // defecto en caso de error

            using (SqlCommand command = new SqlCommand("SELECT SCOPE_IDENTITY();", this.connection))
            {
                try
                {
                    lastId = Convert.ToInt32(command.ExecuteScalar()); // Ejecutar la consulta y convertir el resultado a int para obtener el ultimo id
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            return lastId; //retorna el ultimo id 
        }
    }
}
