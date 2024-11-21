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
    public class OrdenAS
    {
        public List<Orden> listar()
        {
            List<Orden> lista = new List<Orden>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;


            try
            {
                query.configSqlProcedure("Facturacion.SP_ListarOrdenes");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Orden aux = new Orden();

                    aux.Id = (int)result["Id"];
                    aux.Fecha = ((DateTime)result["Fecha"]).ToString("dd/MM/yyyy");
                    aux.Usuario = result["Usuario"].ToString();
                    aux.TieneEnvio = (bool)result["TieneEnvio"] ? "SI" : "NO";
                    aux.TieneRetiro = (bool)result["TieneRetiro"] ? "SI" : "NO";
                    aux.Entregado = (bool)result["Entregado"] ? "SI" : "NO";
                    aux.ComprobanteFiscal = result["ComprobanteFiscal"].ToString();
                    aux.MontoTotal = Convert.ToSingle(result["MontoTotal"]);
                    aux.Pagado = (bool)result["Pagado"] ? "SI" : "NO";

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
        public List<Orden> listarMisCompras(string user)
        {
            List<Orden> lista = new List<Orden>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;


            try
            {
                query.configSqlProcedure("Facturacion.SP_ListarOrdenesMisCompras");
                query.configSqlParams("@Usuario", user);
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Orden aux = new Orden();

                    aux.Id = (int)result["Id"];
                    aux.Fecha = ((DateTime)result["Fecha"]).ToString("dd/MM/yyyy");
                    aux.Usuario = result["Usuario"].ToString();
                    aux.TieneEnvio = (bool)result["TieneEnvio"] ? "SI" : "NO";
                    aux.TieneRetiro = (bool)result["TieneRetiro"] ? "SI" : "NO";
                    aux.Entregado = (bool)result["Entregado"] ? "SI" : "NO";
                    aux.ComprobanteFiscal = result["ComprobanteFiscal"].ToString();
                    aux.MontoTotal = Convert.ToSingle(result["MontoTotal"]);
                    aux.Pagado = (bool)result["Pagado"] ? "SI" : "NO";

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
        public void DeleteOrden(int idOrden)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Facturacion.SP_EliminarOrden");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@IdOrden", idOrden);
                query.exectCommand();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar la orden: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }
        public void marcarPagado(int idOrden)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Facturacion.SP_marcarPagado");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@IdOrden", idOrden);
                query.exectCommand();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualziar la orden: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }
        public void marcarEntregado(int idOrden)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Facturacion.SP_marcarEntregado");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@IdOrden", idOrden);
                query.exectCommand();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualziar la orden: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }
        public void cargarCompFiscal(int idOrden, string comp)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Facturacion.SP_cargarCompFiscal");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@IdOrden", idOrden);
                query.configSqlParams("@compFiscal", comp);
                query.exectCommand();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualziar la orden: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }
    }
}
