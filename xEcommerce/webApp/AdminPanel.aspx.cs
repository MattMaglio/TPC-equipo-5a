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
using System.Security.Cryptography;

namespace webApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        public bool IsEditMode
        {
            get { return ViewState["IsEditMode"] != null && (bool)ViewState["IsEditMode"]; }
            set { ViewState["IsEditMode"] = value; }
        }
        //private int _isEditId; // Variable privada para almacenar el ID
        //public int IsEditId
        //{
        //    get { return _isEditId; }
        //    set { _isEditId = value; }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {   
            try
            {
                if (!IsPostBack)
                {
                    // Inicializa el formulario como no visible al cargar la página
                    addArticleForm.Visible = false;
                    if (Request.QueryString["id"]!= null)
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
            //BOTON PÁRA VER EL  GRIDVIEW LOS ARTICULOS
            addArticleForm.Visible = false; // Ocultar el formulario
            LoadArticle(); // Cargar y mostrar artículos en el GridView
        }
        protected void btnReportStockPorArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfreport_stockporarticulo.aspx");
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
            IsEditMode = false;
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
            {
                //CAPTURAMOS LOS VALORES INGRESADOS EN EL FORMULARIO
                Articulo articulo = new Articulo();
                ArticuloAS data = new ArticuloAS();

                // valida si los campos estan vacios
                if (string.IsNullOrWhiteSpace(txtCodeArticle.Text))
                {
                    throw new Exception("El código del artículo es obligatorio.");
                }

                if (!IsEditMode)
                {
                    if (data.ValidarCodigoActivo(txtCodeArticle.Text) == 1)
                    {
                        throw new Exception("El código del artículo esta en uso.");
                    }
                }

                if (string.IsNullOrWhiteSpace(txtDescripcion.Text))
                {
                    throw new Exception("La descripción del artículo es obligatoria.");
                }

                if (string.IsNullOrWhiteSpace(txtDetalle.Text))
                {
                    throw new Exception("El detalle del artículo es obligatorio.");
                }
                // validacion tamaño del texto
                if (txtCodeArticle.Text.Length > 10)
                {
                    Console.WriteLine("El código del articulo no puede exceder los 10 caracteres.");
                    throw new Exception("El código del articulo no puede exceder los 10 caracteres.");
                }
                if (txtDetalle.Text.Length > 250)
                {
                    throw new Exception("El detalle del articulo no puede exceder los 50 caracteres.");
                }

                // Asignar valores a las propiedades del artículo
                
                articulo.Codigo = txtCodeArticle.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Detalle = txtDetalle.Text;
                articulo.Marca = new Marca();
                articulo.Tipo = new Tipo();
                articulo.Categoria = new Categoria();

                articulo.Marca.Id = int.Parse(ddListBrand.SelectedValue);
                articulo.Tipo.Id = int.Parse(ddListType.SelectedValue); 
                articulo.Categoria.Id = int.Parse(ddListCategory.SelectedValue);


                if (IsEditMode)
                {
                    data.ModificarArticulo(articulo);
                }
                else
                {
                    data.AgregarNuevoArticulo(articulo);
                }
                labelMsj.Text = "¡Se ha agregado exitosamente!";
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

        protected void dgvArticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ArticuloAS data = new ArticuloAS();
            if (e.CommandName == "Modificar")
            {
                IsEditMode = true;

                int idArticulo = Convert.ToInt32(e.CommandArgument);
                List<Articulo> listaArticulos = data.ObtenerIdXModificacion(idArticulo.ToString());

                // Verificar si la lista tiene elementos
                if (listaArticulos.Count > 0)
                {
                    // Asignar el primer artículo de la lista al objeto articulo
                    Articulo articulo = listaArticulos[0];

                    // Rellenar los controles con la información del artículo

                    txtCodeArticle.Text = articulo.Codigo;
                    txtDescripcion.Text = articulo.Descripcion;
                    txtDetalle.Text = articulo.Detalle;

                    MarcaAS marca = new MarcaAS();
                    ddListBrand.DataSource = marca.listar();
                    ddListBrand.DataValueField = "Id";
                    ddListBrand.DataTextField = "Descripcion";
                    ddListBrand.DataBind();

                    ddListBrand.SelectedValue = articulo.Marca.Id.ToString();

                    TipoAS tipo = new TipoAS();
                    ddListType.DataSource = tipo.listar();
                    ddListType.DataValueField = "Id";
                    ddListType.DataTextField = "Descripcion";
                    ddListType.DataBind();

                    ddListType.SelectedValue = articulo.Tipo.Id.ToString();

                    CategoriaAS categoria = new CategoriaAS();
                    ddListCategory.DataSource = categoria.listar();
                    ddListCategory.DataValueField = "Id";
                    ddListCategory.DataTextField = "Descripcion";
                    ddListCategory.DataBind();

                    ddListCategory.SelectedValue = articulo.Categoria.Id.ToString();


                    // Hacer visible el formulario para editar
                    addArticleForm.Visible = true; // El formulario debe ser el div que contiene tus 
                    dgvArticles.Visible = false;
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

                // Mostrar el formulario y ocultar el GridView
                addArticleForm.Visible = true;
                dgvArticles.Visible = false;
            }
            else
            {
                // Manejar el caso cuando el artículo no se encuentra (opcional)
                labelMsj.Text = "El artículo no fue encontrado.";
                labelMsj.Visible = true;
            }
        }
        private void LoadArticle()
        {
            // Carga el GridView con artículos
            ArticuloAS articulo = new ArticuloAS();
            dgvArticles.DataSource = articulo.listar(); 
            dgvArticles.DataBind(); 
            dgvArticles.Visible = true;
            dgvArticles.Columns[0].Visible = false;
            dgvArticles.Columns[7].Visible = false;
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

        protected void dgvArticles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IdArticulo = Convert.ToInt32(e.Keys["Id"]); 
            ArticuloAS data = new ArticuloAS();
            data.DeleteArticulo(IdArticulo);
            LoadArticle();
        }

        protected void dgvArticles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
      
        }

    }
}