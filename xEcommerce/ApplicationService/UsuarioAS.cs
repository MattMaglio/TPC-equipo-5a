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
				query.configSqlQuery("Select Id, TipoUser from USUARIOSPRUEBA Where usuario = @user AND pass = @pass");
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
    }
}
