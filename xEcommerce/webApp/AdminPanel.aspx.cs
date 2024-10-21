using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* ACA VAMOS A CARGAR EL DGV PARA MOSTRAR ARTICULOS, CLIENTES, USUARIOS ECT

             ArticuloAS articulo = new ArticuloAS();

            
            if (!IsPostBack)
            {
             dgvPanelAdmin.DataSource = articulo.listar(); // ARTICULO
             dgvPanelAdmin.DataBind();

            dgvPanelAdmin.DataSource = clients.listar(); // CLIENTES
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
            //METODO QUE VAMOS A UTILIZAR PARA LA CARGA DE LOS ARTICULOS
            /*ArticuloAS articulo = new ArticuloAS();
            dgvArticles.DataSource = articulo.listar();
            dgvArticles.DataBind();*/
        }
    }
}