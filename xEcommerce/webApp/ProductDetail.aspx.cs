﻿using DataPersistence;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

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
                // Agregar la opción de "Seleccioná Color" en ddlColor
                ddlColor.Items.Insert(0, new ListItem("Seleccioná Color", "0"));

                // Agregar la opción de "Seleccioná Talle" en ddlTalle
                ddlTalle.Items.Insert(0, new ListItem("Seleccioná Talle", "0"));

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
                    dataManipulator.configSqlProcedure("Catalogo.ObtenerArticuloPorIdParaCards");
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
                    dataAccess.closeConnection();

                    dataAccess.openConnection();

                    dataManipulator.configSqlProcedure("Catalogo.ObtenerColoresPorIdParaDetalle");
                    dataManipulator.configSqlConexion(dataAccess.getConnection());
                    dataManipulator.configSqlParams("@Id", productId);

                    SqlDataReader result = dataManipulator.exectQuerry();

                    List<Color> listaColor = new List<Color>();
                    while (result.Read())
                    {
                        Color aux = new Color();

                        aux.Id = (int)result["Id de Color"];
                        aux.Codigo = result["Codigo de Color"].ToString();
                        aux.Descripcion = result["Descripcion de Color"].ToString();
                        listaColor.Add(aux);

                    }
                    dataAccess.closeConnection();

                    ddlColor.DataSource = listaColor;
                    ddlColor.DataValueField = "Id";
                    ddlColor.DataTextField = "Descripcion";
                    ddlColor.DataBind();


                    dataAccess.openConnection();


                    dataManipulator.configSqlProcedure("Catalogo.ObtenerTallesPorIdParaDetalle");
                    dataManipulator.configSqlConexion(dataAccess.getConnection());
                    dataManipulator.configSqlParams("@Id", productId);

                    SqlDataReader resultado = dataManipulator.exectQuerry();

                    List<Talle> listaTalle = new List<Talle>();
                    while (resultado.Read())
                    {
                        Talle aux = new Talle();

                        aux.Id = (int)resultado["Id de Talle"];
                        aux.Codigo = resultado["Codigo de Talle"].ToString();
                        aux.Descripcion = resultado["Descripcion de Talle"].ToString();


                        listaTalle.Add(aux);
                    };
                    ddlTalle.DataSource = listaTalle;
                    ddlTalle.DataValueField = "Id";
                    ddlTalle.DataTextField = "Descripcion";
                    ddlTalle.DataBind();


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

        ///////////////////////////////////////////////////////////////////////////////////////////////
        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPrecio();
        }

        protected void ddlTalle_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPrecio();
        }


        /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        private void LoadPrecio()
        {
            int productId = Convert.ToInt32(Request.QueryString["ProductId"]);
            int selectedColorId = Convert.ToInt32(ddlColor.SelectedValue);
            int selectedTalleId = Convert.ToInt32(ddlTalle.SelectedValue);

            try
            {
                dataAccess.openConnection();
                dataManipulator.configSqlProcedure("Catalogo.ObtenerSyPPorIdParaDetalle");
                dataManipulator.configSqlConexion(dataAccess.getConnection());
                dataManipulator.configSqlParams("@Id", productId);

                SqlDataReader precioReader = dataManipulator.exectQuerry();

                bool precioEncontrado = false;

                while (precioReader.Read())
                {
                    int colorId = (int)precioReader["Id de Color"];
                    int talleId = (int)precioReader["Id de Talle"];

                    if (colorId == selectedColorId && talleId == selectedTalleId)
                    {
                        decimal precio = Convert.ToDecimal(precioReader["Precio"]);
                        lblPrecio.Text = "Precio: $" + precio.ToString("F2");

                        // Obtengo la cantidad
                        int cantidad = Convert.ToInt32(precioReader["Cantidad"]);

                        // Muestro u oculto segun al cantidad
                        if (cantidad > 0)
                        {
                            // Si hay stock, muestro el precio y la cantidad
                            lblPrecio.Visible = true;
                            lblStock.Visible = true;
                            lblStock.Text = "Cantidad disponible: " + cantidad.ToString();
                            lblNoStock.Visible = false; 
                        }
                        else
                        {
                            // Si no hay stock, muestro el mensaje de SIN STOCK
                            lblPrecio.Visible = false;
                            lblStock.Visible = false;
                            lblNoStock.Visible = true;
                        }

                        precioEncontrado = true;
                        break;
                    }
                }

                // Si no encontré precio o stock pongo SIN STOCK
                if (!precioEncontrado)
                {
                    lblPrecio.Visible = false;
                    lblStock.Visible = false;
                    lblNoStock.Visible = true;
                }

                dataAccess.closeConnection();
            }
            catch (Exception ex)
            {
                Response.Write("Error al cargar el precio: " + ex.Message);
            }
        }



        
        protected void btnAgregarACarrito_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                // si el user ya está logueado agrego el producto al carrito ACA VA LA LOGICA
                Response.Redirect("Sales.aspx", false);
            }
            else //user no logueado
            {
                // Obtengo el ID del producto desde la URL
                string productId = Request.QueryString["productId"];

                if (!string.IsNullOrEmpty(productId))
                {
                // Guardo el productId en la sesión para usarlo después del login
                    Session["productId"] = productId;
                }

                Response.Redirect("Login.aspx", false);
                
            }
        }
    }

}
