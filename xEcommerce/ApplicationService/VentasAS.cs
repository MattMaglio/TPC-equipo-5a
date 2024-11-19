using DataPersistence;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationService
{
    public class VentasAS
    {
        public void ActualizarEstadoVenta(string idVenta, string nuevoEstado)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Operaciones.ActualizarEstadoVenta");// falta hacer el sp
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("IdVenta", idVenta);
                query.configSqlParams("Estado", nuevoEstado);

                query.exectCommand();
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
