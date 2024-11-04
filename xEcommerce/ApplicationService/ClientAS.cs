using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DataPersistence;
using System.Reflection.Emit;
using System.Data;

namespace ApplicationService
{
    public class ClientAS
    {


        ///INSERTAR CLIENTE
        public void insertClient(Cliente client)
        {
            // Validaciones de los datos que ingreso del cliente
            if (string.IsNullOrWhiteSpace(client.Nombre))
                throw new ArgumentException("El nombre del cliente es obligatorio.");

            if (string.IsNullOrWhiteSpace(client.Apellido))
                throw new ArgumentException("El apellido del cliente es obligatorio.");

            if (string.IsNullOrWhiteSpace(client.Email))
                throw new ArgumentException("El email del cliente es obligatorio.");

            // Validación del DNI para que tenga 7 u 8 cifras
            if (string.IsNullOrWhiteSpace(client.Dni) || !IsValidDni(client.Dni))
                throw new ArgumentException("El DNI del cliente debe ser un número de 7 u 8 cifras.");

            if (client.Direccion == null || string.IsNullOrWhiteSpace(client.Direccion.Calle) || client.Direccion.Numeracion <= 0)
                throw new ArgumentException("La dirección del cliente es inválida.");


            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                // insert en las tablas CATALOGO:CLIENTES y CATALOGO.DIRECCIONES
                query.configSqlProcedure("Catalogo.SP_InsertarCliente");

                // Configuro conexión a DB
                query.configSqlConexion(conexion.getConnection());
                conexion.openConnection();

                // Parámetros de la query para el cliente
                query.configSqlParams("@nombre", client.Nombre);
                query.configSqlParams("@apellido", client.Apellido);
                query.configSqlParams("@dni", client.Dni);
                query.configSqlParams("@email", client.Email);
                // Parámetros de la query para la dirección
                query.configSqlParams("@calle", client.Direccion.Calle);
                query.configSqlParams("@numero", client.Direccion.Numeracion);
                query.configSqlParams("@codigoPostal", client.Direccion.CodigoPostal);
                query.configSqlParams("@idCiudad", client.Ciudad.Id); 
                query.configSqlParams("@idProvincia", client.Provincia.Id);





                // Ejecutar la query para insertar la dirección
                query.exectCommand();

            
            }
            catch (Exception ex)
            {
                throw new Exception("Error al insertar el cliente en la base de datos", ex);
            }
            finally
            {
                // Cierro la conexión
                conexion.closeConnection();
            }
        }


        // Método para validar el DNI
        private bool IsValidDni(string dni)
        {
            // sólo dígitos y tenga 7 u 8 cifras
            return dni.All(char.IsDigit) && (dni.Length == 7 || dni.Length == 8);
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////
        ///MODIFICAR CLIENTE


        public void UpdateClient(Cliente client)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();

            try
            {
                
                query.configSqlQuery("UPDATE CATALOGO.CLIENTES SET Nombre = @nombre, Apellido = @apellido, Email = @email, DNI = @dni, Calle = @calle, Numeracion = @numero, CodigoPostal = @codigoPostal WHERE Id = @clientId");

               
                query.configSqlConexion(conexion.getConnection());

                
                //query.configSqlParams("@clientId", clientId);
                query.configSqlParams("@nombre", client.Nombre);
                query.configSqlParams("@apellido", client.Apellido);
                query.configSqlParams("@email", client.Email);
                query.configSqlParams("@dni", client.Dni);
                query.configSqlParams("@calle", client.Direccion.Calle);
                query.configSqlParams("@numero", client.Direccion.Numeracion);
                query.configSqlParams("@codigoPostal", client.Direccion.CodigoPostal);

               
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

        ///////////////////////////////////////////////////////////////////////////////////////////////

        //public Cliente GetClientById(int clientId)
        //{
        //    DataAccess conexion = new DataAccess();
        //    DataManipulator query = new DataManipulator();
        //    Cliente client = null;

        //    try
        //    {

        //        query.configSqlQuery(@"SELECT c.Nombre, c.Apellido, c.Email, c.DNI, d.Calle, d.Numeracion, ci.Descripcion AS Ciudad, p.Descripcion AS Provincia FROM Catalogo.Clientes c JOIN Catalogo.Direcciones d ON c.Id = d.IdCliente JOIN Catalogo.Ciudades ci ON d.IdCiudad = ci.Id JOIN Catalogo.Provincias p ON d.IdProvincia = p.Id WHERE c.Id = @clientId");

        //        // Configure the database connection
        //        query.configSqlConexion(conexion.getConnection());
        //        query.configSqlParams("@clientId", clientId);

        //        // Open the connection
        //        conexion.openConnection();

        //        // Execute the query and retrieve the data
        //        var reader = query.exectQuerry();

        //        if (reader.Read())
        //        {
        //            // Populate the Cliente object with the data retrieved
        //            client = new Cliente
        //            {
        //                Nombre = reader["Nombre"].ToString(),
        //                Apellido = reader["Apellido"].ToString(),
        //                Email = reader["Email"].ToString(),
        //                Dni = reader["DNI"].ToString(),
        //                Direccion = new Direccion
        //                {
        //                    Calle = reader["Calle"].ToString(),
        //                    Numeracion = Convert.ToInt32(reader["Numeracion"]),
        //                    // You can add Ciudad and Provincia if needed in your Cliente or Direccion class
        //                },
        //                //Ciudad = reader["Ciudad"].ToString(), // Assuming you have a Ciudad property in Cliente
        //                //Provincia = reader["Provincia"].ToString() // Assuming you have a Provincia property in Cliente
        //            };
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Error retrieving client data", ex);
        //    }
        //    finally
        //    {
        //        conexion.closeConnection(); // Ensure the connection is closed
        //    }

        //    return client; // Return the populated Cliente object or null if not found
        //}

        


        /////////////////////////////////////////////////////////////////////////////////////////////

       
    }
}
