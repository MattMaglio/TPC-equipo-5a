<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="webApp.Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
        /*OPCIONES de ENVIO*/

        /* Formulario de Envío */
        #shippingForm {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        #pickupMessage {
            margin-top: 20px;
            color: white;
            background-color: #4CAF50;
            padding: 10px;
            border-radius: 5px;
        }

        /* Botón de continuar con el pago */
        #btnContinuePayment {
            padding: 10px 20px;
            font-size: 1.2em;
            border-radius: 5px;
            cursor: pointer;
            background-color: #28a745;
            color: white;
            border: none;
        }

            #btnContinuePayment:hover {
                background-color: #218838;
            }

        /* Contenedor Principal */
        .main-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
            margin: 40px auto;
        }

        /* Contenedor de Resumen de Compra */
        .summary-container {
            width: 300px;
            background-color: #2C3E50;
            border-radius: 10px;
            padding: 20px;
            color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .separator {
            border: 0;
            border-top: 4px dashed white; /* Línea discontinua */
            margin: 20px 0; /* Márgenes superior e inferior */
            width: 99%; /* Longitud de la línea */
            margin-left: auto;
            margin-right: auto; /* Centrar la línea */
        }

        #confirmationSection {
            /*color: white;*/ /* Cambia el color del texto a blanco */
            /*background-color: aquamarine;*/
            width: 300px;
            background-color: #2C3E50;
            border-radius: 10px;
            padding: 20px;
            color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Detalles de Confirmación en el Resumen */
        #confirmationDetails {
            background: linear-gradient(45deg, #ff0000, #ff7e5f);
            border-radius: 5px;
            padding: 10px;
            color: white;
            margin-top: 15px;
        }

        /* Animación de fondo */
        @keyframes colorChange {
            0% {
                background-color: #f0f2f5;
            }

            25% {
                background-color: #e3f2fd;
            }

            50% {
                background-color: #fff3e0;
            }

            75% {
                background-color: #e8f5e9;
            }

            100% {
                background-color: #f0f2f5;
            }
        }

        body {
            animation: colorChange 10s infinite;
            background-color: blueviolet;
            transition: background-color 1s ease;
            color: white;
        }

        /* Contenedor de Artículos */
        .cart-container {
            flex-grow: 1;
            background-color: #0D1B2A;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }
        /* Encabezado */
        h2 {
            color: #343a40;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Título de la sección */
        /* Título en el Resumen */
        .section-title {
            font-weight: bold;
            font-size: 1.3em;
            margin-bottom: 15px;
            color: #ffffff;
            text-align: center;
            background: linear-gradient(45deg, #ff0000, #ff7e5f);
            padding: 10px;
            border-radius: 5px;
        }

        /* Elementos del carrito */
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #dee2e6;
        }

            .cart-item:last-child {
                border-bottom: none;
            }

        .cart-item-details p {
            margin: 0;
            color: white;
        }

        /* Botón de eliminar con animación de color */
        .cart-item button {
            border: none;
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

            .cart-item button:hover {
                background-color: #c82333;
            }

        /* Campos del formulario */
        .form-group label {
            font-weight: bold;
            color: white;
        }

        .form-check-label {
            font-weight: 500;
            color: white;
        }

        /* Botón principal con animación de color */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 30px;
            font-size: 1.1em;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

            .btn-primary:hover {
                background-color: #0056b3;
            }

        /* Animación de los botones de aplicar cupón */
        .apply-coupon button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

            .apply-coupon button:hover {
                background-color: #218838;
            }

        /* Estilos para los inputs de cupón */
        .apply-coupon input[type="text"] {
            width: 200px;
            margin-right: 10px;
            padding: 6px 12px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }

        .btnApply {
            background-color: #b81515;
            padding: 7px;
            width: 100px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            animation: bn53bounce 4s infinite;
            cursor: pointer;
        }

        /*ANIMACION PARA TITULO DEL CARRITO*/
        .tracking-in-expand {
            -webkit-animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
            animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
        }

        @-webkit-keyframes tracking-in-expand {
            0% {
                letter-spacing: -0.5em;
                opacity: 0;
            }

            40% {
                opacity: 0.6;
            }

            100% {
                opacity: 1;
            }
        }

        @keyframes tracking-in-expand {
            0% {
                letter-spacing: -0.5em;
                opacity: 0;
            }

            40% {
                opacity: 0.6;
            }

            100% {
                opacity: 1;
            }
        }

        /**/
        @keyframes bn53bounce {
            5%, 50% {
                transform: scale(1);
            }

            10% {
                transform: scale(1);
            }

            15% {
                transform: scale(1);
            }

            20% {
                transform: scale(1) rotate(-5deg);
            }

            25% {
                transform: scale(1) rotate(5deg);
            }

            30% {
                transform: scale(1) rotate(-3deg);
            }

            35% {
                transform: scale(1) rotate(2deg);
            }

            40% {
                transform: scale(1) rotate(0);
            }
        }

        .bn39 {
            background-image: linear-gradient(135deg, #008aff, #86d472);
            border-radius: 6px;
            box-sizing: border-box;
            color: #ffffff;
            display: block;
            height: 50px;
            font-size: 1.4em;
            font-weight: 600;
            padding: 4px;
            position: relative;
            text-decoration: none;
            width: 7em;
            z-index: 2;
        }
        /*boton confrm orden*/
        .bn5 {
            padding: 0.6em 2em;
            border: none;
            outline: none;
            color: rgb(255, 255, 255);
            background: #111;
            cursor: pointer;
            position: relative;
            z-index: 0;
            border-radius: 10px;
        }

            .bn5:before {
                content: "";
                background: linear-gradient( 45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5, #002bff, #7a00ff, #ff00c8, #ff0000 );
                position: absolute;
                top: -2px;
                left: -2px;
                background-size: 400%;
                z-index: -1;
                filter: blur(5px);
                width: calc(100% + 4px);
                height: calc(100% + 4px);
                animation: glowingbn5 20s linear infinite;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
                border-radius: 10px;
            }

        @keyframes glowingbn5 {
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 400% 0;
            }

            100% {
                background-position: 0 0;
            }
        }

        .bn5:active {
            color: #000;
        }

            .bn5:active:after {
                background: transparent;
            }

        .bn5:hover:before {
            opacity: 1;
        }

        .bn5:after {
            z-index: -1;
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: #191919;
            left: 0;
            top: 0;
            border-radius: 10px;
        }

        .bn6 {
            cursor: pointer;
            padding: 0.2em 1em;
            outline: none;
            border: none;
            background-color: #232423;
            border-radius: 30px;
            font-size: 1.4em;
            font-weight: 600;
            color: #ffffff;
            background-size: 100% 100%;
            box-shadow: 0 0 0 4px #232423 inset;
        }

            .bn6:hover {
                background-image: linear-gradient( 55deg, transparent 10%, #161616 10% 20%, transparent 20% 30%, #161616 30% 40%, transparent 40% 50%, #161616 50% 60%, transparent 60% 70%, #161616 70% 80%, transparent 80% 90%, #161616 90% 100% );
                animation: background 3s linear infinite;
            }

        .alert {
            padding: 15px;
            background-color: #f44336; /* Rojo */
            color: white;
            margin-top: 15px;
            border-radius: 5px;
            text-align: center;
        }

        .alert-danger {
            font-weight: bold;
        }
</style>

<%--CONTENEDOR PRINCIPAL--%>
<div class="main-container">
       

    <!-- BLOQUE DE RESUMEN DE COMPRA -->
    <div class="summary-container" id="Div1" runat="server">
        <div class="section-title">Resumen de Compra</div>
        
        <div id="confirmationDetails" runat="server">
            <p>    
                <br />
                <!-- Monto a abonar -->
                    <p>
                        <strong>Monto a abonar: </strong>
                        <asp:Label ID="lblAmountToPay" runat="server" Text=""></asp:Label>
                        <p>
                         <strong>Costo de envio: </strong>
                        <asp:Label ID="lblAmountShipping" runat="server" Text="" Visible="false"></asp:Label>
                    </p> 
                <br />

                <%--DATOS DEL COMPRADOR--%>
                <p>
                    <strong>Tu nombre:</strong>
                    <asp:Literal ID="lblNombre" runat="server" Text=""></asp:Literal>
                </p>
                <p>
                    <strong>Tu apellido:</strong>
                    <asp:Literal ID="lblApellido" runat="server" Text=""></asp:Literal>
                </p>
                <p>
                    <strong>Tu DNI:</strong>
                    <asp:Literal ID="lblDNI" runat="server" Text=""></asp:Literal>
                </p>
                <%--OPCION DE ENTREGA ELEGIDA--%>

                <%--si fue Retiro en local--%>
                <p>
                    <asp:Literal ID="lblEntrega" runat="server" Text="Forma de Entrega: retira en local de calle Florida 123 CABA de Lunes a Viernes 10hs a 18hs"></asp:Literal>
                </p>

                <%--si fue Envio--%>
                <p>
                    <asp:Literal ID="lblTituloEnvio" runat="server" Text="Enviaremos tu pedido a:"></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="lblCalle" runat="server" Text="Calle: "></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="lblNumero" runat="server" Text="Número: "></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="lblCiudad" runat="server" Text="Ciudad: "></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="lblProvincia" runat="server" Text="Provincia: "></asp:Literal>
                </p>
                <p>
                    <asp:Literal ID="lblCP" runat="server" Text="Código postal: "></asp:Literal>
                </p>
                <%--OPCION DE PAGO--%>
                <p>
                    <asp:Literal ID="lblFormaDePago" runat="server" Text=""></asp:Literal>
                </p>
                <p>
                    <asp:Button ID="btn_CancelarGral" runat="server" Text="Cancelar la Compra" OnClick="btnCancelarArticulos_Click" Visible="true" OnClientClick="return confirm('¿Estás seguro de que deseas cancelar la compra?');" CssClass="btn btn-success" />
                </p>
        </div>
            <!-- FALTA CERRAR EL div DE confirmationDetails -->
    </div>
    <!-- CIERRE summary-container -->

    <%--BLOQUE DE CARGA DE DATOS / ELECCIONES--%>
    <div class="cart-container">
        <h2 class="tracking-in-expand" id="articulosAgregados1" runat="server" style="color: white;">Tus compras</h2>
        
        <!-- Sección de Artículos en el Carrito -->
        <div class="section-title" id="articulosAgregados2" runat="server">Artículos en carrito</div>
        <!-- productos deL carrito -->
        <div class="cart-item" id="articulosAgregados3" runat="server">
            <asp:Repeater ID="rptCarrito" runat="server">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Color</th>
                            <th>Talle</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Producto") %></td>
                    <td><%# Eval("Color") %></td>
                    <td><%# Eval("Talle") %></td>
                    <td><%# Eval("Cantidad") %></td>
                    <td><%# Eval("Precio", "{0:C}") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
            </asp:Repeater>
            <!-- CIERRE DEL DIV cart-item-details -->
            <asp:Button ID="btnBorrarCarrito" runat="server" Text="Vaciar Carrito" onclick="btnBorrarCarrito_Click" class="btn btn-danger" OnClientClick="disableUnloadWarning();"/>
         </div>
        <!-- CIERRE DEL DIV cart-item -->

        <!-- Botón para continuar y cancelar -->
        <div class="mt-4 text-center" id="grupoBtnArticulos" runat="server">
            <asp:Button ID="btnConfirmarArticulos" runat="server" class="bn5" OnClick="btnConfirmarArticulos_Click" Text="Continuar compra" OnClientClick="disableUnloadWarning();"/>
            <asp:Button ID="btnCancelarArticulos" runat="server" class="bn5" OnClick="btnCancelarArticulos_Click" Text="Cancelar compra" OnClientClick="disableUnloadWarning();" />

        </div>
        <!-- CIERRE DEL DIV grupoBtnArticulos -->

        <!-- Sección de Datos DEL Comprador -->
        <div id="shippingData" runat="server">
            <div class="section-title">Datos Personales</div>

            <!-- Campos de Nombre, Apellido, DNI -->
            <div class="form-group">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" Style="border: black; border-bottom: 1px solid #ccc; background: white; height: auto;" />
            </div>
            <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label6" runat="server" ForeColor="Green"></asp:Label>

            <div class="form-group">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" Style="border: black; border-bottom: 1px solid #ccc; background: white; height: auto;" />
            </div>
            <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label8" runat="server" ForeColor="Green"></asp:Label>

            <div class="form-group">
                <label for="txtDNI" class="form-label">DNI</label>
                <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" Style="border: black; border-bottom: 1px solid #ccc; background: white; height: auto;" />
            </div>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label4" runat="server" ForeColor="Green"></asp:Label>

            <!-- Botón para continuar -->
            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmarCompra" runat="server" class="bn5" OnClick="btnConfirmarCompra_Click" Text="Continuar compra" OnClientClick="disableUnloadWarning();" />
            </div>
            <!-- CIERRE DEL DIV PARA BOTONES -->
        </div>
        <!-- CIERRE  DEL DIV shippingData -->

        <div id="confirmationSection" runat="server">

            <!-- Opciones de Entrega -->
            <div id="deliveryOptions" runat="server" class="mt-3">
                <p class="section-title">Opciones de Entrega</p>
                <asp:RadioButtonList ID="rblDeliveryOptions" runat="server" OnSelectedIndexChanged="rblDeliveryOptions_SelectedIndexChanged" AutoPostBack="True" OnClientClick="disableUnloadWarning();">
                    <asp:ListItem ID="radioRetiro" runat="server" Text="Retiro en Local en Florida 123 CABA de Lunes a Viernes 10hs a 18hs" Value="Retiro" OnClientClick="disableUnloadWarning();" />
                    <asp:ListItem ID="radioEnvio" runat="server" Text="Envío a domicilio" Value="Envio" OnClientClick="disableUnloadWarning();" />
                </asp:RadioButtonList>
            </div>
            <!-- CIERRE DEL DIV deliveryOptions -->

            <%--botones de confirmar / cancelar retiro en local--%>

            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmaRetiroLocal" runat="server" Text="Confirmar y continuar con métodos de pago" OnClick="btnConfirmaRetiroLocal_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <div class="mt-4 text-center">
                <asp:Button ID="bntCancelarRetiroLocal" runat="server" Text="Cancelar retiro por local" OnClick="bntCancelarRetiroLocal_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <!-- Formulario para Envío (aparece si selecciona Envío) -->
            <div id="shippingForm" runat="server" visible="False">
                <p>Completá estos datos para enviar tu producto</p>

                <!-- Calle -->
                <div class="form-group">
                    <label for="txtCalle">Calle</label>
                    <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control" />
                </div>
                <asp:Label ID="lblCalleError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Label ID="lblCalleSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

                <!-- Número -->
                <div class="form-group">
                    <label for="txtNumero">Número</label>
                    <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
                </div>
                <asp:Label ID="lblNumeroError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Label ID="lblNumeroSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

                <!-- Ciudad -->
                <div class="form-group">
                    <label for="txtCiudad">Ciudad</label>
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
                </div>
                <asp:Label ID="lblCiudadError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Label ID="lblCiudadSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

                <!-- Provincia -->
                <div class="form-group">
                    <label for="txtProvincia">Provincia</label>
                    <asp:TextBox runat="server" ID="txtProvincia" CssClass="form-control" />
                </div>
                <asp:Label ID="lblProvinciaError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Label ID="lblProvinciaSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

                <!-- Código Postal -->
                <div class="form-group">
                    <label for="txtCP">Código Postal</label>
                    <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" />
                </div>
                <asp:Label ID="lblCPError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <asp:Label ID="lblCPSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

                <!-- Botones -->
                <div class="mt-4 text-center">
                    <asp:Button ID="btnConfirmoEnvio" runat="server" Text="Si, envíen mi compra" OnClick="btnConfirmoEnvio_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
                </div>
                <div class="mt-4 text-center">
                    <asp:Button ID="btnCanceloEnvio" runat="server" Text="Prefiero retirar en el local" OnClick="bntCancelarRetiroLocal_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
                </div>
            </div>
             <!-- CIERRE DEL DIV shippingForm -->

            <!-- Métodos de pago -->
            <div id="paymentMethods" runat="server">
                <p class="section-title">Elegí tu medio de pago</p>
                <asp:RadioButtonList ID="rblPaymentMethods" runat="server" OnSelectedIndexChanged="rblPaymentMethods_SelectedIndexChanged" AutoPostBack="True" OnClientClick="disableUnloadWarning();">
                    <asp:ListItem Text="Efectivo, abonás en nuestro local en calle Florida 123 CABA de 10hs a 18hs" Value="Efectivo" OnClientClick="disableUnloadWarning();" />
                    <asp:ListItem Text="Transferencia bancaria" Value="Transferencia" OnClientClick="disableUnloadWarning();" />
                    <asp:ListItem Text="Mercado Pago" Value="MercadoPago" OnClientClick="disableUnloadWarning();" />
                </asp:RadioButtonList>
            </div>
            <!-- CIERRE  DEL DIV paymentMethods -->

            <%-- BOTONES DE METODOS DE PAGO--%>

            <%--Si elige Efectivo--%>
            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmaEfectivo" runat="server" Visible="false" Text="Confirmar pago en Efectivo" OnClick="btnConfirmaEfectivo_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>
            <div class="mt-4 text-center">
                <asp:Button ID="btnCancelaEfectivo" runat="server" Visible="false" Text="Cancelar y volver" OnClick="btnCancelaPago_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <%--Si elige Transferencia--%>
            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmaTransferencia" runat="server" Visible="false" Text="Confirmar pago con Transferencia bancaria" OnClick="btnConfirmaTransferencia_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>
            <div class="mt-4 text-center">
                <asp:Button ID="btnCancelaTransferencia" runat="server" Visible="false" Text="Cancelar y volver" OnClick="btnCancelaPago_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <%--Si elige MercadoPago--%>
            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmaMP" runat="server" Visible="false" Text="Confirmar pago con Mercado Pago" OnClick="btnConfirmaMP_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>
            <div class="mt-4 text-center">
                <asp:Button ID="btnCancelarMP" runat="server" Visible="false" Text="Cancelar y volver" OnClick="btnCancelaPago_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <!-- Botón para aceptar -->
            <div class="mt-4 text-center">
                <asp:Button ID="btnConfirmPayment" runat="server" Text="Aceptar" OnClick="btnConfirmPayment_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

            <!-- Confirmación Transferencia -->
            <br />
            <div id="transferConfirmation" runat="server" visible="False">
                <p>Te enviamos los datos de pago por correo electrónico. Por favor, revisá tu bandeja de entrada.</p>
            </div>

            <%--CONFIRMO o CANCELO TODA LA OPERACIÓN--%>
            <div id="confirmoFinal" runat="server" visible="False">
                <p>Revisá y confirmá tu compra</p>
            </div>
            <asp:Button ID="btnTerminarCompra" runat="server" Text="Confirmar la Compra" OnClick="btnTerminarCompra_Click" CssClass="btn btn-success" Visible="false" OnClientClick="disableUnloadWarning();" />
            <asp:Button ID="btnCanceloCompra" runat="server" Text="Cancelar la Compra y vaciar el carrito" OnClick="btnCanceloCompra_Click" Visible="false" OnClientClick="return confirm('¿Estás seguro de que deseas cancelar la compra?');" CssClass="btn btn-success" />

            <%--CANCELO LA COMPRA--%>
            <asp:Label ID="lblCompraCancelada" runat="server" Text="Compra Cancelada" CssClass="alert alert-danger" Visible="False"></asp:Label>

            <%--TERMINO LA COMPRA--%>
            <div id="terminaLaCompra" runat="server" visible="False">
                <p>MUCHAS GRACIAS, YA ESTAMOS PROCESANDO TU PEDIDO! REVISA TU CORREO, TE ENVIAMOS TODOS LOS DATOS PARA FINALIZAR EL PAGO</p>
            </div>

            <%-- boton de finalizar compra--%>
            <div class="mt-4 text-center">
                <asp:Button ID="volverHome" runat="server" Visible="false" Text="Volver al Inicio" OnClick="volverHome_Click" CssClass="btn btn-success" OnClientClick="disableUnloadWarning();" />
            </div>

        </div>
        <!-- CIERRE DEL DIV CONFIRMATIONsECTION -->
    </div>
<!-- CIERRE  DEL DIV MAIN-CONTAINER -->
</div>

</asp:Content>