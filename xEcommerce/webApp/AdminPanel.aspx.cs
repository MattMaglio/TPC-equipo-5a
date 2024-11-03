using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DataPersistence;
using ApplicationService;
using System.Data.SqlTypes;

namespace webApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializa el formulario como no visible al cargar la página
                // addArticleForm.Visible = false;
                //LoadArticle();
               
            }


            /* dgvPanelAdmin.DataSource = clients.listar(); // CLIENTES
             dgvPanelAdmin.DataBind(); 

             dgvPanelAdmin.DataSource = sell.listar(); // VENTAS
             dgvPanelAdmin.DataBind(); */
        }

        protected void btnViewSell_Click(object sender, EventArgs e)
        {
            //METODO QUE VAMOS A UTILIZAR PARA LA CARGA DE LAS VENTAS
            /* Ventas ventas = new Ventas();
             string query = "SELECT VentaID, Cliente, Fecha, Total FROM Ventas";
             dgvSell.DataSource = ventas.listar();
             dgvSell.DataBind();*/
        }

        protected void btnViewArticles_Click(object sender, EventArgs e)
        {
            //BOTON PÁRA VER EL  GRIDVIEW LOS ARTICULOS
           // addArticleForm.Visible = false; // Ocultar el formulario
           // LoadArticle(); // Cargar y mostrar artículos en el GridView
        }

        protected void btnReportPrueba_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnReportStockYPrecio_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfreport_stockyprecios.aspx");
        }
        private void apllyPromotion(string promotion)
        {
            //logica para obtener datos del carrito y hacer las promo
        }

        protected void btnAddArticle_Click(object sender, EventArgs e)
        {
            //BOTON PARA AGREGAR ARTICULOS
            addArticleForm.Visible = true;
            dgvArticles.Visible = false;
            MarcaAS marca = new MarcaAS();
            ddListBrand.DataSource = marca.listar();
            ddListBrand.DataValueField = "Id";
            ddListBrand.DataTextField = "Descripcion";
            ddListBrand.DataBind();

            CategoriaAS categoria = new CategoriaAS();
            ddListCategory.DataSource = categoria.listar();
            ddListCategory.DataValueField = "Id";
            ddListCategory.DataTextField = "Descripcion";
            ddListCategory.DataBind();

            ColorAS color = new ColorAS();
            ddListColors.DataSource = color.listar();
            ddListColors.DataValueField = "Id";
            ddListColors.DataTextField = "Descripcion";
            ddListColors.DataBind();

            TipoAS tipo = new TipoAS();
            ddListType.DataSource = tipo.listar();
            ddListType.DataValueField = "Id";
            ddListType.DataTextField = "Descripcion";
            ddListType.DataBind();

            TallesAS talle = new TallesAS();
            ddListSize.DataSource = talle.listar();
            ddListSize.DataValueField = "Id";
            ddListSize.DataTextField = "Descripcion";
            ddListSize.DataBind();


            // Response.Redirect(Request.RawUrl);
        }

        protected void txtImageUrl_TextChanged(object sender, EventArgs e)
        {
            //imgPreview.ImageUrl = txtImageUrl.Text;
        }

        protected void btnSaveArticle_Click(object sender, EventArgs e)
        {
            try
            {   //CAPTURAMOS LOS VALORES INGESADOS EN EL FORMULARIO
                Articulo articulo = new Articulo();
                ArticuloAS data = new ArticuloAS();

                articulo.Codigo = txtCodeArticle.Text;
                articulo.Descripcion = txtName.Text;
                articulo.Stock = int.Parse(txtStock.Text);
                articulo.Precio = float.Parse(txtPrice.Text);

                articulo.Marca = new Marca();
                articulo.Talle = new Talle();
                articulo.Color = new Color();
                articulo.Tipo = new Tipo();
                articulo.Categoria = new Categoria();

                articulo.Marca.Id = int.Parse(ddListType.SelectedValue);
                articulo.Talle.Id = int.Parse(ddListSize.SelectedValue);
                articulo.Color.Id = int.Parse(ddListColors.SelectedValue);
                articulo.Tipo.Id = int.Parse(ddListType.SelectedValue);
                articulo.Categoria.Id = int.Parse(ddListCategory.SelectedValue);

                List<Imagen> imageList = new List<Imagen>();

                if (!string.IsNullOrEmpty(txtUrlImage1.Text))
                {
                    Imagen imagen1 = new Imagen();
                    imagen1.UrlImagen = txtUrlImage1.Text;
                    imageList.Add(imagen1);
                }
                if (!string.IsNullOrEmpty(txtImageUrl2.Text))
                {
                    Imagen imagen2 = new Imagen();
                    imagen2.UrlImagen = txtImageUrl2.Text;
                    imageList.Add(imagen2);
                }
                if (!string.IsNullOrEmpty(txtImageUrl3.Text))
                {
                    Imagen imagen3 = new Imagen();
                    imagen3.UrlImagen = txtImageUrl3.Text;
                    imageList.Add(imagen3);
                }
                // FALTA REALIZAR LA FUNCION-SP PARA AGREGAR EL ARTICULO A LA DB

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex); //DESPUES LO MANDAMOS A UNA PAGINA DE ERROR
                throw;
            }


        }
         protected string GetStatusIcon(object status)
        {
            /* // funcion para poner iconos en los status de las ventas
            if (status == null)
                return "~/Images/default.png";

            string statusValue = status.ToString().ToLower();

            switch (statusValue)
            {
                case "completed":
                    return "~/Images/check.png"; // URL del ícono de completado
                case "cancelled":
                    return "~/Images/x.png"; // URL del ícono de cancelación
                case "in process":
                    return "~/Images/circle.png"; // URL del ícono en proceso
                default:
                    return "~/Images/default.png"; // Imagen por defecto
            }*/
            return "~/Images/default.png";
        }

        protected void dgvArticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           /* if (e.CommandName == "Update")
            {
                string idArticle = e.CommandArgument.ToString();
                //loadArticle(idArticle); // carga el articulo seleccionado
            }
            else if(e.CommandName == "Delete")
            {
                string idArticle = e.CommandArgument.ToString();
                deleteArticle(idArticle); //
            }*/
        }
        private void LoadArticle()
        {
            // Carga el GridView con artículos
          /*  ArticuloAS articulo = new ArticuloAS();
            dgvArticles.DataSource = articulo.listar(); 
            dgvArticles.DataBind(); 
            dgvArticles.Visible = true; */
        }

    }
}