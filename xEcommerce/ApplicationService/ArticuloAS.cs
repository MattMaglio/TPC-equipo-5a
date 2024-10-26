using System;
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
                query.configSqlProcedure("ListarArticulos");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();
                result = query.exectQuerry();
                while (result.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)result["Id"];  // Id del artículo
                    aux.Descripcion = result["NombreArticulo"].ToString();
                    //aux.Stock = (int)result["Stock"];

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

      
        
    }

}
