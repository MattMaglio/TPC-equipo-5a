using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using ApplicationService;

namespace webApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        
        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateUser.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioAS usuarioAS = new UsuarioAS();


            try
            {
                usuario = new Usuario(txtUser.Text, txtPassword.Text, false);
                if (usuarioAS.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("MyAccount.aspx", false);

                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("Error.aspx", false);
                }




            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}