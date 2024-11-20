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

        //protected void btnEnviar_Click(object sender, EventArgs e)
        //{
        //    EmailAS emailData = new EmailAS();

        //    string nombre = txtNombre.Text;
        //    string asunto = txtAsunto.Text;
        //    string email = txtEmailContacto.Text;
        //    //string mensaje = txtMensaje.Text;

        //    try
        //    {
        //        emailData.ArmarCorreo(email, nombre, asunto);
        //        emailData.EnviarEmail();
        //        Response.Write("<script>alert('Correo enviado exitosamente.');</script>");

        //        txtNombre.Text = string.Empty;
        //        txtAsunto.Text = string.Empty;
        //        txtEmailContacto.Text = string.Empty;
        //      //  txtMensaje.Text = string.Empty;

        //        Response.Redirect("AdminPanel.aspx");
        //    }
        //    catch (Exception ex)
        //    {

        //        Response.Write($"<script>alert('Error al enviar el correo: {ex.Message}');</script>");
        //    }

        //}
    }
}