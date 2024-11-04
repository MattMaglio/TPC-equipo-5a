using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
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

                    aux.Id = (int)result["Id"];
                    aux.Codigo = result["Codigo"].ToString();
                    aux.Descripcion = result["Descripcion"].ToString();
                    aux.Detalle = result["Detalle"].ToString();
                    aux.Estado = (bool)result["Estado"];

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
        public List<Articulo> listarConSyP()
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
                    Articulo aux = new Articulo
                    {

                        Id = (int)result["Id de Articulo"],
                        Codigo = result["Codigo de Articulo"].ToString(),
                        Descripcion = result["Descripcion de Articulo"].ToString(),
                        Estado = true,
                        Color = new Color
                        {
                            Id = (int)result["Id de Color"],
                            Codigo = result["Codigo de Color"].ToString(),
                            Descripcion = result["Descripcion de Color"].ToString()
                        },
                        Talle = new Talle
                        {
                            Id = (int)result["Id de Talle"],
                            Codigo = result["Codigo de Talle"].ToString(),
                            Descripcion = result["Descripcion de Talle"].ToString()
                        },
                        Stock = (int)result["Cantidad"],
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
        public List<Articulo> ObtenerIdXModificacion(string id="")
        {
            List<Articulo> lista = new List<Articulo>();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;


            try
            {

                if(!string.IsNullOrEmpty(id) && int.TryParse(id, out int articuloId))
            {
                    query.configSqlProcedure("Catalogo.ObtenerArticuloPorId");
                    query.configSqlParams("@Id", articuloId); // agregamos el id
                }
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Articulo aux = new Articulo
                    {
                        Id = (int)result["Id"],
                        Codigo = result["Codigo"].ToString(),
                        Descripcion = result["Descripcion"].ToString(),
                        Estado = (bool)result["Estado"],
                        Detalle = result["Detalle"].ToString(),
                        Marca = new Marca
                        {
                            Id = (int)result["Id Marca"],
                            Codigo = result["Codigo Marca"].ToString(),
                            Descripcion = result["Descripcion Marca"].ToString()
                        },
                        Tipo = new Tipo
                        {
                            Id = (int)result["Id Tipo"],
                            Codigo = result["Codigo Tipo"].ToString(),
                            Descripcion = result["Descripcion Tipo"].ToString()
                        },
                        Categoria = new Categoria
                        {
                            Id = (int)result["Id Categoria"],
                            Codigo = result["Codigo Categoria"].ToString(),
                            Descripcion = result["Descripcion Categoria"].ToString()
                        }
                    };

                    lista.Add(aux); // Añadir el artículo a la lista
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
        public int ValidarCodigoActivo(string codigo)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            int estado;

            try
            {

                query.configSqlQuery("SELECT Estado FROM Catalogo.Articulos WHERE Codigo = @Codigo");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Codigo", codigo);

                estado = Convert.ToInt32(query.exectScalar());

                return estado;
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
        public void ModificarArticulo(Articulo articulo)
        {

            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Catalogo.SP_ModificarArticulo");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Codigo", articulo.Codigo);
                query.configSqlParams("@Descripcion", articulo.Descripcion);
                query.configSqlParams("@IdTipo", articulo.Tipo.Id);
                query.configSqlParams("@IdMarca", articulo.Marca.Id);
                query.configSqlParams("@IdCategoria", articulo.Categoria.Id);
                query.configSqlParams("@Detalle", articulo.Detalle);

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
        public void AgregarNuevoArticulo(Articulo articulo)
        {
            
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {

                query.configSqlProcedure("Catalogo.InsertarNuevoArticulo");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Codigo", articulo.Codigo);
                query.configSqlParams("@Descripcion", articulo.Descripcion);
                query.configSqlParams("@IdTipo", articulo.Marca.Id);
                query.configSqlParams("@IdMarca", articulo.Marca.Id);
                query.configSqlParams("@IdCategoria", articulo.Categoria.Id);
                query.configSqlParams("@Detalle", articulo.Detalle);

                query.exectCommand();
            }
            catch (Exception ex )
            {

                throw ex;
            }
            finally
            {
                conexion.closeConnection();
            }

        }
        public void DeleteArticulo(int IdArticulo)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {
                query.configSqlProcedure("Catalogo.EliminarArticulo");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                query.configSqlParams("@IdArticulo", IdArticulo);
                query.exectCommand();

            }
            catch (Exception ex )
            {

                throw new Exception("Error al eliminar el artículo: " + ex.Message, ex);
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
        public DataTable listarStockYPrecio_Filtrado(string Codigo)
        {
            DataTable dataTable = new DataTable();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
            {
                query.configSqlProcedure("Operaciones.SP_Listado_StockYPrecio_Filtrado");
                query.configSqlParams("@Codigo", Codigo);
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
        public DataTable listarStockPorArticulo()
        {
            DataTable dataTable = new DataTable();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
            {
                query.configSqlProcedure("Operaciones.SP_Listado_StockPorArticulo");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();

                // Definir las columnas en el DataTable
                dataTable.Columns.Add("Codigo", typeof(string));
                dataTable.Columns.Add("Descripcion", typeof(string));
                dataTable.Columns.Add("Stock", typeof(int));

                // Llenar el DataTable con los datos del SqlDataReader
                while (result.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["Codigo"] = result["Codigo"].ToString();
                    row["Descripcion"] = result["Descripcion"].ToString();       
                    row["Stock"] = Convert.ToInt32(result["StockPorProducto"]);

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
        public DataTable listarStockPorArticulo_Filtrado(string Codigo)
        {
            DataTable dataTable = new DataTable();
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
            {
                query.configSqlProcedure("Operaciones.SP_Listado_StockPorArticulo_Filtrado");
                query.configSqlParams("@Codigo", Codigo);
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();

                // Definir las columnas en el DataTable
                dataTable.Columns.Add("Codigo", typeof(string));
                dataTable.Columns.Add("Descripcion", typeof(string));
                dataTable.Columns.Add("Stock", typeof(int));

                // Llenar el DataTable con los datos del SqlDataReader
                while (result.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["Codigo"] = result["Codigo"].ToString();
                    row["Descripcion"] = result["Descripcion"].ToString();
                    row["Stock"] = Convert.ToInt32(result["StockPorProducto"]);

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
    }
    
}
