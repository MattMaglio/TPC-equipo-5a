using System;
using System.Collections;
using System.Collections.Generic;
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


        public List<Articulo> ObtenerIdXModificacion(string id = "")
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
                            Descripcion = result["Marca"].ToString()
                        },
                        Tipo = new Tipo
                        {
                            Descripcion = result["Tipo"].ToString()
                        },
                        Categoria = new Categoria
                        {
                            Descripcion = result["Categoria"].ToString()
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
            catch (Exception ex)
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
            catch (Exception ex)
            {

                throw new Exception("Error al eliminar el artículo: " + ex.Message, ex);
            }
            finally
            {
                conexion.closeConnection();
            }
        }
    }

}
