using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario está logueado
            if (Session["usuario"] != null)
            {
                var usuario = (Model.Usuario)Session["usuario"];

                string nombreUsuario = usuario.User;

                // Si es ADMIN, muestra botones para ADMIN
                if (usuario.TipoUsuario == Model.TipoUsuario.ADMIN)
                {
                    //HEADER
                    litMiCuenta.Visible = false;  // Ocultar "Mi Cuenta" para ADMIN
                    litLogin.Visible = false; // no veo el login
                    litCarrito.Visible = true; // veo el cart
                    lnkSalir.Visible = true;//veo SALIR
                    litAdminPanel.Visible = true; //veo AdminPanel
                    litUserGreeting.Text = "Hola, " + nombreUsuario;//veo nombre de user
                    litUserGreeting.Visible = true;


                }
                // Si es NORMAL, muestra botones para usuario NORMAL
                else if (usuario.TipoUsuario == Model.TipoUsuario.NORMAL)
                {   
                    //HEADER
                    litMiCuenta.Visible = true;  // Mostrar "Mi Cuenta" si el usuario no es ADMIN
                    litLogin.Visible = false; // no veo el Login
                    litCarrito.Visible = true; // veo el cart
                    lnkSalir.Visible=true; //veo SALIR
                    litAdminPanel.Visible = false;

                    litUserGreeting.Text = "Hola, " + nombreUsuario;//veo nombre de user
                    litUserGreeting.Visible = true;


                }
            }
            else
            {
                // Si no hay usuario en la sesión:

                //HEADER
                litCarrito.Visible = false; // no veo el cart
                litLogin.Visible = true; //veo el Login
                lnkSalir.Visible = false; //no veo SALIR
                litAdminPanel.Visible = false; //no veo AdminPanel

                
                litUserGreeting.Visible = false;//no veo el saludo

            }
        }
        protected void lnkSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}

       

//        protected void btnMiCuenta_Click1(object sender, EventArgs e)
//        {
//            //if (Session["usuario"] == null)
//            //{
//            //    Session.Add("error", "Ingresá a tu cuenta para continuar");
//            //    Response.Redirect("Login.aspx", false);
//            //}
//        }
//    }
//}

//if (Session["usuario"] != null && ((Model.Usuario)Session["usuario"]).TipoUsuario == Model.TipoUsuario.ADMIN) {//aparecen los botones o lo que corresponda en la pagina }