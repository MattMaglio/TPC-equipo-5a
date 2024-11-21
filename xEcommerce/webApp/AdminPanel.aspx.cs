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
using Model.Scripts;
using System.Data.SqlClient;
using System.Collections;
using static System.Net.Mime.MediaTypeNames;

namespace webApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        
        public bool IsEditMode
        {
            get { return ViewState["IsEditMode"] != null && (bool)ViewState["IsEditMode"]; }
            set { ViewState["IsEditMode"] = value; }
        }
        public int TipificSelected
        {
            get { return ViewState["TipificSelected"] != null ? (int)ViewState["TipificSelected"] : 0; }
            set { ViewState["TipificSelected"] = value; }
        }
        
        /* Elementos Grales */
        protected void Page_Load(object sender, EventArgs e)
        {   
            try
            {
                if (!IsPostBack)
                {
                    // Verificar si la sesión del usuario está activa y si tiene permisos de ADMIN
                    if (Session["usuario"] == null ||
                       ((Usuario)Session["usuario"]).TipoUsuario != TipoUsuario.ADMIN)
                    {
                        Session.Add("error", "Debes loguearte con permisos de Admin para ingresar a esta sección");
                        Response.Redirect("ErrorLogueoAdmin.aspx");
                    }
                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
            }
        }
        protected void MostarElentoSelecionado(string grupo)
        {
            try
            {
                // Formulario Alta y Mod de Articulos
                div_gral_frmArt.Visible = false;
                // Grilla de Articulos
                div_gral_dgvArt.Visible = false;
                // Grilla de Stock y Precio
                div_gral_dgvSyp.Visible = false;
                // Formulario Alta y Mod de Tipificacion
                div_gral_frmTip.Visible = false;
                // Grilla de Tipificaciones
                div_gral_dgvTip.Visible = false;
                // Grilla de Ordenes
                div_gral_dgvOrden.Visible = false;
                // Grilla de Detalle de ordenes
                div_gral_dgvDetalleOrden.Visible = false;

                switch (grupo)
                {
                    case "div_gral_frmArt":
                        div_gral_frmArt.Visible = true;
                        break;

                    case "div_gral_dgvArt":
                        div_gral_dgvArt.Visible = true;
                        break;

                    case "div_gral_frmTip":
                        div_gral_frmTip.Visible = true;
                        break;

                    case "div_gral_dgvTip":
                        div_gral_dgvTip.Visible = true;
                        break;
                    
                    case "div_gral_dgvSyp":
                        div_gral_dgvSyp.Visible = true;
                        break;

                    case "div_gral_dgvOrden":
                        div_gral_dgvOrden.Visible = true;
                        break;

                    case "div_gral_dgvDetalleOrden":
                        div_gral_dgvDetalleOrden.Visible = true;
                        break;

                    default:
                        break;
                }
            }
            catch { }
        }
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtiene el valor seleccionado del DropDownList y lo asigna a PageSize
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            dgvArticles.PageSize = pageSize;

            // Reinicia la página a la primera cada vez que se cambie el tamaño de página
            dgvArticles.PageIndex = 0;

            // Recarga los datos en la grilla
            LoadArticle();
        }
 
        /* SECCION ARTICULOS */

        // Agregar - Modificar articulos
        private void LimpiarFormulario()
        {
            txtCodeArticle.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtDetalle.Text = string.Empty;

            ddListType.SelectedIndex = 0;
            ddListBrand.SelectedIndex = 0;
            ddListCategory.SelectedIndex = 0;

            txtImagen1.Text = string.Empty;
            IdImagen1.ImageUrl = string.Empty;

            txtImagen2.Text = string.Empty;
            IdImagen2.ImageUrl = string.Empty;
            
            txtImagen3.Text = string.Empty;
            IdImagen3.ImageUrl = string.Empty;

        }
        protected string GetStatusIcon(object status)
        {
             // funcion para poner iconos en los status de las ventas
            if (status == null)
                return "~/Images/default.png";

            string statusValue = status.ToString().ToLower();

            switch (statusValue)
            {
                case "completed":
                    return "~/Images/check.png"; // url de completado
                case "cancelled":
                    return "~/Images/x.png"; //cancelado
                case "in process":
                    return "~/Images/circle.png"; // En proceso
                default:
                    return "~/Images/default.png"; // img por defecto
            }
          
        }
        protected void btnAddArticle_Click(object sender, EventArgs e)
        {
            //BOTON PARA AGREGAR ARTICULOS
            MostarElentoSelecionado("div_gral_frmArt");

            IsEditMode = false;
            titulo_add_frm_art.Visible = true;
            titulo_mod_frm_art.Visible = false;
            txtCodeArticle.Enabled = true;

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

            LimpiarFormulario();
        }
        protected void btnSaveArticle_Click(object sender, EventArgs e)
        {   //BOTON PARA GUARDAR/MODIFICAR ARTICULO
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
                if (txtDescripcion.Text.Length > 25)
                {
                    throw new Exception("La descripcion del articulo no puede exceder los 25 caracteres.");
                }
                if (txtDetalle.Text.Length > 250)
                {
                    throw new Exception("El detalle del articulo no puede exceder los 250 caracteres.");
                }

                // ASIGNAMOS VALORES CAPTURADOS AL ARTICULO

                articulo.Codigo = txtCodeArticle.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Detalle = txtDetalle.Text;
                articulo.Marca = new Marca();
                articulo.Tipo = new Tipo();
                articulo.Categoria = new Categoria();

                articulo.Marca.Id = int.Parse(ddListBrand.SelectedValue);
                articulo.Tipo.Id = int.Parse(ddListType.SelectedValue);
                articulo.Categoria.Id = int.Parse(ddListCategory.SelectedValue);

                // Creamos lista de imagenes para guardarlos
                articulo.Imagen = new List<Imagen>();
                string imagen1 = txtImagen1.Text.Trim(); // funcion trim elimina espacios en blanco
                string imagen2 = txtImagen2.Text.Trim();
                string imagen3 = txtImagen3.Text.Trim();

                // agregamos las imagenes solo si  las url no estan vacias
                if (!string.IsNullOrEmpty(imagen1))
                {
                    articulo.Imagen.Add(new Imagen { UrlImagen = imagen1 });
                }
                if (!string.IsNullOrEmpty(imagen2))
                {
                    articulo.Imagen.Add(new Imagen { UrlImagen = imagen2 });
                }
                if (!string.IsNullOrEmpty(imagen3))
                {
                    articulo.Imagen.Add(new Imagen { UrlImagen = imagen3 });
                }
                // depende el modo es como va a guardar
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
                labelMsj.Visible = false;
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex); //DESPUES LO MANDAMOS A UNA PAGINA DE ERROR
                throw;
            }

        }

        // Ver articulos
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
        protected void btnViewArticles_Click(object sender, EventArgs e) 
        {   // BOTON VER ARTICULOS EN GRILLA
            MostarElentoSelecionado("div_gral_dgvArt");
            LoadArticle(); // Cargar y mostrar artículos en el GridView
        }
        protected void dgvArticles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticles.PageIndex = e.NewPageIndex;
            LoadArticle(); // Vuelve a cargar los datos para actualizar la vista
        }
        protected void dgvArticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //MODO MODIFICAR
            ArticuloAS data = new ArticuloAS();
            if (e.CommandName == "Modificar")
            {
                IsEditMode = true;
                if (IsEditMode)
                {
                    txtCodeArticle.Enabled = false; // El codigo NUNCA puede modificarse
                }

                int idArticulo = Convert.ToInt32(e.CommandArgument);
                List<Articulo> listaArticulos = data.ObtenerIdXModificacion(idArticulo.ToString());

                // Verificar si la lista tiene elementos
                if (listaArticulos.Count > 0)
                {
                    // Asignar el primer artículo de la lista al objeto articulo
                    Articulo articulo = listaArticulos[0];

                    //pre cargarmos los datos en el formulario

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
                    
                    if (articulo.Imagen != null)
                    {
                        // Verifico si hay al menos una imagen y que no sea nula
                        if (articulo.Imagen.Count > 0 && articulo.Imagen[0] != null)
                        {
                            txtImagen1.Text = articulo.Imagen[0].UrlImagen;
                            IdImagen1.ImageUrl = articulo.Imagen[0].UrlImagen;
                        }
                        else
                        {
                            // Limpia el campo si no hay imagen
                            txtImagen1.Text = string.Empty;
                            IdImagen1.ImageUrl = null;
                        }

                     
                        if (articulo.Imagen.Count > 1 && articulo.Imagen[1] != null)
                        {
                            txtImagen2.Text = articulo.Imagen[1].UrlImagen;
                            IdImagen2.ImageUrl = articulo.Imagen[1].UrlImagen;
                        }
                        else
                        {
                            // Limpiar el campo si no hay imagen
                            txtImagen2.Text = string.Empty; 
                            IdImagen2.ImageUrl = null;
                        }

                       
                        if (articulo.Imagen.Count > 2 && articulo.Imagen[2] != null)
                        {
                            txtImagen3.Text = articulo.Imagen[2].UrlImagen;
                            IdImagen3.ImageUrl = articulo.Imagen[2].UrlImagen;
                        }
                        else
                        {
                           
                            txtImagen3.Text = string.Empty;
                            IdImagen3.ImageUrl = null;
                        }
                    }


                    // Mostramos el formulario para editar
                    MostarElentoSelecionado("div_gral_frmArt");
                    titulo_add_frm_art.Visible = false;
                    titulo_mod_frm_art.Visible = true;
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
            else if (e.CommandName == "Actualizar")
            {
                int IdArticulo = Convert.ToInt32(e.CommandArgument);
                LoadSyP(IdArticulo);
            }
        }
        protected void dgvArticles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {   // MODO MODIFICAR EN LA GRILLA
            int IdArticulo = Convert.ToInt32(e.Keys["Id"]);
            ArticuloAS data = new ArticuloAS();
            data.DeleteArticulo(IdArticulo);
            LoadArticle();
        }

        // Agregar - Modificar Tipificaciones
        private void LimpiarFormulario_Tipificacion()
        {
            ddlTipoTipific.SelectedIndex = 0;
            txtCodTipific.Text = string.Empty;
            txtDescTipific.Text = string.Empty;
            
        }
        protected void btnAddTipific_Click(object sender, EventArgs e)
        {
            //BOTON PARA AGREGAR TIPIFICACION.

            MostarElentoSelecionado("div_gral_frmTip");

            TipificacionAS TipAS = new TipificacionAS();
            ddlTipoTipific.DataSource = TipAS.ObtenerTodas();
            ddlTipoTipific.DataValueField = "Codigo";
            ddlTipoTipific.DataTextField = "Descripcion";
            ddlTipoTipific.DataBind();
        }
        protected void btnAceptarTipific_Click(object sender, EventArgs e)
        {
            TipificacionAS data = new TipificacionAS();

            // valida si los campos estan vacios

            int IdTipificacion = int.Parse(ddlTipoTipific.SelectedValue);

            if (string.IsNullOrWhiteSpace(txtCodTipific.Text))
            {
                throw new Exception("El código del tipificacion es obligatorio.");
            }

            if (!IsEditMode)
            {
                if (data.ValidarCodigoActivo_Tipificacion(IdTipificacion, txtCodTipific.Text) == 1)
                {
                    throw new Exception("El código de la tpificacion esta en uso.");
                }
            }

            if (string.IsNullOrWhiteSpace(txtDescTipific.Text))
            {
                throw new Exception("La descripción de la tipificacion es obligatoria.");
            }

            // validacion tamaño del texto
            if (txtCodTipific.Text.Length > 10)
            {
                Console.WriteLine("El código de la tipificacion no puede exceder los 10 caracteres.");
                throw new Exception("El código de la tipificacion no puede exceder los 10 caracteres.");
            }
            if (txtDescTipific.Text.Length > 250)
            {
                throw new Exception("La descripcion de la tipificacion no puede exceder los 250 caracteres.");
            }

            if (IsEditMode)
            {
                data.ModificarTipificacion(IdTipificacion, txtCodTipific.Text, txtDescTipific.Text);
            }
            else
            {
                data.AgregarTipificacion(IdTipificacion, txtCodTipific.Text, txtDescTipific.Text);
            }

            labelMsj.Text = "¡Se ha agregado exitosamente!";
            labelMsj.Visible = true;
            LimpiarFormulario_Tipificacion();
        }
        
        // Ver Tipificaciones
        private void LoadTipific(int Tipific)
        {
            // Carga el GridView con las Tipificacion selecionada.
            switch (Tipific)
            {
                case 1:
                    MarcaAS marca = new MarcaAS();
                    dgvTipific.DataSource = marca.listar();

                    dgvTipific.DataBind();
                    dgvTipific.Visible = true;
                    dgvTipific.Columns[0].Visible = false;
                    dgvTipific.Columns[3].Visible = false;

                    TipificSelected = Tipific;
                    break;
                case 2:
                    TipoAS tipo = new TipoAS();
                    dgvTipific.DataSource = tipo.listar();

                    dgvTipific.DataBind();
                    dgvTipific.Visible = true;
                    dgvTipific.Columns[0].Visible = false;
                    dgvTipific.Columns[3].Visible = false;

                    TipificSelected = Tipific;
                    break;
                case 3:
                    CategoriaAS cate = new CategoriaAS();
                    dgvTipific.DataSource = cate.listar();

                    dgvTipific.DataBind();
                    dgvTipific.Visible = true;
                    dgvTipific.Columns[0].Visible = false;
                    dgvTipific.Columns[3].Visible = false;

                    TipificSelected = Tipific;
                    break;
                case 4:
                    ColorAS color = new ColorAS();
                    dgvTipific.DataSource = color.listar();

                    dgvTipific.DataBind();
                    dgvTipific.Visible = true;
                    dgvTipific.Columns[0].Visible = false;
                    dgvTipific.Columns[3].Visible = false;

                    TipificSelected = Tipific;
                    break;
                case 5:
                    TallesAS talle = new TallesAS();
                    dgvTipific.DataSource = talle.listar();

                    dgvTipific.DataBind();
                    dgvTipific.Visible = true;
                    dgvTipific.Columns[0].Visible = false;
                    dgvTipific.Columns[3].Visible = false;

                    TipificSelected = Tipific;
                    break;
                default:
                    break;
            }
        }
        protected void btnViewTipific_Click(object sender, EventArgs e)
        {
            dgvTipific.Visible=false;
            MostarElentoSelecionado("div_gral_dgvTip");
        }
        protected void btnTipificMarca_Click(object sender, EventArgs e)
        {
            LoadTipific(1);
        }
        protected void btnTipificTipo_Click(object sender, EventArgs e)
        {
            LoadTipific(2);
        }
        protected void btnTipificCategoria_Click(object sender, EventArgs e)
        {
            LoadTipific(3);
        }
        protected void btnTipificColor_Click(object sender, EventArgs e)
        {
            LoadTipific(4);
        }
        protected void btnTipificTalle_Click(object sender, EventArgs e)
        {
            LoadTipific(5);
        }
        protected void CargarTipificacionParaModificar(int Id)
        {
            SqlDataReader result;
            DataAccess data = new DataAccess();
            DataManipulator query = new DataManipulator();

            query.configSqlProcedure("Catalogo.SP_BuscarTipificacionPorId");
            query.configSqlParams("@Tipificacion", TipificSelected);
            query.configSqlParams("@Id", Id);
            query.configSqlConexion(data.getConnection());
            data.openConnection();
            result = query.exectQuerry();

            try
            {

                result.Read();

                MostarElentoSelecionado("div_gral_frmTip");

                TipificacionAS TipAS = new TipificacionAS();

                ddlTipoTipific.DataSource = TipAS.ObtenerPorId(TipificSelected);
                ddlTipoTipific.DataValueField = "Codigo";
                ddlTipoTipific.DataTextField = "Descripcion";
                ddlTipoTipific.DataBind();

                ddlTipoTipific.Enabled = false;
                txtCodTipific.Enabled = false;
                txtCodTipific.Text = (string)result["Codigo"];
                txtDescTipific.Text = (string)result["Descripcion"];
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                data.closeConnection();
            }
        }
        protected void dgvTipific_RowCommand(object sender, GridViewCommandEventArgs e)
        {   // COMANDO PARA MODIFICAR TIPIFICACIONES EN GRILLA 
            if (e.CommandName == "Modificar") {

                IsEditMode = true;
                titulo_add_frm_tip.Visible = false;
                titulo_mod_frm_tip.Visible = true;

                switch (TipificSelected)
                {
                    case 1:
                        CargarTipificacionParaModificar(Convert.ToInt32(e.CommandArgument));
                        break;
                    case 2:
                        CargarTipificacionParaModificar(Convert.ToInt32(e.CommandArgument));
                        break;
                    case 3:
                        CargarTipificacionParaModificar(Convert.ToInt32(e.CommandArgument));
                        break;
                    case 4:
                        CargarTipificacionParaModificar(Convert.ToInt32(e.CommandArgument));
                        break;
                    case 5:
                        CargarTipificacionParaModificar(Convert.ToInt32(e.CommandArgument));
                        break;
                    default:
                        break;
                }
            }
        }
        protected void dgvTipific_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // COMANDO DE LA GRILLA PARA BORRAR TIPIFICACIONES
            int Id = Convert.ToInt32(e.Keys["Id"]);
            try
            {
                TipificacionAS tipif = new TipificacionAS();
                int registros = tipif.ValidarIntegridad(TipificSelected, Id);

                if (registros == 0)
                {
                    switch (TipificSelected)
                    {
                        case 1:
                            MarcaAS marca = new MarcaAS();
                            marca.EliminarMarca(Id);
                            LoadTipific(TipificSelected);

                            break;
                        case 2:
                            TipoAS tipo = new TipoAS();
                            tipo.EliminarTipo(Id);
                            LoadTipific(TipificSelected);
                            break;
                        case 3:
                            CategoriaAS cate = new CategoriaAS();
                            cate.EliminarCate(Id);
                            LoadTipific(TipificSelected);
                            break;
                        case 4:
                            ColorAS color = new ColorAS();
                            color.EliminarColor(Id);
                            LoadTipific(TipificSelected);
                            break;
                        case 5:
                            TallesAS talle = new TallesAS();
                            talle.EliminarTalle(Id);
                            LoadTipific(TipificSelected);
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    labelMsj.Text = "¡No se puede eliminar la tipificacion. Tiene Productos asociados!";
                    labelMsj.Visible = true;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        
        // Stock y Precio
        private string DescripcionArtddl(int idArt)
        {
            ArticuloAS articuloAS = new ArticuloAS();
            Articulo art = articuloAS.ArticuloPorId(idArt);
            
            return art.Descripcion.ToString();
        }
        private void LoadSyP(int idArticulo = -1, string colorSelec = "-1", string talleSelec = "-1")
        {
            MostarElentoSelecionado("div_gral_dgvSyp");

            if (colorSelec == "-1")
            {
                ColorAS color = new ColorAS();
                ddlColor.DataSource = color.listar();
                ddlColor.DataValueField = "Id";
                ddlColor.DataTextField = "Descripcion";
                ddlColor.DataBind();
            }
            else
            {
                ddlColor.SelectedValue = colorSelec;
            }

            if (colorSelec == "-1")
            {
                TallesAS talle = new TallesAS();
                ddlTalle.DataSource = talle.listar();
                ddlTalle.DataValueField = "Id";
                ddlTalle.DataTextField = "Descripcion";
                ddlTalle.DataBind();
            }
            else
            {
                ddlTalle.SelectedValue = talleSelec;
            }

            ArticuloAS articulo = new ArticuloAS();

            if (idArticulo == -1)
            {
                lblNombreArt.Visible = false;
                txtStock.Enabled = false;
                btnAceptarPrecio.Enabled = false;
                txtPrecio.Enabled = false;
                btnAceptarStock.Enabled = false;
                dgvSyP.DataSource = articulo.listarConSyP();
            }
            else
            {
                ArticuloAS art = new ArticuloAS();
                ddlArticulo.DataSource = art.listar();
                ddlArticulo.DataValueField = "Id";
                ddlArticulo.DataTextField = "Codigo";
                ddlArticulo.DataBind();

                // Agrega la opción "Todos"
                ddlArticulo.Items.Insert(0, new ListItem("Todos", "0"));

                ddlArticulo.SelectedValue = idArticulo.ToString();

                lblNombreArt.Visible = true;
                txtStock.Enabled = true;
                btnAceptarPrecio.Enabled = true;
                txtPrecio.Enabled = true;
                btnAceptarStock.Enabled = true;
                dgvSyP.DataSource = articulo.listarConSyP().Where(a => a.Id == idArticulo);
            }
            
            dgvSyP.DataBind();
            dgvSyP.Visible = true;
            dgvSyP.Columns[0].Visible = false;
            dgvSyP.Columns[1].Visible = false;
            dgvSyP.Columns[6].Visible = false;
        }
        protected void btnAddSyP_Click(object sender, EventArgs e)
        {
            ArticuloAS art = new ArticuloAS();
            ddlArticulo.DataSource = art.listar();
            ddlArticulo.DataValueField = "Id";
            ddlArticulo.DataTextField = "Codigo";
            ddlArticulo.DataBind();

            // Agrega la opción "Todos"
            ddlArticulo.Items.Insert(0, new ListItem("Todos", "0"));

            LoadSyP();
        }
        protected void btnAceptarStock_Click(object sender, EventArgs e)
        {
            int idArt = Convert.ToInt32(ddlArticulo.SelectedValue);
            int idColor = Convert.ToInt32(ddlColor.SelectedValue);
            int idTalle = Convert.ToInt32(ddlTalle.SelectedValue);
            int cantidad = Convert.ToInt32(txtStock.Text);

            ArticuloAS artAS = new ArticuloAS();
            
            artAS.ActuaclizarStock(idArt, idColor, idTalle, cantidad);
            LoadSyP(Convert.ToInt32(ddlArticulo.SelectedValue), ddlColor.SelectedValue, ddlTalle.SelectedValue);
            
        }
        protected void btnAceptarPrecio_Click(object sender, EventArgs e)
        {
            int idArt = Convert.ToInt32(ddlArticulo.SelectedValue);
            int idColor = Convert.ToInt32(ddlColor.SelectedValue);
            int idTalle = Convert.ToInt32(ddlTalle.SelectedValue);
            float precio = Convert.ToSingle(txtPrecio.Text);

            ArticuloAS artAS = new ArticuloAS();

            artAS.ActuaclizarPrecio(idArt, idColor, idTalle, precio);
            LoadSyP(Convert.ToInt32(ddlArticulo.SelectedValue), ddlColor.SelectedValue, ddlTalle.SelectedValue);
        }
        protected void ddlArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArticulo.SelectedIndex > 0)
            {
                int idSeleccionado = Convert.ToInt32(ddlArticulo.SelectedValue);
                lblNombreArt.Text = DescripcionArtddl(idSeleccionado);

                txtStock.Text = "";
                txtPrecio.Text = "";
                LoadSyP(idSeleccionado);
            }
            else
            {
                LoadSyP();
            }
        }
        protected void dgvSyP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Obtén el Id del artículo desde la fila seleccionada
            int id = Convert.ToInt32(e.Keys["IdRegSyP"]);
            ArticuloAS artAS = new ArticuloAS();
            artAS.EliminarSyP(id);

            if (ddlArticulo.SelectedIndex >= 0)
            {
                int idSeleccionado = Convert.ToInt32(ddlArticulo.SelectedValue);
                lblNombreArt.Text = DescripcionArtddl(idSeleccionado);

                LoadSyP(idSeleccionado);
            }

        }
        
        /* SECCION DE ORDENES-VENTAS */
        protected void btnViewSell_Click(object sender, EventArgs e)
        {
            MostarElentoSelecionado("div_gral_dgvOrden");
            loadOrders();

        }
        protected void dgvOrden_RowCommand(object sender, GridViewCommandEventArgs e)
        {   
            OrdenAS data = new OrdenAS();
            if (e.CommandName == "Pagado")
            {
                int IdOrden = Convert.ToInt32(e.CommandArgument);
                data.marcarPagado(IdOrden);
                loadOrders();
            }
            else if (e.CommandName == "Entregado")
            {
                int IdOrden = Convert.ToInt32(e.CommandArgument);
                data.marcarEntregado(IdOrden);
                loadOrders();
            }
            else if (e.CommandName == "Factura")
            {
                int IdOrden = Convert.ToInt32(e.CommandArgument);
                div_input_fnumcomp.Visible = true;

                Session.Add("IdOrdenFnumcomp", IdOrden);

                lblComp.Text = "Ingrese el Numero de comprobante para la orden " + IdOrden + ":";  
            }
            else if (e.CommandName == "Detalle")
            {
                int IdOrden = Convert.ToInt32(e.CommandArgument);
                MostarElentoSelecionado("div_gral_dgvDetalleOrden");
                loadDetOrders(IdOrden);
            }

        }
        protected void btnfnumcomp_aceptar_Click(object sender, EventArgs e)
        {
            OrdenAS data = new OrdenAS();
            string fnumcomp = txbCompLetra.Text + " " + txbCompPtoVta.Text + "-" + txbCompNumero.Text;
            int idOrden = (int)Session["IdOrdenFnumcomp"];
            data.cargarCompFiscal(idOrden, fnumcomp);
            loadOrders();
        }
        protected void btnfnumcomp_cancelar_Click(object sender, EventArgs e)
        {
            div_input_fnumcomp.Visible = false;
            loadOrders();
        }
        protected void dgvOrden_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            OrdenAS data = new OrdenAS();
            int IdOrden = Convert.ToInt32(e.Keys["Id"]);
            data.DeleteOrden(IdOrden);
            loadOrders();
        }
        protected void loadDetOrders(int idOrden)
        {
            DetalleOrdenAS data = new DetalleOrdenAS();
            dgvDetOrden.DataSource = data.listarDetalleFiltrado(idOrden);
            dgvDetOrden.DataBind();
            dgvDetOrden.Visible = true;
        }
        protected void loadOrders()
        {
            // Carga el GridView con las ordenes
            OrdenAS orden = new OrdenAS();
            dgvOrden.DataSource = orden.listar();
            dgvOrden.DataBind();
            dgvOrden.Visible = true;
            
        }
        
        /* SECCION DE REPORTES*/
        protected void btnReportStockPorArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfreport_stockporarticulo.aspx");
        }
        protected void btnReportStockYPrecio_Click(object sender, EventArgs e)
        {
            Response.Redirect("wfreport_stockyprecios.aspx");
        }
        protected void txtImagen1_TextChanged(object sender, EventArgs e)
        {
            IdImagen1.ImageUrl = txtImagen1.Text;
        }
        protected void txtImagen2_TextChanged(object sender, EventArgs e)
        {
            IdImagen2.ImageUrl = txtImagen2.Text;
        }
        protected void txtImagen3_TextChanged(object sender, EventArgs e)
        {
            IdImagen3.ImageUrl = txtImagen3.Text;

        }
        protected void btnEliminarUrl1_Click(object sender, EventArgs e)
        {
            txtImagen1.Text = string.Empty;
            IdImagen1.ImageUrl = string.Empty;
        }
        protected void btnEliminarUrl2_Click(object sender, EventArgs e)
        {
            txtImagen2.Text = string.Empty;
            IdImagen2.ImageUrl = string.Empty;
        }
        protected void btnEliminarUrl3_Click(object sender, EventArgs e)
        {
            txtImagen3.Text = string.Empty;
            IdImagen3.ImageUrl = string.Empty;
        }
        protected void btnSaveStatus_Click(object sender, EventArgs e)
        {
            // opcional si vamos a utilizar boton para actualizar estado
        }
    }
}