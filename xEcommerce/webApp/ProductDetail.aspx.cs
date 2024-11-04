using DataPersistence;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        private DataAccess dataAccess = new DataAccess();
        private DataManipulator dataManipulator = new DataManipulator();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            int productId;
            if (int.TryParse(Request.QueryString["ProductId"], out productId))
            {
                try
                {
                    dataAccess.openConnection();
                    dataManipulator.configSqlProcedure("Catalogo.ObtenerArticuloPorId");
                    dataManipulator.configSqlConexion(dataAccess.getConnection());
                    dataManipulator.configSqlParams("@Id", productId);

                    SqlDataReader reader = dataManipulator.exectQuerry();

                    if (reader.Read())
                    {
                        
                        lblProductName.Text = reader["Name"].ToString();
                        //lblPrice.Text = "$" + Convert.ToDecimal(reader["Price"]).ToString("F2");
                        lblBrand.Text = reader["MarcaDescripcion"].ToString();
                        lblCategory.Text = reader["CategoriaDescripcion"].ToString();
                        lblType.Text = reader["TipoDescripcion"].ToString();
                        lblDescription.Text = reader["Detalle"].ToString();
                        imgProduct.ImageUrl = reader["ImageUrl"].ToString();
                    }
                    else
                    {
                        
                        lblProductName.Text = "Producto no encontrado.";
                    }
                }
                catch (Exception ex)
                {
                    
                    Response.Write("Error al cargar los detalles del producto: " + ex.Message);
                }
                finally
                {
                    dataAccess.closeConnection();
                }
            }
            else
            {
                
                lblProductName.Text = "ID de producto no válido.";
            }
        }

    }
}