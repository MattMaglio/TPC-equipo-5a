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
    public class TipoAS
    {
        public List<Tipo> listar()
        {
            SqlDataReader result;
            List<Tipo> lista = new List<Tipo>();
            DataAccess data = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Catalogo.ListarTipos");
                query.configSqlConexion(data.getConnection());
                data.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Tipo aux = new Tipo();
                    aux.Id = (int)result["Id"];
                    aux.Codigo = (string)result["Codigo"];
                    aux.Descripcion = (string)result["Descripcion"];

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

    }
}


