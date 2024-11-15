﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["error"] != null)
                lblMensaje.Text = Session["error"].ToString();
        }

        protected void btnError_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }

        protected void btnErrorCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false );
        }
    }
}