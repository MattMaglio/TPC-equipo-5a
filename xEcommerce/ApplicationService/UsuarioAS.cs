using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DataPersistence;
using System.Data.SqlClient;

namespace ApplicationService
{
    public class UsuarioAS
    {
        public bool Loguear(Usuario usuario)
        {	
			DataAccess conexion = new DataAccess();
			DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
			{
				query.configSqlQuery("Select Id, TipoUser from Catalogo.Usuarios Where usuario = @user AND pass = @pass");
				query.configSqlParams("@user", usuario.User);
				query.configSqlParams("@pass", usuario.Pass);

                query.configSqlConexion(conexion.getConnection());

                conexion.openConnection();
                result = query.exectQuerry();

                //leo la DB y me completo el obj Usuario con id y TipoUser
                while (result.Read())
                {
                    usuario.Id = (int)result["id"];
                    usuario.TipoUsuario = (int)(result["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL; //si el TipoUser es 2 será ADMIN y sino NORMAL (Op Ternario)
                    return true;
                }

                return false;
 
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

        public void actualizarUsuario(Usuario user)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                query.configSqlQuery("UPDATE Catalogo.Usuarios SET nombre = @nombre, apellido = @apellido, dni = @dni, email = @email WHERE Usuario = @user");
                query.configSqlParams("@user", user.User);
                query.configSqlParams("@nombre", user.nombre);
                query.configSqlParams("@apellido", user.apellido);
                query.configSqlParams("@dni", user.dni);
                query.configSqlParams("@email", user.email);

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
        public Usuario ObtenerDatos(Usuario usuario)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            SqlDataReader result;

            try
            {
                query.configSqlQuery("Select email, nombre, apellido, dni from Catalogo.Usuarios Where usuario = @user");
                query.configSqlParams("@user", usuario.User);
                //query.configSqlParams("@pass", usuario.Pass);

                query.configSqlConexion(conexion.getConnection());

                conexion.openConnection();
                result = query.exectQuerry();

                Usuario user = new Usuario();

                //leo la DB y me completo el obj Usuario con id y TipoUser
                while (result.Read())
                {
                    user.email = result["email"].ToString();
                    user.nombre = result["nombre"].ToString();
                    user.apellido = result["apellido"].ToString();
                    user.dni = result["dni"].ToString();
                    return user;
                }

                return user;

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

        ///////////////////////////////////////////////////////////////////////////////
        public void insertUsuario(Usuario usuario)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                // insert en las tablas CATALOGO:CLIENTES y CATALOGO.DIRECCIONES
                query.configSqlProcedure("Catalogo.SP_InsertarUsuario");

                // Configuro conexión a DB
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                // Parámetros de la query para el cliente
                query.configSqlParams("@usuario", usuario.User);
                query.configSqlParams("@pass", usuario.Pass);
                
                // Ejecutar la query para insertar la dirección
                query.exectCommand();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al insertar el usuario en la base de datos", ex);
            }
            finally
            {
                // Cierro la conexión
                conexion.closeConnection();
            }
        }
    }

}
