using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataPersistence;
using Model;

namespace ApplicationService
{
    public class ArticuloAS
    {

        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;
            

            try
            {
                query.configSqlProcedure("Catalogo.ListarArticulos");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)result["Id"];  // Id del artículo

                    aux.Codigo = result["Codigo"].ToString();
                    aux.Descripcion = result["Descripcion"].ToString();
                    aux.Detalle = result["Detalle"].ToString();
                    //aux.Estado = result["Estado"]

                    aux.Marca = new Marca();
                    aux.Tipo = new Tipo();
                    aux.Categoria = new Categoria();

                    aux.Tipo.Descripcion = result["Tipo"].ToString();  
                    aux.Marca.Descripcion = result["Marca"].ToString(); 
                    aux.Categoria.Descripcion = result["Categoria"].ToString();  

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

        public DataTable listarStockYPrecio()
        {
            DataTable dataTable = new DataTable();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
            {
                query.configSqlProcedure("Operaciones.SP_StockYPrecio");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();

                // Definir las columnas en el DataTable
                dataTable.Columns.Add("Codigo", typeof(string));
                dataTable.Columns.Add("Descripcion", typeof(string));
                dataTable.Columns.Add("ColorCodigo", typeof(string));
                dataTable.Columns.Add("ColorDescripcion", typeof(string));
                dataTable.Columns.Add("TalleCodigo", typeof(string));
                dataTable.Columns.Add("TalleDescripcion", typeof(string));
                dataTable.Columns.Add("Stock", typeof(int));
                dataTable.Columns.Add("Precio", typeof(float));

                // Llenar el DataTable con los datos del SqlDataReader
                while (result.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["Codigo"] = result["Codigo de Articulo"].ToString();
                    row["Descripcion"] = result["Descripcion de Articulo"].ToString();
                    row["ColorCodigo"] = result["Codigo de Color"].ToString();
                    row["ColorDescripcion"] = result["Descripcion de Color"].ToString();
                    row["TalleCodigo"] = result["Codigo de Talle"].ToString();
                    row["TalleDescripcion"] = result["Descripcion de Talle"].ToString();
                    row["Stock"] = Convert.ToInt32(result["Cantidad"]);
                    row["Precio"] = Convert.ToSingle(result["Precio"]);

                    dataTable.Rows.Add(row);
                }

                return dataTable;
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

        /*public List<Articulo> listarStockYPrecio()
        {
            List<Articulo> lista = new List<Articulo>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;


            try
            {
                query.configSqlProcedure("Operaciones.SP_StockYPrecio");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Articulo aux = new Articulo();

                    aux.Codigo = result["Codigo de Articulo"].ToString();
                    aux.Descripcion = result["Descripcion de Articulo"].ToString();

                    

                    aux.Color = new Color();
                    aux.Color.Codigo = result["Codigo de Color"].ToString();
                    aux.Color.Descripcion = result["Descripcion de Color"].ToString();

                    aux.Talle = new Talle();
                    aux.Talle.Codigo = result["Codigo de Talle"].ToString();
                    aux.Talle.Descripcion = result["Descripcion de Talle"].ToString();

                    aux.Stock = Convert.ToInt32(result["Cantidad"]);
                    aux.Precio = Convert.ToSingle(result["Precio"]);

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
        }*/

    }

}
