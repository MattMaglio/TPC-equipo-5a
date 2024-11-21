using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.Json;
using Model;
using ApplicationService;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using System.Runtime.InteropServices;

namespace webApp
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null) //si no hay usuario cargado en sesión debe loguearse para seguir
                {
                    Session.Add("error", "Ingresá a tu cuenta para continuar");
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    cargarDatosUser();
                }
            }

        }
        protected void cargarDatosUser()
        {
            UsuarioAS userAS = new UsuarioAS();
            Usuario user = new Usuario();

            var usuario = (Model.Usuario)Session["usuario"];
          
            user = userAS.ObtenerDatos(usuario);

            txtUsuario.Text = usuario.User;
            txtUsuario.Enabled = false;

            txtEmail.Text = user.email;
            txtNombre.Text = user.nombre;
            txtApellido.Text = user.apellido;
            txtDni.Text = user.dni;

        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btn_actDatos_Click(object sender, EventArgs e)
        {
            var usuario = (Model.Usuario)Session["usuario"];

            UsuarioAS userAS = new UsuarioAS();
            Usuario user = new Usuario();

            user.User = usuario.User.ToString();
            user.email = txtEmail.Text;
            user.nombre = txtNombre.Text;
            user.apellido = txtApellido.Text;
            user.dni = txtDni.Text;

            userAS.actualizarUsuario(user);
            cargarDatosUser();
        }
        protected void loadDetOrders(int idOrden)
        {
            DetalleOrdenAS data = new DetalleOrdenAS();
            dgvDetOrden.DataSource = data.listarDetalleFiltrado(idOrden);
            dgvDetOrden.DataBind();

            dgvDetOrden.Columns[0].Visible = false;
            
        }
        protected void loadOrders()
        {
            // Carga el GridView con las ordenes
            OrdenAS orden = new OrdenAS();

            var usuario = (Model.Usuario)Session["usuario"];

            dgvOrden.DataSource = orden.listarMisCompras(usuario.User.ToString());
            dgvOrden.DataBind();

        }
        protected void dgvOrden_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            OrdenAS data = new OrdenAS();
            if (e.CommandName == "Detalle")
            {
                int IdOrden = Convert.ToInt32(e.CommandArgument);

                tb_datos.Visible = false;
                tb_compras.Visible = true;

                div_compras.Visible = false;
                div_detalle_compras.Visible = true;

                loadDetOrders(IdOrden);
            }
        }
        protected void btnVerOrdenes_Click(object sender, EventArgs e)
        {
            tb_datos.Visible = false; 
            
            tb_compras.Visible = true;
            div_compras.Visible = true;

            div_detalle_compras.Visible = false;

            loadOrders();
        }
        protected void btnMisCompras_Click(object sender, EventArgs e)
        {
            tb_datos.Visible = false;
            
            tb_compras.Visible = true;
            div_compras.Visible = true;

            div_detalle_compras.Visible = false;

            loadOrders();
        }
        protected void btnDatos_Click(object sender, EventArgs e)
        {
            tb_datos.Visible = true;
            tb_compras.Visible = false;
            cargarDatosUser();

        }
    }
}