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

        }

       

        protected void btnMiCuenta_Click1(object sender, EventArgs e)
        {
            //if (Session["usuario"] == null)
            //{
            //    Session.Add("error", "Ingresá a tu cuenta para continuar");
            //    Response.Redirect("Login.aspx", false);
            //}
        }
    }
}