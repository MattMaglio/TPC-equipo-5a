using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null) //si no hay usuario cargado en sesión debe loguearse para seguir
            {
                Session.Add("error", "Ingresá a tu cuenta para continuar");
                Response.Redirect("Login.aspx", false);
            }
        }
    }
}