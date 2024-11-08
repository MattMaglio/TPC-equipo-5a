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
    public class CategoriaAS
    {
        public void EliminarCate(int id)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Catalogo.SP_EliminarCategoria");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@Id", id);
                query.exectCommand();

            }
            catch (Exception ex)
            {

                throw new Exception("Error al eliminar la Categoria: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }

        public List<Categoria> listar()
        {
            SqlDataReader result;
            List<Categoria> lista = new List<Categoria>();
            DataAccess data = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Catalogo.ListarCategorias");
                query.configSqlConexion(data.getConnection());
                data.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Categoria aux = new Categoria();
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
