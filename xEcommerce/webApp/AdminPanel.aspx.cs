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

namespace webApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializa el formulario como no visible al cargar la página
                addArticleForm.Visible = false;
                LoadArticle();
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
            addArticleForm.Visible = false; // Ocultar el formulario
            LoadArticle(); // Cargar y mostrar artículos en el GridView
        }

        protected void btnTwoForOne_Click(object sender, EventArgs e)
        {
            // BOTON PARAA AGREGAR PROMOCION
           // apllyPromotion("2x1");
        }

        protected void btnTenPercentOff_Click(object sender, EventArgs e)
        {
            // BOTON PARAA AGREGAR PROMOCION
            // apllyPromotion("10%");
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

            // Response.Redirect(Request.RawUrl);
        }

        protected void txtImageUrl_TextChanged(object sender, EventArgs e)
        {
            imgPreview.ImageUrl = txtImageUrl.Text;
        }

        protected void btnSaveArticle_Click(object sender, EventArgs e)
        {
            //CAPTURAMOS LOS DATOS DE LA CARGA DE NUEVO ARTICULO
            /* string idArticle = txtIdArticle.Text;
            string name = txtName.Text;
            string brand = ddListBrand.SelectedValue; // MARCA
            string size = txtSize.Text;
            int stock = int.Parse(txtStock.Text); 
            decimal price = decimal.Parse(txtPrice.Text);
            string color = txtColor.Text;
            string guy = ddListType.SelectedValue; //TIPO
            string image = txtImageUrl.Text;
            bool fileImage = fileUploadImg.HasFiles; // verificamos si se subio el archivo

            if (fileImage)
            {
                string filePath = Server.MapPath("RUTA PARA GUARDAR LOS ARCHIVOS") + fileUploadImg.FileName;
                fileUploadImg.SaveAs(filePath); // guarda img en la ruta
            }

            Article newArticle = new Article() // opcion para guardar el articulo nuevo
            ID = idArticle
            Name = name;
            Brand = brand;
            Size = size;
            Stock = stock;
            Price = price;
            Color = color;
            Type = type;
            Image = image;
            saveNewArticle(article);

             */
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
            ArticuloAS articulo = new ArticuloAS();
            dgvArticles.DataSource = articulo.listar(); // Obtener lista de artículos
            dgvArticles.DataBind(); // Asociar la fuente de datos al GridView
            dgvArticles.Visible = true; // Asegúrate de que el GridView sea visible
            
        }

    }
}