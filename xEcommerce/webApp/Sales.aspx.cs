﻿using ApplicationService;
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

            deliveryOptions.Visible = true;  // Mostrar el contenedor de opciones de entrega
            rblDeliveryOptions.Visible = true;  // Asegurarse de que el RadioButtonList sea visible
            radioRetiro.Attributes.CssStyle.Add("display", "");  // Asegurarse de que los radios sean visibles
            radioEnvio.Attributes.CssStyle.Add("display", "");
        }
        /// <summary>
        /// //////////////////////////////////////////////////////////////////
        /// </summary>

        protected void btnConfirmoEnvio_Click(object sender, EventArgs e)
        {
            deliveryOptions.Visible = false;
            bool isValid = true;

            // Validar Calle
            if (string.IsNullOrWhiteSpace(txtCalle.Text))
            {
                lblCalleError.Text = "La calle es obligatoria.";
                lblCalleError.Visible = true;
                lblCalleSuccess.Visible = false;
                isValid = false;
            }
            else
            {
                lblCalleSuccess.Text = "Calle válida.";
                lblCalleSuccess.Visible = true;
                lblCalleError.Visible = false;
            }

            // Validar Número
            if (string.IsNullOrWhiteSpace(txtNumero.Text) || !txtNumero.Text.All(char.IsDigit))
            {
                lblNumeroError.Text = "El número es obligatorio y debe contener solo dígitos.";
                lblNumeroError.Visible = true;
                lblNumeroSuccess.Visible = false;
                isValid = false;
            }
            else
            {
                lblNumeroSuccess.Text = "Número válido.";
                lblNumeroSuccess.Visible = true;
                lblNumeroError.Visible = false;
            }
            // Validar Ciudad (solo letras y espacios)
            if (string.IsNullOrWhiteSpace(txtCiudad.Text) || !IsOnlyLettersAndSpaces(txtCiudad.Text))
            {
                lblCiudadError.Text = "La ciudad es obligatoria y debe contener solo letras y espacios.";
                lblCiudadError.Visible = true;
                lblCiudadSuccess.Visible = false;
                isValid = false;
            }
            else
            {
                lblCiudadSuccess.Text = "Ciudad válida.";
                lblCiudadSuccess.Visible = true;
                lblCiudadError.Visible = false;
            }

            // Validar Provincia (solo letras y espacios)
            if (string.IsNullOrWhiteSpace(txtProvincia.Text) || !IsOnlyLettersAndSpaces(txtProvincia.Text))
            {
                lblProvinciaError.Text = "La provincia es obligatoria y debe contener solo letras y espacios.";
                lblProvinciaError.Visible = true;
                lblProvinciaSuccess.Visible = false;
                isValid = false;
            }
            else
            {
                lblProvinciaSuccess.Text = "Provincia válida.";
                lblProvinciaSuccess.Visible = true;
                lblProvinciaError.Visible = false;
            }

            // Validar Código Postal
            if (string.IsNullOrWhiteSpace(txtCP.Text) || !txtCP.Text.All(char.IsDigit))
            {
                lblCPError.Text = "El código postal es obligatorio y debe contener solo dígitos.";
                lblCPError.Visible = true;
                lblCPSuccess.Visible = false;
                isValid = false;
            }
            else
            {
                lblCPSuccess.Text = "Código postal válido.";
                lblCPSuccess.Visible = true;
                lblCPError.Visible = false;
            }

            // Si todo es válido, continuar con la lógica
            if (isValid)
            {
                // Tu lógica actual para completar el envío
                string deliveryChoice = rblDeliveryOptions.SelectedValue;
                paymentMethods.Visible = true;
                deliveryOptions.Visible = false;
                shippingForm.Visible = false;
                btnConfirmoEnvio.Visible = false;
                btnCanceloEnvio.Visible = false;

                // Completar datos de envío en el resumen de compra
                lblCalle.Text = "Calle: " + txtCalle.Text;
                lblNumero.Text = "Número: " + txtNumero.Text;
                lblCiudad.Text = "Ciudad: " + txtCiudad.Text;
                lblProvincia.Text = "Provincia: " + txtProvincia.Text;
                lblCP.Text = "Código Postal: " + txtCP.Text;

                lblTituloEnvio.Visible = true;
                lblCalle.Visible = true;
                lblNumero.Visible = true;
                lblCiudad.Visible = true;
                lblProvincia.Visible = true;
                lblCP.Visible = true;

                lblAmountToPay.Text = $"Monto total: $99 (Incluye {deliveryChoice})";
            }
        }






        /////////////////////////////////////////////////////////////////////////////////////////////////////

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            
            // Variable para controlar la validez de los datos
            bool isValid = true;

            // Validar DNI
            if (string.IsNullOrWhiteSpace(txtDNI.Text) || !IsDNIValid(txtDNI.Text))
            {
                Label3.Text = "DNI es obligatorio y debe contener 7 u 8 dígitos.";
                Label3.Visible = true;
                Label4.Visible = false;
                isValid = false;

            }
            else
            {
                Label4.Text = "DNI válido.";
                Label4.Visible = true;
                Label3.Visible = false;
            }

            // Validar Nombre
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || !IsOnlyLetters(txtNombre.Text))
            {
                Label5.Text = "El nombre es obligatorio y debe contener solo letras.";
                Label5.Visible = true;
                Label6.Visible = false;
                isValid = false;
            }
            else
            {
                Label6.Text = "Nombre válido.";
                Label6.Visible = true;
                Label5.Visible = false;
            }

            // Validar Apellido
            if (string.IsNullOrWhiteSpace(txtApellido.Text) || !IsOnlyLetters(txtApellido.Text))
            {
                Label7.Text = "El apellido es obligatorio y debe contener solo letras.";
                Label7.Visible = true;
                Label8.Visible = false;
                isValid = false;
            }
            else
            {
                Label8.Text = "Apellido válido.";
                Label8.Visible = true;
                Label7.Visible = false;
            }

            // Si todos los datos son válidos, proceder con la lógica de la compra
            if (isValid)
            {
                // Mostrar resumen del cliente
                lblNombre.Text = txtNombre.Text;
                lblApellido.Text = txtApellido.Text;
                lblDNI.Text = txtDNI.Text;

                confirmationDetails.Visible = true;
                Div1.Visible = true;

                // Ocultar otras secciones y botones
                articulosAgregados1.Visible = false;
                articulosAgregados2.Visible = false;
                articulosAgregados3.Visible = false;
                shippingData.Visible = false;
                paymentMethods.Visible = false;
                confirmationSection.Visible = true;

                btnConfirmaRetiroLocal.Visible = false;
                bntCancelarRetiroLocal.Visible = false;
                btnConfirmoEnvio.Visible = false;
                btnCanceloEnvio.Visible = false;
                btnConfirmPayment.Visible = false;

                // Mostrar el monto total de compra
                decimal monto = 150.00m;
                lblAmountToPay.Text = "$" + monto.ToString("F2");
            }
        }

        // Método para validar el formato del DNI
        private bool IsDNIValid(string dni)
        {
            return (dni.Length == 7 || dni.Length == 8) && dni.All(char.IsDigit);
        }

        // Método para validar que la cadena contenga solo letras
        private bool IsOnlyLetters(string input)
        {
            return input.All(char.IsLetter);
        }

        // Método para validar que el campo contenga solo letras y espacios
        private bool IsOnlyLettersAndSpaces(string input)
        {
            return input.All(c => char.IsLetter(c) || char.IsWhiteSpace(c));
        }


        /// ////////////////////////////////////////////////////////////////////


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