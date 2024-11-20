using DataPersistence;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json;

namespace ApplicationService
{
    public class CarritoAS
    {
        public bool registrarOrdenDeVenta(List<Carrito> carrito, string cliente, bool retiro, bool envio, float total)
        {
            string jsonCarrito = crearJsonOrdenDeVenta(carrito);

            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {

                query.configSqlProcedure("Facturacion.SP_CrearOrdenJSON");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Usuario", cliente);
                query.configSqlParams("@Carrito", jsonCarrito);
                query.configSqlParams("@TotalAPagar", total);
                query.configSqlParams("@TieneRetiro", retiro);
                query.configSqlParams("@TieneEnvio", envio);

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

            return false;
        }
        public string crearJsonOrdenDeVenta(List<Carrito> carrito)
        {
            var resultado = new List<dynamic>();
            int numeroLinea = 1;

            foreach (var item in carrito)
            {
                var registro = new
                {
                    NumeroLinea = numeroLinea++,
                    Articulo = item.Producto,
                    Color = item.Color,
                    Talle = item.Talle,
                    Cantidad = item.Cantidad,
                    Precio = item.Precio
                };

                resultado.Add(registro);
            }

            // Convertir la lista en JSON
            string json = JsonSerializer.Serialize(resultado, new JsonSerializerOptions { WriteIndented = true });

            return json;
        }
        public void restarStockVenta(int idArt, int idColor, int idTalle, int cantidad)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlProcedure("Operaciones.SP_RestarStockDeVenta");
                query.configSqlParams("@idArt", idArt);
                query.configSqlParams("@idColor", idColor);
                query.configSqlParams("@idTalle", idTalle);
                query.configSqlParams("@Cantidad", cantidad);

                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

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
