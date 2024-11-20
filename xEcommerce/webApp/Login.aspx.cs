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


        //INGRESO DEL USUARIO
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioAS usuarioAS = new UsuarioAS();


            try
            {
                //intento verificar al user
                usuario = new Usuario(txtUser.Text, txtPassword.Text, false);

                //chequeo si el login fue exitoso
                if (usuarioAS.Loguear(usuario))
                {
                    //login exitoso, agrego al user a la session
                    Session.Add("usuario", usuario);

                    //Inicializa la lista del carrito en la sesión:
                    if (Session["Carrito"] == null)
                    {
                        Session["Carrito"] = new List<Carrito>();
                    }

                    //chequeo si hay un productId en la session
                    if (Session["productId"] != null)
                    {
                        string productId = Session["productId"].ToString();

                        // Si existe productId, redirijo al detalle del producto para que lo agregue VER CON LA LOGICA DEL CART PARA AGREGARLO
                        Response.Redirect("ProductDetail.aspx?productId=" + productId, false);
                    }
                    else //no habia productId 
                    {
                        Response.Redirect("MyAccount.aspx", false);
                    }
                }
                else //fallo el login
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