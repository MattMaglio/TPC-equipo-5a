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
    public class DetalleOrdenAS
    {
        public List <DetalleOrden> listarDetalleFiltrado(int idOrden)
        {
            List<DetalleOrden> lista = new List<DetalleOrden>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;


            try
            {
                query.configSqlProcedure("Facturacion.SP_ObtenerDetalleOrden");
                query.configSqlParams("@IdOrden", idOrden);
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    DetalleOrden aux = new DetalleOrden
                    {
                        Id = (int)result["Id"],
                        IdOrden = (int)result["IdOrden"],
                        Articulo = result["Articulo"].ToString(),
                        Color = result["Color"].ToString(),
                        Talle = result["Talle"].ToString(),
                        Cantidad = (int)result["Cantidad"],
                        Precio = Convert.ToSingle(result["Precio"])

                    };

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
                conexion.closeConnection();
            }
        }
    }
}
