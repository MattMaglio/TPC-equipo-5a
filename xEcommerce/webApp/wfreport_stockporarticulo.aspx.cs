using ApplicationService;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class wfreport_stockporarticulo : System.Web.UI.Page
    {
        ArticuloAS artAS = new ArticuloAS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            ShowReport();
        }

        private void ShowReport()
        {
            // Obtener el DataTable desde el método
            var dataTable = artAS.listarStockPorArticulo();
            var urlReport = "~/report/report_stockporarticulo.rdlc";

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath(urlReport);

            // Crear el ReportDataSource usando el DataTable
            var ds = new ReportDataSource("Data", dataTable);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(ds);
            ReportViewer1.LocalReport.Refresh();

        }
    }
}