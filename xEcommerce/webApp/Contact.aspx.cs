using ApplicationService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {   // capturamos los valores del formulario de contacto
            string nombre = txtNombre.Text;
            string asunto = txtAsunto.Text;
            string email = txtEmailContacto.Text;
            string mensaje = txtMensaje.Text;
            if (string.IsNullOrWhiteSpace(nombre))
            {
                Response.Write("<script>alert('Por favor, ingresa tu nombre.');</script>");
                return; // Detener la ejecución si no se cumple la validación
            }

            if (string.IsNullOrWhiteSpace(asunto))
            {
                Response.Write("<script>alert('Por favor, ingresa un asunto.');</script>");
                return;
            }

            if (string.IsNullOrWhiteSpace(email) || !IsValidEmail(email))
            {
                Response.Write("<script>alert('Por favor, ingresa un correo electrónico válido.');</script>");
                return;
                //otra alternativa
                //Session.Add("error", "Por favor, ingresa un correo electrónico válido.");
                // Response.Redirect(Request.Url.AbsoluteUri);  // Redirige a la misma pag para mostrar el error
                //return;
            }

            if (string.IsNullOrWhiteSpace(mensaje))
            {
                Response.Write("<script>alert('Por favor, ingresa tu mensaje.');</script>");
                return;
            }

            EmailAS emailData = new EmailAS();


            try
            {
                emailData.ArmarCorreo(email, nombre, asunto);
                emailData.EnviarEmail();
                Response.Write("<script>alert('Correo enviado exitosamente.');</script>");

                // vaciamos el formulario
                txtNombre.Text = string.Empty;
                txtAsunto.Text = string.Empty;
                txtEmailContacto.Text = string.Empty;
                txtMensaje.Text = string.Empty;
                // enviamos a la pagina de inicio
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {

                Response.Write($"<script>alert('Error al enviar el correo: {ex.Message}');</script>");
            }

        }
        private bool IsValidEmail(string email)
        {   // funciono para validar si es un formato email valido el que se ingreso
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;  // Verifica si el correo ingresado es igual al que se genero con MailAddress
            }
            catch
            {
                return false;
            }
        }
    }
}