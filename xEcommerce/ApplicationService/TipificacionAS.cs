using Model;
using DataPersistence;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Scripts;

namespace ApplicationService
{
    public class TipificacionAS
    {
        // Agregar una tipificaicon en base al tipo
        public int ValidarIntegridad(int Tipific, int Id)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            int registros;

            try
            {

                query.configSqlProcedure("Operaciones.SP_ValidarIntegridadTipificacion");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Tipificacion", Tipific);
                query.configSqlParams("@Id", Id);

                registros = Convert.ToInt32(query.exectScalar());

                return registros;
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
        public void AgregarTipificacion(int Tipific, string Codigo, string Descripcion)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {

                query.configSqlProcedure("Catalogo.SP_InsertarTipificacion");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Tipificacion", Tipific);
                query.configSqlParams("@Codigo", Codigo);
                query.configSqlParams("@Descripcion", Descripcion);

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
        public void ModificarTipificacion(int Tipific, string Codigo, string Descripcion)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            try
            {

                query.configSqlProcedure("Catalogo.SP_ModificarTipificacion");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Tipificacion", Tipific);
                query.configSqlParams("@Codigo", Codigo);
                query.configSqlParams("@Descripcion", Descripcion);

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
        public int ValidarCodigoActivo_Tipificacion(int Tipificacion, string codigo)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            int estado;

            try
            {

                query.configSqlProcedure("Catalogo.SP_ValidarCodigoTipificacion");
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                query.configSqlParams("@Tipificacion", Tipificacion);
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
        // Método para obtener todas las tipificaciones
        public List<Tipificacion> ObtenerTodas()
        {
            return Tipificacion.Tipificaciones;
        }
        // Método para buscar una tipificación por código
        public Tipificacion ObtenerPorCodigo(int codigo)
        {
            return Tipificacion.Tipificaciones.FirstOrDefault(t => t.Codigo == codigo);
        }
        // Busca la tipificación por código y devuelve la lista con un único elemento si se encuentra
        public List<Tipificacion> ObtenerPorId(int codigo)
        {
            var resultado = Tipificacion.Tipificaciones
                .Where(t => t.Codigo == codigo)
                .ToList();

            return resultado;
        }
        // Método para buscar una tipificación por descripción
        public Tipificacion ObtenerPorDescripcion(string descripcion)
        {
            return Tipificacion.Tipificaciones.FirstOrDefault(t => t.Descripcion.Equals(descripcion, StringComparison.OrdinalIgnoreCase));
        }

        // Método para verificar si una tipificación existe por código
        public bool ExisteCodigo(int codigo)
        {
            return Tipificacion.Tipificaciones.Any(t => t.Codigo == codigo);
        }

        // Método para verificar si una tipificación existe por descripción
        public bool ExisteDescripcion(string descripcion)
        {
            return Tipificacion.Tipificaciones.Any(t => t.Descripcion.Equals(descripcion, StringComparison.OrdinalIgnoreCase));
        }
    }
}
