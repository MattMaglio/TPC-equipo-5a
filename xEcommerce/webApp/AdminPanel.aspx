﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="webApp.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showSuccessMessage() {
            $('#successModal').modal('show');
        }

        //function redirectToLogin() {
        //    window.location.href = "Login.aspx";
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <style>
        /* Ajustes generales */
        .container {
            display: flex;
            flex-wrap: wrap; /* SE ENVUELEN SI NO HAY SUFICIENTE ESPACIO */
            justify-content: space-between;
            padding: 10px;
        }

        .left-panel, .right-panel {
            padding: 10px;
        }

        /* AJUSTE DEL TAMAÑO DEL PANEL IZQUIERDO */
        .left-panel {
            width: 100%;
            max-width: 300px;
        }

        .right-panel {
            width: 100%; /* Ocupa EL 100% DE PANTALLAS CHICAS */
            max-width: 700px; /* MAX PARA PANTALLAS GRANDES */
            margin-top: 20px;
        }

        /* Flexibilidad en los formularios y grids */
        .form-article {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 10px;
            margin-top: -30px;
        }

        .form-tipific {
            width: 100%;
            max-width: 600px;
            top: 25px; /* Distancia desde el borde superior */
            left: 50%;
            /*transform: translateX(-50%); /* Centra el formulario horizontalmente */
            /*z-index: 1000; /* Asegura que esté encima de otros elementos */
        }

        .dgviewArticles {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 0;
            display: flex;
            justify-content: center; /* Centra horizontalmente */
            align-items: center; /* Centra verticalmente */
            height: 100vh;
            margin-top: -150px;
        }

        /* RESPONSIVE CON MEDIA QUERYS */
        @media (min-width: 768px) {
            .container {
                flex-direction: row; /* Alinea los paneles en fila para pantallas grandes */
            }

            .left-panel {
                width: 30%; /* Ajusta el ancho de los paneles para pantallas grandes */
            }

            .right-panel {
                width: 65%; /* Ajusta el ancho del panel derecho en pantallas grandes */
            }
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column; /* Apila los paneles en pantallas pequeñas */
            }

            .left-panel, .right-panel {
                width: 100%; /* Ancho completo en pantallas pequeñas */
            }
        }

        /* AJUSTES BOTONES Y ACORDEON */
        .accordion-button::after {
            filter: invert(1);
        }

        .accordion-button.collapsed::after {
            filter: invert(0);
        }

        .list-group-item {
            padding: 0;
        }

            .list-group-item a {
                display: block;
                text-align: center;
            }

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
    </style>

    <div class="container mt-4">
        <%-- LEFT PANEL --%>
        <div class="left-panel">
            <h2 class="h2">Admin Panel</h2>

            <!-- MENU DESPEGABLE CON ACORDEON -->
            <div class="accordion custom-width" id="adminAccordion">

                <!--Sección Articulos -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingArticles">
                        <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArticles" aria-expanded="false" aria-controls="collapseArticles">
                            Articulos
                           
                        </button>
                    </h2>
                    <div id="collapseArticles" class="accordion-collapse collapse" aria-labelledby="headingArticles" data-bs-parent="#adminAccordion">
                        <div class="accordion-body">
                            <ul class="list-group mb-3">
                                <li class="list-group-item">
                                    <asp:Button Text="Ver articulos" CssClass="btn btn-dark w-100" OnClick="btnViewArticles_Click" ID="btnViewArticles" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Agregar articulo" CssClass="btn btn-dark w-100" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
                                </li>
                                <li>
                                    <asp:Button Text="Ver Tipificacion" CssClass="btn btn-dark w-100" ID="btnViewTipific" OnClick="btnViewTipific_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Agregar Tipificacion" CssClass="btn btn-dark w-100" ID="btnAddTipific" OnClick="btnAddTipific_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Agregar Stock y Precio" CssClass="btn btn-dark w-100" ID="btnAddSyP" OnClick="btnAddSyP_Click" runat="server" />
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Sección Usuarios -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingClients">
                        <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseClients" aria-expanded="true" aria-controls="collapseClients">
                            Usuarios
                           
                        </button>
                    </h2>
                    <div id="collapseClients" class="accordion-collapse collapse" aria-labelledby="headingClients" data-bs-parent="#adminAccordion">
                        <div class="accordion-body">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <asp:Button Text="View users" CssClass="btn btn-dark w-100" ID="btnViewClients" runat="server" />
                                    <!-- GRID PARA MOSTRAR LOS  USERS -->
                                    <asp:GridView ID="dgvClients" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                                        <Columns>
                                            <asp:BoundField DataField="IdUser" HeaderText="ID Usuario" />
                                            <asp:BoundField DataField="LastName" HeaderText="Apellido" />
                                            <asp:BoundField DataField="Name" HeaderText="Nombre" />
                                            <asp:BoundField DataField="Dni" HeaderText="DNI" />
                                            <asp:BoundField DataField="Address" HeaderText="Direccion" />
                                        </Columns>
                                    </asp:GridView>
                                </li>
                                <li class="list-group-item">
                                    <a href="UpdateUser.aspx" class="btn btn-dark w-100">Modificar</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="DeleteUser.aspx" class="btn btn-dark w-100">Eliminar</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Sección Ventas -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingSell">
                        <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSell" aria-expanded="false" aria-controls="collapseSell">
                            Ventas
                           
                        </button>
                    </h2>
                    <div id="collapseSell" class="accordion-collapse collapse" aria-labelledby="headingSell" data-bs-parent="#adminAccordion">
                        <div class="accordion-body">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <asp:Button Text="View sales" CssClass="btn btn-dark w-100" ID="btnViewSell" OnClick="btnViewSell_Click" runat="server" />
                                    <!-- GRID PARA MOSTRAR LAS VENTAS -->
                                    <asp:GridView ID="dgvSell" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                                        <Columns>
                                            <asp:BoundField DataField="SellID" HeaderText="ID Venta" />
                                            <asp:BoundField DataField="User" HeaderText="Usuario" />
                                            <asp:BoundField DataField="Date" HeaderText="Fecha" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" />
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgStatus" runat="server" Width="20" Height="20" ImageUrl='<%# GetStatusIcon(Eval("Status")) %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </li>
                                <li class="list-group-item">
                                    <a href="modificarCliente.aspx" class="btn btn-dark w-100">Cancelados</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Exitosos</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Sección Listados -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingReports">
                        <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReports" aria-expanded="false" aria-controls="collapseReports">
                            Listados
                        </button>
                    </h2>
                    <div id="collapseReports" class="accordion-collapse collapse" aria-labelledby="headingReports" data-bs-parent="#adminAccordion">
                        <div class="accordion-body">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <asp:Button Text="Stock por Articulo" CssClass="btn btn-dark w-100" ID="btnReportStockPorArticulo" OnClick="btnReportStockPorArticulo_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Stock y Precios por combinacion" CssClass="btn btn-dark w-100" ID="btnReportStockYPrecio" runat="server" OnClick="btnReportStockYPrecio_Click" />
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <!-- FIN de MENU DESPEGABLE CON ACORDEON -->

        </div>
        <%-- FIN de LEFT PANEL --%>

        <%-- SUCCESS ALERT --%>
        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Welcome Aboard!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        You're Now Registered!
               
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="redirectToLogin()">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- FIN de SUCCESS ALERT --%>

        <%-- RIGHT PANEL --%>
        <div class="right-panel">

            <div class="form-article">
                <div class="mt-3" runat="server" id="addArticleForm" visible="false">
                    <h4>Agregar nuevo articulo</h4>
                    <asp:TextBox runat="server" ID="txtCodeArticle" Placeholder="Codigo" CssClass="form-control" />
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Placeholder="Descripcion"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtDetalle" Placeholder="Detalle" CssClass="form-control" />

                    <!-- DROP DOWN LIST MARCAS -->
                    <asp:DropDownList ID="ddListBrand" runat="server" CssClass="form-control"></asp:DropDownList>

                    <!-- DROP DOWN LIST TIPOS -->
                    <asp:DropDownList ID="ddListType" runat="server" CssClass="form-control"></asp:DropDownList>

                    <!-- DROP DOWN LIST CATEGORIA -->
                    <asp:DropDownList ID="ddListCategory" runat="server" CssClass="form-control"></asp:DropDownList>

                    <asp:Button ID="btnSaveArticle" runat="server" CssClass="bn5" OnClick="btnSaveArticle_Click" Text="Guardar articulo" />
                    <a type="button" class="bn5" href="AdminPanel.aspx">Cancelar</a>
                    <asp:Label ID="labelMsj" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
                </div>
            </div>

            <div class="dgviewArticles">
                <asp:GridView ID="dgvArticles" OnRowUpdating="dgvArticles_RowUpdating" OnRowDeleting="dgvArticles_RowDeleting" OnRowCommand="dgvArticles_RowCommand" runat="server" CssClass="table table-bordered mt-4" Visible="false" AutoGenerateColumns="False">
                    <Columns>

                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:BoundField DataField="Marca.Descripcion" HeaderText="Marca" />
                        <asp:BoundField DataField="Tipo.Descripcion" HeaderText="Tipo" />
                        <asp:BoundField DataField="Categoria.Descripcion" HeaderText="Categoria" />
                        <asp:BoundField DataField="Detalle" HeaderText="Detalle" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />


                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:Button Text="Modificar" CssClass="btn btn-primary"
                                    CommandName="Modificar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server" />

                                <asp:Button Text="Eliminar" CssClass="btn btn-danger"
                                    CommandName="Delete"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas borrar este artículo?');" />

                                <asp:Button Text="Cargar Stock y precio" CssClass="btn btn-primary"
                                    CommandName="Actualizar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas actualziar el stock y precio de este artículo?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="dgviewSyP">
                <asp:Label ID="lblTitulo" runat="server" Text="Ingrese la combinacion que desee actualziar" Visible="false"></asp:Label>

                <asp:Label ID="lblArticulo" runat="server" Text="Articulo: " Visible="false"></asp:Label>
                <asp:DropDownList ID="ddlArticulo" runat="server" Visible="false"></asp:DropDownList>

                <asp:Label ID="lblColor" runat="server" Text="Color: " Visible="false"></asp:Label>
                <asp:DropDownList ID="ddlColor" runat="server" Visible="false"></asp:DropDownList>

                <asp:Label ID="lblTalle" runat="server" Text="Talle: " Visible="false"></asp:Label>
                <asp:DropDownList ID="ddlTalle" runat="server" Visible="false"></asp:DropDownList>

                <asp:Label ID="lblStock" runat="server" Text="Cantidad: " Visible="false"></asp:Label>
                <asp:TextBox ID="txtStock" runat="server" Visible="false"></asp:TextBox>
                <asp:Button ID="btnActStock" runat="server" Text="Actualziar Stock" Visible="false" />

                <asp:Label ID="lblPrecio" runat="server" Text="Precio $: " Visible="false"></asp:Label>
                <asp:TextBox ID="txtPrecio" runat="server" Visible="false"></asp:TextBox>
                <asp:Button ID="btnActPrecio" runat="server" Text="Actualziar Precio" Visible="false" />

                <asp:GridView ID="dgvSyP" runat="server" CssClass="table table-bordered mt-4" Visible="false" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:BoundField DataField="Color.Descripcion" HeaderText="Color" />
                        <asp:BoundField DataField="Talle.Descripcion" HeaderText="Talle" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />

                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:Button Text="Modificar Stock y Precio" CssClass="btn btn-primary"
                                    CommandName="Modificar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server" />

                                <asp:Button Text="Eliminar combinacion" CssClass="btn btn-danger"
                                    CommandName="Delete"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas borrar este artículo?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-tipific">
                <div class="mt-3" runat="server" id="addTipificForm" visible="false">

                    <h4>Agregar nueva Tipificacion</h4>

                    <asp:DropDownList ID="ddlTipoTipific" runat="server" CssClass="form-control"></asp:DropDownList>

                    <asp:TextBox ID="txtCodTipific" runat="server" CssClass="form-control" Placeholder="Codigo" />
                    <asp:TextBox ID="txtDescTipific" runat="server" CssClass="form-control" Placeholder="Descripcion" />

                    <asp:Button ID="btnAceptar" CssClass="bn5" Text="Guardar Tipificacion" OnClick="btnAceptarTipific_Click" runat="server" />
                    <a type="button" class="bn5" href="AdminPanel.aspx">Cancelar</a>

                    <asp:Label ID="label1" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
                </div>
            </div>

            <div class="dgviewTipificaciones">
                <!-- OnRowUpdating="dgvTipific_RowUpdating" OnRowDeleting="dgvTipific_RowDeleting" OnRowCommand="dgvTipific_RowCommand" -->
                <asp:Label ID="lblSelecTipific" runat="server" Text="Selecione la tipificacion que desea visualizar" Visible="false"></asp:Label>
                <asp:Button ID="btnTipificMarca" CssClass="btn btn-primary" OnClick="btnTipificMarca_Click" runat="server" Text="Marca" Visible="false" />
                <asp:Button ID="btnTipificTipo" CssClass="btn btn-primary" OnClick="btnTipificTipo_Click" runat="server" Text="Tipo" Visible="false" />
                <asp:Button ID="btnTipificCategoria" CssClass="btn btn-primary" OnClick="btnTipificCategoria_Click" runat="server" Text="Categoria" Visible="false" />
                <asp:Button ID="btnTipificColor" CssClass="btn btn-primary" OnClick="btnTipificColor_Click" runat="server" Text="Color" Visible="false" />
                <asp:Button ID="btnTipificTalle" CssClass="btn btn-primary" OnClick="btnTipificTalle_Click" runat="server" Text="Talle" Visible="false" />
                <asp:GridView ID="dgvTipific" runat="server" CssClass="table table-bordered mt-4" Visible="false" AutoGenerateColumns="False"
                    OnRowUpdating="dgvTipific_RowUpdating" OnRowDeleting="dgvTipific_RowDeleting" OnRowCommand="dgvTipific_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />

                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:Button Text="Modificar" CssClass="btn btn-primary"
                                    CommandName="Modificar"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server" />

                                <asp:Button Text="Eliminar" CssClass="btn btn-danger"
                                    CommandName="Delete"
                                    CommandArgument='<%# Eval("Id") %>'
                                    runat="server"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas borrar este artículo?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>

        <%-- FIN de RIGHT PANEL --%>
    </div>

</asp:Content>

         
   





