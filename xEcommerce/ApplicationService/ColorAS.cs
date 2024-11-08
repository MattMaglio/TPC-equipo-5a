using DataPersistence;
using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationService
{
    public class ColorAS
    {
        public void EliminarColor(int id)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Catalogo.SP_EliminarColor");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@Id", id);
                query.exectCommand();

            }
            catch (Exception ex)
            {

                throw new Exception("Error al eliminar el Color: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }

        public List<Color> listar()
        {
            SqlDataReader result;
            List<Color> lista = new List<Color>();
            DataAccess data = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Catalogo.ListarColores");
                query.configSqlConexion(data.getConnection());
                data.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Color aux = new Color();
                    aux.Id = (int)result["Id"];
                    aux.Codigo = (string)result["Codigo"];
                    aux.Descripcion = (string)result["Descripcion"];
                    aux.Estado = (bool)result["Estado"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                // Manejo de error para conexión
                Console.WriteLine("Error de conexión: " + ex.Message);
                return lista; // Retorna lista vacía en caso de error
            }
            finally
            {
                data.closeConnection();
            }
        }
    }
}
