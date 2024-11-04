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
            try
            {

                if (!IsPostBack)
                {
                    // Inicializa el formulario como no visible al cargar la página
                    addArticleForm.Visible = false;
                    if (Request.QueryString["id"] != null)
                    {
                        string id = Request.QueryString["id"];
                        ArticuloAS data = new ArticuloAS();
                        Articulo articuloSeleccionado = (data.ObtenerIdXModificacion())[0];
                    }
                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
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
            addArticleForm.Visible = false; // Ocultar el formulario
            LoadArticle(); // Cargar y mostrar artículos en el GridView
            dgvArticles.Columns[]
        }

        protected void btnReportPrueba_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnReportStock_Click(object sender, EventArgs e)
        {
            // Ver reporte de stock
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


            TipoAS tipo = new TipoAS();
            ddListType.DataSource = tipo.listar();
            ddListType.DataValueField = "Id";
            ddListType.DataTextField = "Descripcion";
            ddListType.DataBind();

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

                // valida si los campos estan vacios
                if (string.IsNullOrWhiteSpace(txtCodeArticle.Text))
                {
                    throw new Exception("El código del artículo es obligatorio.");
                }
                if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
                {
                    throw new Exception("La descripción del artículo es obligatoria.");
                }
                if (txtCodeArticle.Text.Length > 10)
                {
                   // Console.WriteLine("El código del articulo no puede exceder los 10 caracteres.");
                    throw new Exception("El código del articulo no puede exceder los 10 caracteres.");
                }
                // Asignar valores a las propiedades del artículo
                articulo.Codigo = txtCodeArticle.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Detalle = txtDetalle.Text;
                articulo.Marca = new Marca();
                articulo.Tipo = new Tipo();
                articulo.Categoria = new Categoria();

                articulo.Marca.Id = int.Parse(ddListType.SelectedValue);
                articulo.Tipo.Id = int.Parse(ddListType.SelectedValue);
                articulo.Categoria.Id = int.Parse(ddListCategory.SelectedValue);


                data.AgregarNuevoArticulo(articulo);
                labelMsj.Text= "¡Se ha agregado exitosamente!";
                labelMsj.Visible = true;
                LimpiarFormulario();
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

        protected void dgvArticles_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            ArticuloAS data = new ArticuloAS();
            if (e.CommandName == "Modificar")
            {
                    dgvArticles.Visible = false;
                string idArticle = e.CommandArgument.ToString();
                //loadArticle(idArticle); // carga el articulo seleccionado
                int idArticulo = Convert.ToInt32(e.CommandArgument);
                List<Articulo> listaArticulos = data.ObtenerIdXModificacion(idArticulo.ToString());

                // Verificar si la lista tiene elementos
                if (listaArticulos.Count > 0)
                {
                    // Asignar el primer artículo de la lista al objeto articulo
                    Articulo articulo = listaArticulos[0];
                    articulo.Marca = new Marca();
                    articulo.Categoria = new Categoria();
                    articulo.Tipo = new Tipo();
                    // Rellenar los controles con la información del artículo
                    txtCodeArticle.Text = articulo.Codigo;
                    txtDescripcion.Text = articulo.Descripcion;
                    txtDetalle.Text = articulo.Detalle;
                    if (articulo.Marca != null)
                    {
                        ddListBrand.SelectedValue = articulo.Marca.Id.ToString();
                    }

                    if (articulo.Tipo != null)
                    {
                        ddListType.SelectedValue = articulo.Tipo.Id.ToString();
                    }

                    if (articulo.Categoria != null)
                    {
                        ddListCategory.SelectedValue = articulo.Categoria.Id.ToString();
                    }

                    // Hacer visible el formulario para editar
                    addArticleForm.Visible = true; 

                }
                else
                {
                    // Manejo de error: no se encontró ningún artículo con el ID proporcionado
                    Console.WriteLine("No se encontró el artículo con el ID especificado.");
                }

            }
            else if (e.CommandName == "Delete")
            {
                    int IdArticulo = Convert.ToInt32(e.CommandArgument);
                    data.DeleteArticulo(IdArticulo);
                    LoadArticle();
            }
        }
        private void LoadArticle()
        {
              // Carga el GridView con artículos
              ArticuloAS articulo = new ArticuloAS();
              dgvArticles.DataSource = articulo.listar(); 
              dgvArticles.DataBind(); 
              dgvArticles.Visible = true; 
        }

        protected void dgvArticles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void dgvArticles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IdArticulo = Convert.ToInt32(e.Keys["Id"]);
            ArticuloAS data = new ArticuloAS();
            data.DeleteArticulo(IdArticulo);
            LoadArticle();
        }

       
        private void CargarArticuloParaModificar(int idArticulo)
        {
            // Obtener el artículo a modificar desde la base de datos utilizando su ID
            ArticuloAS data = new ArticuloAS();
            data.ObtenerIdXModificacion(idArticulo.ToString());
            Articulo articulo = new Articulo();
            articulo.Marca = new Marca();
            articulo.Categoria = new Categoria();
            articulo.Tipo = new Tipo();
            if (articulo != null)
            {
                // Precargar los valores en los campos de texto del formulario
                txtCodeArticle.Text = articulo.Codigo;
                txtDescripcion.Text = articulo.Descripcion;
                txtDetalle.Text = articulo.Detalle;

                // Precargar los valores de los DropDownList (asegúrate que las listas ya estén cargadas)
                if (ddListBrand.Items.FindByValue(articulo.Marca.Id.ToString()) != null)
                {
                    ddListBrand.SelectedValue = articulo.Marca.Descripcion.ToString();
                }
                if (ddListCategory.Items.FindByValue(articulo.Categoria.Descripcion.ToString()) != null)
                {
                    ddListCategory.SelectedValue = articulo.Categoria.Descripcion.ToString();
                }
                if (ddListType.Items.FindByValue(articulo.Tipo.Descripcion.ToString()) != null)
                {
                    ddListType.SelectedValue = articulo.Tipo.Descripcion.ToString();
                }

                dgvArticles.Visible = false;
                addArticleForm.Visible = true;
                // Mostrar el formulario y ocultar el GridView
            }
            else
            {
                // Manejar el caso cuando el artículo no se encuentra (opcional)
                labelMsj.Text = "El artículo no fue encontrado.";
                labelMsj.Visible = true;
            }
        }

        private void LimpiarFormulario()
        {
            txtCodeArticle.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtDetalle.Text = string.Empty;


            ddListType.SelectedIndex = 0;
            ddListBrand.SelectedIndex = 0;
            ddListCategory.SelectedIndex = 0;


        }

        protected void dgvArticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ArticuloAS data = new ArticuloAS();

            if (e.CommandName == "Modificar")
            {
                // obetenemos id para mofificar
                int idArticulo = Convert.ToInt32(e.CommandArgument);
                CargarArticuloParaModificar(idArticulo);
            }
            else if (e.CommandName == "Eliminar")
            {
                // obtenemos id para eliminar, llamamos a la funcion eliminar y volvemos a cargar la grilla
                int idArticulo = Convert.ToInt32(e.CommandArgument);
                data.DeleteArticulo(idArticulo);
                LoadArticle();
            }
        }

        protected void btnPetificaciones_Click(object sender, EventArgs e)
        {
            ///logica
             ArticuloAS data = new ArticuloAS();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ArticuloAS data = new ArticuloAS();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ArticuloAS data = new ArticuloAS();
        }
    }
}