using ApplicationService;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataPersistence;

namespace webApp
{
    public partial class ModifyClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //CARGO LA DATA DEL CLIENTE
            if (!IsPostBack)
            {
               
                //int clientId = int.Parse(Request.QueryString["id"]);
                //int clientId = 1;
                //LoadClientData(1);
            }

            //CARGO LOS DROPDOWNLIST DE REGISTER

            CiudadAS CityAS = new CiudadAS();
            List<Ciudad> listCityAS = CityAS.Listar();

            ddlCiudades.DataSource = listCityAS;
            ddlCiudades.DataValueField = "Id";
            ddlCiudades.DataTextField = "Nombre";
            ddlCiudades.DataBind();


            ProvinciaAS ProvinceAS = new ProvinciaAS();
            List<Provincia> listProvinciaAS = ProvinceAS.Listar();


            ddlProvincias.DataSource = listProvinciaAS;
            ddlProvincias.DataValueField = "Id";
            ddlProvincias.DataTextField = "Nombre";
            ddlProvincias.DataBind();

        }


        public Cliente GetClientById(int clientId)
        {
            DataAccess conexion = new DataAccess();
            DataManipulator query = new DataManipulator();
            Cliente client = null;

            try
            {

                query.configSqlQuery("Catalogo.ObtenerClientePorId");
                query.exectCommand();


                query.configSqlParams("@Id", clientId);


                query.configSqlConexion(conexion.getConnection());


                conexion.openConnection();


                var reader = query.exectQuerry();

                if (reader.Read())
                {

                    client = new Cliente
                    {
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Email = reader["Email"].ToString(),
                        Dni = reader["DNI"].ToString(),
                        Direccion = new Direccion
                        {
                            Calle = reader["Calle"].ToString(),
                            Numeracion = Convert.ToInt32(reader["Numero"]),
                        },
                        //Ciudad = reader["Ciudad"].ToString(), 
                        //Provincia = reader["Provincia"].ToString() 
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving client data", ex);
            }
            finally
            {
                conexion.closeConnection();
            }

            return client;
        }


        private void LoadClientData(int clientId)
        {
            ClientAS clientAS = new ClientAS();
            Cliente client = GetClientById(clientId);

            if (client != null)
            {
                txtDNI.Text = client.Dni;
                txtNombre.Text = client.Nombre;
                txtApellido.Text = client.Apellido;
                txtEmail.Text = client.Email;
                txtCalle.Text = client.Direccion.Calle;
                txtNumero.Text = client.Direccion.Numeracion.ToString();
                txtCP.Text = client.Direccion.CodigoPostal;
            }
            else
            {
                
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            ClearMessages();

            
            if (string.IsNullOrWhiteSpace(txtDNI.Text) || !IsDNIValid(txtDNI.Text))
            {
                LabelDNI.Text = "DNI is required and must be 7 or 8 digits.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || !IsOnlyLetters(txtNombre.Text))
            {
                LabelNombre.Text = "Name is required and must contain only letters.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtApellido.Text) || !IsOnlyLetters(txtApellido.Text))
            {
                LabelApellido.Text = "Last name is required.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text) || !IsValidEmail(txtEmail.Text))
            {
                LabelEmail.Text = "Email is not valid.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtCalle.Text))
            {
                LabelCalle.Text = "Street is required.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtNumero.Text) || !int.TryParse(txtNumero.Text, out _))
            {
                LabelNumero.Text = "House number is required and must be a number.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtCP.Text))
            {
                LabelCP.Text = "Zip code is required.";
                isValid = false;
            }

            
            if (isValid)
            {
                try
                {
                    Cliente client = new Cliente
                    {
                        Dni = txtDNI.Text,
                        Nombre = txtNombre.Text,
                        Apellido = txtApellido.Text,
                        Email = txtEmail.Text,
                        Direccion = new Direccion
                        {
                            Calle = txtCalle.Text,
                            Numeracion = int.Parse(txtNumero.Text),
                            CodigoPostal = txtCP.Text
                        }
                    };

                    int clientId = int.Parse(Request.QueryString["id"]);
                    ClientAS clientAS = new ClientAS();
                    clientAS.UpdateClient(client); 

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showSuccessMessage();", true);
                    ClearFields();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error during update: " + ex.Message);
                    throw;
                }
            }
        }

        

        private void ClearMessages()
        {
            LabelDNI.Text = "";
            LabelNombre.Text = "";
            LabelApellido.Text = "";
            LabelEmail.Text = "";
            LabelCalle.Text = "";
            LabelNumero.Text = "";
            LabelCP.Text = "";
        }

        protected void ClearFields()
        {
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtCalle.Text = "";
            txtNumero.Text = "";
            txtCP.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        // Método para validar el formato del DNI
        private bool IsDNIValid(string dni)
        {
            return (dni.Length == 7 || dni.Length == 8) && dni.All(char.IsDigit);
        }

        // Método para validar que la cadena contenga solo letras
        private bool IsOnlyLetters(string input)
        {
            return input.All(char.IsLetter);
        }

        // Método para validar el formato del email
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }


        






    }
}