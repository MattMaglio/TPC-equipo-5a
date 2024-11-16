<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="webApp.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
            background-color:blueviolet;
            transition: background-color 1s ease;
        }

        /* Contenedor del carrito */
        .cart-container {
            max-width: 900px;
            margin: 40px auto;
            background-color:#0D1B2A;
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
        .section-title {
            font-weight: bold;
            font-size: 1.3em;
            margin-bottom: 15px;
            color: white;
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
            color:  white;
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
            color:black;
        }

        .form-check-label {
            font-weight: 500;
            color:gold;
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

        /* Animación de los botones de aplicar cupon */
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
  5%,
  50% {
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
  background: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
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
  background-image: linear-gradient(
    55deg,
    transparent 10%,
    #161616 10% 20%,
    transparent 20% 30%,
    #161616 30% 40%,
    transparent 40% 50%,
    #161616 50% 60%,
    transparent 60% 70%,
    #161616 70% 80%,
    transparent 80% 90%,
    #161616 90% 100%
  );
  animation: background 3s linear infinite;
}
.fomr-datosEnvio{
   
    display: grid;
    grid-template-columns: 1fr 1fr; /* Dos columnas iguales */
    gap: 20px; /* Espacio entre columnas */
    padding: 20px;
}
.columna-envio, .columna-gastos {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    color: black;
}

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
}



    </style>
    <div class="cart-container">
        <h2 class="tracking-in-expand" style="color: white;">Carrito de compra</h2> 
        <!-- Sección de Artículos en el Carrito -->
        <div class="section-title">Articulos en el carrito</div>

        <!-- Artículo 1 -->
        <div class="cart-item">
            <div class="cart-item-details">
                <p><strong>Codigo:</strong> </p>
                <p><strong>Nombre:</strong></p>
                <p><strong>Talle:</strong></p>
                <p><strong>Color:</strong> </p>
                <p><strong>Marca:</strong> </p>
                <p><strong>Categoria:</strong> </p>
                    <p><strong>Precio:</strong></p>
            </div>
            <button>Borrar artículo</button>
        </div>

        <!-- Artículo 2 -->
        <div class="cart-item">
            <div class="cart-item-details">
                <p><strong>Codigo:</strong> </p>
                <p><strong>Nombre:</strong> </p>
                <p><strong>Talle:</strong></p>
                <p><strong>Color:</strong> </p>
                <p><strong>Marca:</strong></p>
                <p><strong>Categoria:</strong> </p>
                <p><strong>Precio:</strong></p>
            </div>
            <button>Borrar artículo</button>
        </div>

        <!-- Opción para aplicar cupón -->
        <div class="apply-coupon">
            <input type="text" id="couponCode" placeholder="Codigo de descuento">
            <button class="btnApply">Aplicar</button>
        </div>

       
    <!-- Columna Izquierda: Datos de envío -->
    <div class="fomr-datosEnvio">
    <!-- Columna Izquierda: Datos de envío -->
    <div class="columna-envio">
        <h4 class="titulo-seccion">Datos de envío</h4> <!-- Subtítulo en negrita -->
        <div class="form-group">
            <label for="nombre">Nombre</label>
             
            <asp:TextBox runat="server" ID="txtNombre" />
        </div>
        <div class="form-group">
            <label for="apellido" style="color:black;">Apellido</label>
            
            <asp:TextBox runat="server" ID="txtApellido"   />
        </div>
        <div class="form-group">
            <label for="direccion">Direccion</label>
            <asp:TextBox runat="server" ID="txtDireccion" />
        </div>
        <div class="form-group">
            <label for="telefono">Telefono</label>
            <asp:TextBox runat="server" ID="txtNroTelefono" TextMode="Number"  />
        </div>
        <div class="form-group">
            <label for="numeroEnvio">Codigo postal</label>
            <asp:TextBox runat="server" ID="txtCcp" TextMode="Number" />
        </div>
    </div>

    <!-- Columna Derecha: Resumen de Gastos -->
    <div class="columna-gastos">
        <h4 class="titulo-seccion-resaltado">Resumen de gastos</h4> <!-- Subtítulo en negrita y resaltado -->
        <div class="form-group">
            <asp:Label Text="Subtotal" style="font-size: 15px;" runat="server" />
           
            <asp:TextBox runat="server" ID="txtSubtotal"  />
        </div>
        <div class="form-group">
            <asp:Label Text="Iva 21%" style="font-size: 15px;" runat="server" />
            
            <asp:TextBox runat="server" ID="txtIva"  />
        </div>
        <div class="form-group">
            <asp:Label Text="Descuento" style="font-size: 15px;" runat="server" />
           
            <asp:TextBox runat="server" ID="txtDescuntos"  />
            </div>
        <div class="form-group">
            <asp:Label Text="Total:" style="font-size: 15px;" runat="server" />
          
            <asp:TextBox runat="server" ID="txtTotal"   />
        </div>
    </div>
</div>


        <!-- Sección de Métodos de Pago -->
        <div class="section-title">Metodos de pago</div>
        <form>
            <div class="form-check">
                <asp:RadioButton Text="Efectivo" ID="radiobtnEfectivo" Checked="true"  runat="server" />
                
             
            </div>
            <div class="form-check">
                <asp:RadioButton Text="Transferencia" ID="radiobtnTransferencia"  runat="server" />                
                 
            </div>
            <div class="form-check">
               <asp:RadioButton Text="Link de pago" ID="radiobtnLinkPago"   runat="server" />
                
                    
              
            </div>
        </form>

        <!-- Sección metodo de envio -->
        <div class="section-title">Metodo de envio</div>
        <form>
            <div class="form-check">
                <asp:RadioButton Text="Correo argentino" ID="radiobtnCorreo" Checked="true"  runat="server" />
                
            </div>
            <div class="form-check">
                <asp:RadioButton Text="Retiro en sucursal" ID="radiobtnRetiroSucursal"  runat="server" />
                
            </div>
        </form>

        <!-- Botón de Confirmar Compra -->
        <div class="mt-4 text-center">
            <asp:Button Text="Confirmar compra" CssClass="bn5" runat="server" ID="btnConfirmarCompra" OnClick="btnConfirmarCompra_Click" />
            <a href="Default.aspx" class="bn6">Cancelar</a> 
        </div>
    </div>
</asp:Content>
