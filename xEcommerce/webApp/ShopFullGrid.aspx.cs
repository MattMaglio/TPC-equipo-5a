using ApplicationService;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class ShopFullGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaAS CatAS = new CategoriaAS();
            List<Categoria> listCategorias = CatAS.listar();

            ddlCategoria.DataSource = listCategorias;
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataTextField = "Descripcion";
            ddlCategoria.DataBind();
        }
    }
}