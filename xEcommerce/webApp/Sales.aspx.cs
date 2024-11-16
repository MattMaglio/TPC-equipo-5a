using ApplicationService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string ObtenerMetodoPago()
        {
            if (radiobtnEfectivo.Checked)
                return "Efectivo";
            if (radiobtnTransferencia.Checked)
                return "Transferencia";
            if (radiobtnLinkPago.Checked)
                return "Link de Pago";

            return "No seleccionado";
        }
        private string ObtenerMetodoEnvio()
        {
            if (radiobtnCorreo.Checked)
                return "Correo argentino";
            if (radiobtnRetiroSucursal.Checked)
                return "Retiro sucursal";

            return "No seleccionado";
        }

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
           /* try
            {
                //falta obtner la lista de articulos seleccionado
                // datos del cliente
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                string direccion = txtDireccion.Text;
                int telefono = int.Parse(txtNroTelefono.Text);
                int codigoPostal = int.Parse(txtCcp.Text);

               
                string metodoPago = ObtenerMetodoPago();
                string metodoEnvio = ObtenerMetodoPago();

                // Capturar el resumen de gastos
                float subtotal = float.Parse(txtSubtotal.Text);
                float impuestos = float.Parse(txtIva.Text);
                float descuentos = float.Parse(txtDescuntos.Text);
                float total = float.Parse(txtTotal.Text);

                // cuerpo para correo
                string body = $@"
                <h2>Confirmación de compra</h2>
                <p><strong>Cliente:</strong> {nombre} {apellido}</p>
                <p><strong>Dirección:</strong> {direccion}, CP {codigoPostal}</p>
                <p><strong>Teléfono:</strong> {telefono}</p>
                <p><strong>Método de Pago:</strong> {metodoPago}</p>
                <p><strong>Método de Envío:</strong> {metodoEnvio}</p>
                <h3>Resumen de Compra</h3>
                <p><strong>Subtotal:</strong> {subtotal}</p>
                <p><strong>IVA:</strong> {impuestos}</p>
                <p><strong>Descuento:</strong> {descuentos}</p>
                <p><strong>Total:</strong> {total}</p>
                ";

                // Enviar correo
                EmailAS emailData = new EmailAS();
               // emailData.ArmarCorreo(); falta armar correo para confirmacion de pedido
                emailData.EnviarEmail();

                // Mostrar mensaje de éxito
                Response.Write("<script>alert('Orden confirmada y correo enviado.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error al confirmar la orden: {ex.Message}');</script>");
            }*/
        }
    }
}