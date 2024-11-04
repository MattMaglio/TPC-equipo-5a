using ApplicationService;
using DataPersistence;
using Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class ShopFullGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriaAS CatAS = new CategoriaAS();
                List<Categoria> listCategorias = CatAS.listar();

                ddlCategoria.DataSource = listCategorias;
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataBind();

                MarcaAS MarcAS = new MarcaAS();
                List<Marca> listMarcas = MarcAS.listar();

                ddlMarca.DataSource = listMarcas;
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataBind();

                TipoAS TipAS = new TipoAS();
                List<Tipo> listTipos = TipAS.listar();

                ddlTipo.DataSource = listTipos;
                ddlTipo.DataValueField = "Id";
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataBind();

                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            DataAccess dataAccess = new DataAccess();
            DataManipulator dataManipulator = new DataManipulator();

            try
            {
                // Abrir la conexión a la base de datos
                dataAccess.openConnection();

                // Configurar el procedimiento almacenado
                dataManipulator.configSqlProcedure("Catalogo.ListarArticulosConImagen");

                // Configurar la conexión del manipulador de datos
                dataManipulator.configSqlConexion(dataAccess.getConnection());

                // Ejecutar la consulta y obtener el SqlDataReader
                SqlDataReader reader = dataManipulator.exectQuerry();

                lvProducts.DataSource = reader;
                lvProducts.DataBind();
            }
            catch (Exception ex)
            {
                // Manejar el error
                throw ex; // Considera manejarlo de una manera más amigable
            }
            finally
            {
                // Cerrar la conexión
                dataAccess.closeConnection();
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

                lvProducts.DataSource = reader;
                lvProducts.DataBind();

                //rptFeaturedProducts.DataSource = reader;
                //rptFeaturedProducts.DataBind();
            }
            catch (Exception ex)
            {
                // Manejar el error
            }
            finally
            {
                dataAccess.closeConnection();
            }
        }


        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarProductos();
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarProductos();
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarProductos();
        }

        private void FiltrarProductos()
        {
            DataAccess dataAccess = new DataAccess();
            DataManipulator dataManipulator = new DataManipulator();

            try
            {
                dataAccess.openConnection();

                // Configurar el procedimiento almacenado
                dataManipulator.configSqlProcedure("Catalogo.ListarArticulosConImagen");

                // Configurar la conexión del manipulador de datos
                dataManipulator.configSqlConexion(dataAccess.getConnection());

                // Agregar parámetros
                dataManipulator.configSqlParams("@IdCategoria", ddlCategoria.SelectedValue != "" ? (object)Convert.ToInt32(ddlCategoria.SelectedValue) : DBNull.Value);
                dataManipulator. configSqlParams("@IdMarca", ddlMarca.SelectedValue != "" ? (object)Convert.ToInt32(ddlMarca.SelectedValue) : DBNull.Value);
                dataManipulator.configSqlParams("@IdTipo", ddlTipo.SelectedValue != "" ? (object)Convert.ToInt32(ddlTipo.SelectedValue) : DBNull.Value);

                SqlDataReader reader = dataManipulator.exectQuerry();

                lvProducts.DataSource = reader;
                lvProducts.DataBind();
            }
            catch (Exception ex)
            {
                // Manejar el error
            }
            finally
            {
                dataAccess.closeConnection();
            }
        }


    }

}