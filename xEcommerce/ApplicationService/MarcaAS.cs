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
    public  class MarcaAS
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
