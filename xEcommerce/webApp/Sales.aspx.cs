using ApplicationService;
using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
                CargarCarrito();
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

                var carrito = (List<Carrito>)Session["Carrito"] ?? new List<Carrito>();
                if (carrito.Count <= 0)
                {
                    btnConfirmarArticulos.Enabled = false;
                }

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

        // BLOQUE DE OPCIONES DE ENTREGA
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

            lblAmountShipping.Visible = true;
            lblAmountShipping.Text = "Sin costo";

            string shipping = "retiro";
            Session.Add("shipping", shipping);
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

                lblAmountShipping.Visible = true;
                lblAmountShipping.Text = "El envio se abona por separado. Te informaremos el costo del mismo al finalziar la compra.";

                string shipping = "envio";
                Session.Add("shipping", shipping);
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
                //decimal monto = 150.00m;
                //lblAmountToPay.Text = "$" + monto.ToString("F2");
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
        
        // BLOQUE DE PAGO
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

        // BLOQUE DE ARTÍCULOS
        protected void btnConfirmarArticulos_Click(object sender, EventArgs e)
        {
            shippingData.Visible = true;
            grupoBtnArticulos.Visible = false;

        }
        protected void btnCancelarArticulos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session["Carrito"] = new List<Carrito>();
            CargarCarrito();
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
            // Recuperar el carrito de la sesión
            var carrito = (List<Carrito>)Session["Carrito"];

            if (carrito == null || carrito.Count == 0)
            {
                // Mostrar un mensaje de error si el carrito está vacío
                //lblError.Text = "El carrito está vacío. No se puede procesar la compra.";
                //return;
            }

           
            var usuario = (Model.Usuario)Session["usuario"];
            string nombreUsuario = usuario.User;

            float montoTotal = carrito.Sum(item => item.Precio * item.Cantidad);

            bool retiro = false;
            bool envio = false;

            string tipoShipping = Session["shipping"].ToString();
            if(tipoShipping == "retiro")
            {
                retiro = true;
            }
            else
            {
                envio = true;
            }
            
            CarritoAS carritoAS = new CarritoAS();

            // Registrar la orden de venta
            carritoAS.registrarOrdenDeVenta(carrito, nombreUsuario, retiro, envio, montoTotal);

            // Descontar el stock de la venta si se egistro la orden;
            //if (exito){
            foreach (var item in carrito)
            {
                carritoAS.restarStockVenta(item.ProductoId, item.ColorId, item.TalleId, item.Cantidad);
            }
            //}

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
        private void CargarCarrito()
        {
            var carrito = (List<Carrito>)Session["Carrito"] ?? new List<Carrito>();
            rptCarrito.DataSource = carrito;
            rptCarrito.DataBind();

            float montoTotal = carrito.Sum(item => item.Precio * item.Cantidad);
            lblAmountToPay.Text = montoTotal.ToString("C");
        }
        protected void btnBorrarCarrito_Click(object sender, EventArgs e)
        {
            Session["Carrito"] = new List<Carrito>();
            CargarCarrito();
        }
    }
}