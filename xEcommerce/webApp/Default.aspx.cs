using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataPersistence;
using Model;

namespace webApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductosDestacados();
            }
        }

        private void CargarProductosDestacados()
        {
            DataAccess dataAccess = new DataAccess();
            DataManipulator dataManipulator = new DataManipulator();

            try
            {
                dataAccess.openConnection();
                dataManipulator.configSqlProcedure("Catalogo.ListarArticulosDestacadosConImagen");
                dataManipulator.configSqlConexion(dataAccess.getConnection());

                SqlDataReader reader = dataManipulator.exectQuerry();

                rptFeaturedProducts.DataSource = reader;
                rptFeaturedProducts.DataBind();
            }
            catch (Exception ex)

            {
                throw ex;
            }
            finally
            {
                dataAccess.closeConnection();
            }
        }

        protected void btnGoToShop_Click(object sender, EventArgs e)
        {
            // Redirigir a ShopFullGrid.aspx
            Response.Redirect("ShopFullGrid.aspx");
        }



    }
}



