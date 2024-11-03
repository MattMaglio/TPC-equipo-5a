using ApplicationService;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp.report
{
    public partial class repstock : System.Web.UI.Page
    {   
        ArticuloAS artAS = new ArticuloAS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            // LoadReport(); // Con la funcion "LoadReport()"
            //ShowReport();
        }

        // Con la funcion "LoadReport()" ↓
        /*
        private void LoadReport()
        {
                // Esta opcion permite manipular datos adicionales que son
                // obtenidos por fuera de la consulta sql

                var data = artAS.listar().ToList();
                var dataRpt = ( from item in data
                                select new
                                {
                                    item.Codigo,
                                    item.Descripcion,
                                    item.Detalle
                                }).ToList();

                if (!dataRpt.Any())
                {
                    // Control de error.
                    return;
                }
                ShowReport("~/report/report_test.rdlc", dataRpt);
        }
            */
            /*
            // SIN la funcion "LoadReport()" ↓
            private void ShowReport()
            {
                var listadoArticulos = artAS.listarStockYPrecio();
                var urlReport = "~/report/report_stockyprecio.rdlc";

                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath(urlReport);

                var ds = new ReportDataSource("Data", listadoArticulos);

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(ds);

            }
            */
            // Con la funcion "LoadReport()" ↓
            /*
            private void ShowReport(string urlRpt, object datos)
            {


                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath(urlRpt);

                ReportDataSource datasource0 = new ReportDataSource("Data", datos);

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource0);
            }
            */
        }
}