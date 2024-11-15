using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.Expando;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class Sales : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializo las secciones y campos
                shippingData.Visible = false;
                confirmationSection.Visible = false;
                transferConfirmation.Visible = false;
                confirmationDetails.Visible = false;
                Div1.Visible = false;
                lblEntrega.Visible = false;
                lblTituloEnvio.Visible = false;
                lblCalle.Visible = false;
                lblNumero.Visible = false;
                lblCiudad.Visible   = false;
                lblProvincia.Visible = false;
                lblCP.Visible = false;

            }
        }

        // Evento para guardar datos del usuario en la base de datos
        protected void btnContinueToNextStep_Click(object sender, EventArgs e)
        {
            // Valores ingresados en los campos del formulario
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string dni = txtDNI.Text;

            // Guardar en la base de datos (implementar lógica en SaveShippingDataToDatabase)
            SaveShippingDataToDatabase(nombre, apellido, dni);
        }

        private void SaveShippingDataToDatabase(string nombre, string apellido, string dni)
        {
            // Implementar lógica para guardar los datos en la base de datos
            // Ejemplo de query: "INSERT INTO ShippingDetails (Nombre, Apellido, DNI) VALUES (@Nombre, @Apellido, @DNI)";
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /// BLOQUE DE OPCIONES DE ENTREGA
        protected void rblDeliveryOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblDeliveryOptions.SelectedValue == "Retiro")
            {
                //pickupMessage.Visible = true;
                shippingForm.Visible = false;
                radioEnvio.Attributes.CssStyle.Add("display", "none"); // oculto visualmente el radio botón "Envío"
                btnConfirmaRetiroLocal.Visible = true;
                bntCancelarRetiroLocal.Visible  =true;



            }
            else if (rblDeliveryOptions.SelectedValue == "Envio")
            {
                //pickupMessage.Visible = false;
                shippingForm.Visible = true;
                radioRetiro.Attributes.CssStyle.Add("display", "none"); // oculto visualmente el radio botón "Retiro"
                radioEnvio.Attributes.CssStyle.Add("display", "none"); // oculto visualmente el radio botón "Envío"
                btnConfirmoEnvio.Visible = true;
                btnCanceloEnvio.Visible = true;
            }
        }

        protected void btnConfirmaRetiroLocal_Click(object sender, EventArgs e)
        {
            paymentMethods.Visible = true;
            deliveryOptions.Visible = false;
            btnConfirmaRetiroLocal.Visible = false;
            bntCancelarRetiroLocal.Visible=false;
            lblEntrega.Visible = true;
        }

        protected void bntCancelarRetiroLocal_Click(object sender, EventArgs e)
        {
            // Ocultar las secciones de ingreso de datos y métodos de pago
            shippingData.Visible = false;
            paymentMethods.Visible = false;
            shippingForm.Visible = false;


            // Mostrar la sección de confirmación de compra
            confirmationSection.Visible = true;

            //Limpio la seleccion del radio y oculto el mensaje
            rblDeliveryOptions.ClearSelection();
            //pickupMessage.Visible=false;

            //oculto forma de entrega en resumen de compra
            lblEntrega.Visible = false;

            //Oculto botones de Confirmar / Cancelar Retiro vs envio
            btnConfirmaRetiroLocal.Visible = false;
            bntCancelarRetiroLocal.Visible = false;
            btnConfirmoEnvio.Visible = false;
            btnCanceloEnvio.Visible = false;


            //oculto el btnConfirmarCompra
            btnConfirmPayment.Visible = false;
           // btnContinuePayment.Visible = false;
        }

        protected void btnConfirmoEnvio_Click(object sender, EventArgs e)
        {
            string deliveryChoice = rblDeliveryOptions.SelectedValue;
            paymentMethods.Visible = true;
            deliveryOptions.Visible = false;
            shippingForm.Visible=false;
            btnConfirmoEnvio.Visible = false;
            btnCanceloEnvio.Visible = false;

            //completo envio en resumen de compra
            lblCalle.Text = "Calle: " + txtCalle.Text;
            lblNumero.Text ="Número: " +  txtNumero.Text;
            lblCiudad.Text ="Ciudad: " +  txtCiudad.Text;
            lblProvincia.Text ="Provincia: " +  txtProvincia.Text;
            lblCP.Text ="Código Postal: " +  txtCP.Text;

            //muestro datos de envio en resumen de compra
            lblTituloEnvio.Visible = true;
            lblCalle.Visible = true;
            lblNumero.Visible = true;
            lblCiudad.Visible = true;
            lblProvincia.Visible = true;
            lblCP.Visible = true;

           



            if (deliveryChoice == "Envio")
            {
                string shippingAddress = $"Calle: {txtCalle.Text}, Número: {txtNumero.Text}, Ciudad: {txtCiudad.Text}, Provincia: {txtProvincia.Text}, Código Postal: {txtCP.Text}";
                // Guardar datos de dirección de envío en base de datos
                SaveShippingDataToDatabase(txtCalle.Text, txtNumero.Text, txtCiudad.Text); // ajustar la lógica según sea necesario
            }

            lblAmountToPay.Text = $"Monto total: $99 (Incluye {deliveryChoice})"; // Ajustar monto según lógica
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////
        
        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            // Mostrar resumen del cliente
            lblNombre.Text = txtNombre.Text;
            lblApellido.Text = txtApellido.Text;
            lblDNI.Text = txtDNI.Text;

            confirmationDetails.Visible = true;
            Div1.Visible = true;

            //oculto los articulos
            articulosAgregados1.Visible = false;
            articulosAgregados2.Visible = false;
            articulosAgregados3.Visible = false;

            // Ocultar las secciones de ingreso de datos y métodos de pago
            shippingData.Visible = false;
            paymentMethods.Visible = false;


            // Mostrar la sección de confirmación de compra
            confirmationSection.Visible = true;

            //Oculto botones de Confirmar / Cancelar Retiro vs envio
            btnConfirmaRetiroLocal.Visible = false;
            bntCancelarRetiroLocal.Visible = false;
            btnConfirmoEnvio.Visible = false;
            btnCanceloEnvio.Visible =  false;

            


            //oculto el btnConfirmarCompra
            btnConfirmPayment.Visible = false;
            //btnContinuePayment.Visible = false;
            

            // Ajustar el monto total de compra
            decimal monto = 150.00m;
            lblAmountToPay.Text = "$" + monto.ToString("F2");
        }

        protected void rblPaymentMethods_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedPaymentMethod = rblPaymentMethods.SelectedValue;

            if (selectedPaymentMethod == "Efectivo")
            {
                btnConfirmaEfectivo.Visible = true;
                btnCancelaEfectivo.Visible = true;

                btnConfirmaTransferencia.Visible = false;
                btnCancelaTransferencia.Visible = false;
                btnConfirmaMP.Visible = false;
                btnCancelarMP.Visible = false;
                // transferConfirmation.Visible = false;
            }
            else if (selectedPaymentMethod == "Transferencia")
            {
                btnConfirmaTransferencia.Visible = true;
                btnCancelaTransferencia.Visible = true;

                btnConfirmaEfectivo.Visible = false;
                btnCancelaEfectivo.Visible = false;
                btnConfirmaMP.Visible = false;
                btnCancelarMP.Visible = false;
                //transferConfirmation.Visible = false;
            }
            else if (selectedPaymentMethod == "MercadoPago")
            {
                btnConfirmaMP.Visible = true;
                btnCancelarMP.Visible = true;

                btnConfirmaEfectivo.Visible = false;
                btnCancelaEfectivo.Visible = false;
                btnConfirmaTransferencia.Visible = false;
                btnCancelaTransferencia.Visible = false;
                //transferConfirmation.Visible = true;
            }
        }

        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {
            string selectedPaymentMethod = rblPaymentMethods.SelectedValue;

            if (selectedPaymentMethod == "Efectivo")
            {
               

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Pago confirmado en efectivo. ¡Gracias por tu compra!');", true);
            }
            else if (selectedPaymentMethod == "Transferencia")
            {
                

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Te hemos enviado los datos bancarios por correo.');", true);
            }
            else if (selectedPaymentMethod == "MercadoPago")
            {
                
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Te hemos enviado los datos bancarios por correo.');", true);
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////////////////////
        // BLOQUE DE ARTÍCULOS
        protected void btnConfirmarArticulos_Click(object sender, EventArgs e)
        {
            shippingData.Visible = true;
            grupoBtnArticulos.Visible = false;

        }

        protected void btnCancelarArticulos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnConfirmaEfectivo_Click(object sender, EventArgs e)
        {
            //muestro forma de pago en resumen de compra
            lblFormaDePago.Text = "Forma de pago: Efectivo";
            lblFormaDePago.Visible = true;


            //Oculto el radio y los botones de Confirmar/cancelar pago 
            paymentMethods.Visible = false;
            btnConfirmaTransferencia.Visible = false;
            btnCancelaTransferencia.Visible = false;
            btnConfirmaMP.Visible = false;
            btnCancelarMP.Visible = false;
            btnConfirmaEfectivo.Visible = false;
            btnCancelaEfectivo.Visible = false;

            //muestro boton de finalizar compra
            btnTerminarCompra.Visible=true;

            //CONFIRMACIÓN O CANCELACIÓN FINAL
            confirmoFinal.Visible = true;
            btnTerminarCompra.Visible = true;
            btnCanceloCompra.Visible = true;

        }

       

        protected void btnConfirmaTransferencia_Click(object sender, EventArgs e)
        {
            //muestro forma de pago en resumen de compra
            lblFormaDePago.Text = "Forma de pago: Transferencia bancaria" ;
            lblFormaDePago.Visible = true;


            //Oculto el radio y los botones de Confirmar/cancelar pago 
            paymentMethods.Visible = false;
            btnConfirmaTransferencia.Visible = false;
            btnCancelaTransferencia.Visible = false;
            btnConfirmaMP.Visible = false;
            btnCancelarMP.Visible = false;
            btnConfirmaEfectivo.Visible = false;
            btnCancelaEfectivo.Visible = false;


            //muestro boton de finalizar compra
            btnTerminarCompra.Visible=true;

            //CONFIRMACIÓN O CANCELACIÓN FINAL
            confirmoFinal.Visible = true;
            btnTerminarCompra.Visible = true;
            btnCanceloCompra.Visible = true;
        }

        protected void btnConfirmaMP_Click(object sender, EventArgs e)
        {
            //muestro forma de pago en resumen de compra
            lblFormaDePago.Text = "Forma de pago: Mercado Pago";
            lblFormaDePago.Visible = true;


            //Oculto el radio y los botones de Confirmar/cancelar pago 
            paymentMethods.Visible = false;
            btnConfirmaTransferencia.Visible = false;
            btnCancelaTransferencia.Visible = false;
            btnConfirmaMP.Visible = false;
            btnCancelarMP.Visible = false;
            btnConfirmaEfectivo.Visible = false;
            btnCancelaEfectivo.Visible = false;


            //mensaje de envio de datos por mail
            //transferConfirmation.Visible = true;
           
            //muestro btn para FINALIZAR LA COMPRA
            btnTerminarCompra.Visible=true;

            //CONFIRMACIÓN O CANCELACIÓN FINAL
            confirmoFinal.Visible = true;
            btnTerminarCompra.Visible = true;
            btnCanceloCompra.Visible = true;

        }

        //BLOQUE PARA DAR OK A TODA LA COMPRA Y SALIR DEL CARRITO (VER LOGICA DE VACIARLO)
        protected void btnTerminarCompra_Click(object sender, EventArgs e)
        {
            //ACA VA LA LOGICA PARA GUARDAR LOS DATOS DEL RESUMEN DE COMPRA EN DB Y ARMAR FACTURA
            terminaLaCompra.Visible = true;
            volverHome.Visible = true;

            //oculto todo lo previo
            confirmoFinal.Visible = false;
            btnTerminarCompra.Visible = false;
            btnCanceloCompra.Visible = false;
        }

        protected void volverHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCancelaPago_Click(object sender, EventArgs e)
        {
            paymentMethods.Visible = true;

            btnConfirmaTransferencia.Visible = false;
            btnCancelaTransferencia.Visible = false;
            btnConfirmaMP.Visible = false;
            btnCancelarMP.Visible = false;
            btnConfirmaEfectivo.Visible = false;
            btnCancelaEfectivo.Visible = false;

            // Deseleccionar cualquier opción en el RadioButtonList
            rblPaymentMethods.SelectedIndex = -1;

        }

        protected void btnCanceloCompra_Click(object sender, EventArgs e)
        {
            // Mostrar el mensaje de cancelación
            lblCompraCancelada.Visible = true;

            // Opcional: ocultar otros elementos de la página relacionados con la compra
            paymentMethods.Visible = false;
            //ACA VA LA LOGICA PARA VACIAR EL CARRITO
            confirmoFinal.Visible = false;
            btnTerminarCompra.Visible = false;
            btnCanceloCompra.Visible = false;

            //muestro boton para volver
            volverHome.Visible = true;
        }
    }
}