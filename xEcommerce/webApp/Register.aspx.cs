using ApplicationService;
using DataPersistence;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
      
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            bool isValid = true; // Variable para controlar la validez de los datos

            // Limpio mensajes previos
            ClearMessages();

            // Validar DNI
            if (string.IsNullOrWhiteSpace(txtDNI.Text) || !IsDNIValid(txtDNI.Text))
            {
                Label3.Text = "DNI is required and must be 7 or 8 digits..";
                isValid = false;
            }
            else
            {
                Label4.Text = "Valid DNI.";
            }

            // Validar Nombre
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || !IsOnlyLetters(txtNombre.Text))
            {
                Label5.Text = "Name is required and must contain only letters.";
                isValid = false;
            }
            else
            {
                Label6.Text = "Valid name.";
            }

            // Validar Apellido
            if (string.IsNullOrWhiteSpace(txtApellido.Text) || !IsOnlyLetters(txtApellido.Text))
            {
                Label7.Text = "Last name is required.";
                isValid = false;
            }
            else
            {
                Label8.Text = "Valid last name.";
            }

            // Validar Email
            if (string.IsNullOrWhiteSpace(txtEmail.Text) || !IsValidEmail(txtEmail.Text))
            {
                Label9.Text = "Email is not valid.";
                isValid = false;
            }
            else
            {
                Label10.Text = "Valid email.";
            }

            // Validar Calle
            if (string.IsNullOrWhiteSpace(txtCalle.Text))
            {
                Label11.Text = "Street is required.";
                isValid = false;
            }
            else
            {
                Label12.Text = "Valid street.";
            }

            // Validar Número
            if (string.IsNullOrWhiteSpace(txtNumero.Text) || !int.TryParse(txtNumero.Text, out _))
            {
                Label1.Text = "House number is required and must be a number.";
                isValid = false;
            }
            else
            {
                Label2.Text = "Valid house number.";
            }

            // Validar Código Postal
            if (string.IsNullOrWhiteSpace(txtCP.Text))
            {
                Label15.Text = "Zip code is required.";
                isValid = false;
            }
            else
            {
                Label16.Text = "Valid zip code.";
            }

            // Validar Ciudad y Provincia
            if (ddlCiudades.SelectedIndex == -1)
            {
                Label3.Text += " You must select a city.";
                isValid = false;
            }

            if (ddlProvincias.SelectedIndex == -1)
            {
                Label5.Text += " You must select a province.";
                isValid = false;
            }

            // Validar Términos y Condiciones
            if (!chkTerms.Checked)
            {
                LabelTerms.Text = "You must accept the terms and conditions.";
                isValid = false;
            }

            // Si todos los campos son válidos, continúo con la inserción
            if (isValid)
            {
                try
                {
                    Cliente client = new Cliente();
                    ClientAS clientAS = new ClientAS();

                    // Cargo los primeros datos del cliente
                    client.Dni = txtDNI.Text;
                    client.Nombre = txtNombre.Text;
                    client.Apellido = txtApellido.Text;
                    client.Email = txtEmail.Text;

                    // Cargo la dirección
                    client.Direccion = new Direccion();
                    client.Direccion.Calle = txtCalle.Text;
                    client.Direccion.Numeracion = int.Parse(txtNumero.Text);
                    client.Direccion.CodigoPostal = txtCP.Text;

                    // Obtener ID de la ciudad y provincia desde los DropDownList
                    client.Ciudad = new Ciudad();
                    client.Ciudad.Id = int.Parse(ddlCiudades.SelectedValue);

                    client.Provincia = new Provincia();
                    client.Provincia.Id = int.Parse(ddlProvincias.SelectedValue);

                    // Validar cliente
                    clientAS.insertClient(client);

                    // Mostrar mensaje de éxito
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showSuccessMessage();", true);


                    // Limpio los campos
                    ClearFields();

                    // Redireccionar después de mostrar el mensaje
                   // Response.Redirect("Default.aspx");
                   
                }
                catch (Exception ex)
                {
                    // Manejo de excepciones
                    Console.WriteLine("Error during registration: btnCreateAccount " + ex.Message);
                    throw;
                }
            }
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

        // Método para limpiar los mensajes
        private void ClearMessages()
        {
            Label3.Text = "";
            Label4.Text = "";
            Label5.Text = "";
            Label6.Text = "";
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "";
            Label10.Text = "";
            Label11.Text = "";
            Label12.Text = "";
            Label1.Text = "";
            Label2.Text = "";
            Label15.Text = "";
            Label16.Text = "";
            LabelTerms.Text = "";
        }

        //Método para limpiar los campos
        protected void ClearFields()
        {
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtCalle.Text = "";
            txtNumero.Text = "";
            txtCP.Text = "";
            ddlCiudades.SelectedIndex = 0;
            ddlProvincias.SelectedIndex = 0;
        }



        protected void btnCancelAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}