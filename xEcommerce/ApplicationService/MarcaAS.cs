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
    public class MarcaAS
    {
        public List<Marca> listar()
        {
            SqlDataReader result;
            List<Marca> lista = new List<Marca>();
            DataAccess data = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Catalogo.ListarMarcas");
                query.configSqlConexion(data.getConnection());
                data.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Marca aux = new Marca();
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

                throw ex;
            }
            finally
            {
                data.closeConnection();
            }
        }

        public void EliminarMarca(int Id)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Catalogo.SP_EliminarMarca");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@Id", Id);
                query.exectCommand();

            }
            catch (Exception ex)
            {

                throw new Exception("Error al eliminar la Marca: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }

        }
    }
}
