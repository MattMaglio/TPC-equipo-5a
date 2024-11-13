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
            display: flex;
            flex-direction: column;
        }

        .dgviewArticles .top-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px; /* Espaciado entre controles y la grilla */
        }

        .dgviewArticles .table-pagination {
            display: flex;
            justify-content: flex-end;
            padding-top: 10px;
        }

        .table-pagination select {
            padding: 5px;
            margin-left: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Estilo para el DropDownList */
        .custom-dropdown {
            display: inline-block;
            width: 100%;
            max-width: 250px;
            padding: 8px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            color: #333;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s;
        }

        .grid-legend {
            font-size: 14px;
            font-weight: bold;
            margin-right: 15px;
        }

        /* Posicionamiento de la leyenda de cantidad de elementos */
        .grid-count {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 14px;
            font-weight: 600;
            color: #333;
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
        .customLabel{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Fuente moderna */
            font-size: 12.5px; 
            font-weight: 600; 
            color: #111;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1); 
            letter-spacing: 1px; 
            line-height: 1.5; 
            padding: 5px; 
            background-color: rgba(255, 255, 255, 0.7); 
            border-radius: 8px; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        }
        .h2{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Fuente moderna */
            font-size: 30px; 
            font-weight: 600; 
            color: #111;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2); 
            letter-spacing: 1px; 
            line-height: 1.5; 
            padding: 5px; 
            background-color:  rgba(200, 200, 200, 0.7);
            border-radius: 8px; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
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
                                    <asp:Button Text="Agregar articulo" CssClass="btn btn-dark w-100" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Ver articulos" CssClass="btn btn-dark w-100" OnClick="btnViewArticles_Click" ID="btnViewArticles" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Agregar Tipificacion" CssClass="btn btn-dark w-100" ID="btnAddTipific" OnClick="btnAddTipific_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Ver Tipificacion" CssClass="btn btn-dark w-100" ID="btnViewTipific" OnClick="btnViewTipific_Click" runat="server" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Button Text="Agregar Stock y Precio" CssClass="btn btn-dark w-100" ID="btnAddSyP" OnClick="btnAddSyP_Click" runat="server" />
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
                                    <asp:Button Text="Grilla de ventas" CssClass="btn btn-dark w-100" ID="btnViewSell" OnClick="btnViewSell_Click" runat="server" />
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
                        <h5 class="modal-title" id="successModalLabel">¡Bienvenido!</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ¡Ya estas registrado!
               
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
                    
            <!-- Alta y Modificacion de ARTICULOS (Ok)-->
            <div class="form-article" id="div_gral_frmArt" runat="server" visible="false">
                <div class="mt-3">
                    
                    <div id="titulo_add_frm_art" runat="server" visible="true">
                        <h4>Agregar nuevo articulo</h4>
                    </div>
                    <div id="titulo_mod_frm_art" runat="server" visible="false">
                        <h4>Modificacion del articulo</h4>
                    </div>

                    <asp:TextBox runat="server" ID="txtCodeArticle" Placeholder="Codigo" CssClass="form-control" />
                    <asp:TextBox ID="txtDescripcion" runat="server" Placeholder="Descripcion" CssClass="form-control"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtDetalle" Placeholder="Detalle" CssClass="form-control" />

                    <!-- DROP DOWN LIST MARCAS -->
                    <asp:DropDownList ID="ddListBrand" runat="server" CssClass="form-control"></asp:DropDownList>

                    <!-- DROP DOWN LIST TIPOS -->
                    <asp:DropDownList ID="ddListType" runat="server" CssClass="form-control"></asp:DropDownList>

                    <!-- DROP DOWN LIST CATEGORIA -->
                    <asp:DropDownList ID="ddListCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:TextBox runat="server" PlaceHolder="Url Imagen1" ID="txtImagen1" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagen1_TextChanged" />
                            <asp:Image ImageUrl="https://ralfvanveen.com/wp-content/uploads/2021/06/Placeholder-_-Glossary-800x450.webp" Width="25%" ID="IdImagen1" runat="server" />
                             <asp:TextBox runat="server" PlaceHolder="Url Imagen2" ID="txtImagen2" CssClass="form-control"
                                 AutoPostBack="true" OnTextChanged="txtImagen1_TextChanged" />
                             <asp:Image ImageUrl="https://ralfvanveen.com/wp-content/uploads/2021/06/Placeholder-_-Glossary-800x450.webp" Width="25%" ID="IdImagen2" runat="server" />
                             <asp:TextBox runat="server" PlaceHolder="Url Imagen3" ID="txtImagen3" CssClass="form-control"
                             AutoPostBack="true" OnTextChanged="txtImagen1_TextChanged" />
                         <asp:Image ImageUrl="https://ralfvanveen.com/wp-content/uploads/2021/06/Placeholder-_-Glossary-800x450.webp" Width="25%" ID="IdImagen3" runat="server" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnSaveArticle" runat="server" CssClass="bn5" OnClick="btnSaveArticle_Click" Text="Guardar articulo" />
                    <a type="button" class="bn5" href="AdminPanel.aspx">Cancelar</a>

                    <asp:Label ID="labelMsj" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Grilla de control de ARTICULOS (Ok)-->
            <div class="dgviewArticles" id="div_gral_dgvArt" visible="false" runat="server">

                <!-- Drop down de cantidad de Articulos por pagina -->
                <div>
                    <asp:Label runat="server" Text="Artículos por página: " />
                    <asp:DropDownList CssClass="custom-dropdown" ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                        <asp:ListItem Text="5" Value="5" />
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="25" Value="25" />
                        <asp:ListItem Text="50" Value="50" />
                    </asp:DropDownList>
                </div>

                <div>
                      <!-- Grilla de articulos -->
                <asp:GridView ID="dgvArticles" runat="server" CssClass="table table-dark table-striped-columns" DataKeyNames="Id" AutoGenerateColumns="False"
                    OnRowDeleting="dgvArticles_RowDeleting" OnRowCommand="dgvArticles_RowCommand" OnRowUpdating="dgvArticles_RowUpdating" 
                    AllowPaging="True" OnPageIndexChanging="dgvArticles_PageIndexChanging" PageSize="5">
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
            </div>

            <!-- Alta y Modificacion de Tipificaciones (Ok)-->
            <div class="form-tipific" id="div_gral_frmTip"  runat="server" visible="false">
                <div class="mt-3">
                    <div id="titulo_add_frm_tip" runat="server" visible="true">
                        <h4>Agregar nueva tipificacion</h4>
                    </div>
                    <div id="titulo_mod_frm_tip" runat="server" visible="false">
                        <h4>Modificacion de tipificacion</h4>
                    </div>

                    <asp:DropDownList ID="ddlTipoTipific" runat="server" CssClass="form-control"></asp:DropDownList>

                    <asp:TextBox ID="txtCodTipific" runat="server" CssClass="form-control" Placeholder="Codigo" />
                    <asp:TextBox ID="txtDescTipific" runat="server" CssClass="form-control" Placeholder="Descripcion" />

                    <asp:Button ID="btnAceptar" CssClass="bn5" Text="Guardar Tipificacion" OnClick="btnAceptarTipific_Click" runat="server" />
                    <a type="button" class="bn5" href="AdminPanel.aspx">Cancelar</a>

                    <asp:Label ID="label1" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
                </div>
            </div>

            <!-- Grilla de control de Tipificaciones (Ok) -->
            <div class="dgviewTipificaciones" id="div_gral_dgvTip" visible="false" runat="server">
                
                <asp:Label ID="lblSelecTipific" runat="server" Text="Selecione la tipificacion que desea visualizar: " CssClass="customLabel"></asp:Label>
                <asp:Button ID="btnTipificMarca" CssClass="btn btn-primary" OnClick="btnTipificMarca_Click" runat="server" Text="Marca"/>
               
                <asp:Button ID="btnTipificTipo" CssClass="btn btn-primary" OnClick="btnTipificTipo_Click" runat="server" Text="Tipo"/>
                <asp:Button ID="btnTipificCategoria" CssClass="btn btn-primary" OnClick="btnTipificCategoria_Click" runat="server" Text="Categoria"/>
                
                <asp:Button ID="btnTipificColor" CssClass="btn btn-primary" OnClick="btnTipificColor_Click" runat="server" Text="Color"/>
                <asp:Button ID="btnTipificTalle" CssClass="btn btn-primary" OnClick="btnTipificTalle_Click" runat="server" Text="Talle"/>
                
                <asp:GridView ID="dgvTipific" runat="server" CssClass="table table-dark table-striped-columns" DataKeyNames="Id" AutoGenerateColumns="False"
                        OnRowDeleting="dgvTipific_RowDeleting" OnRowCommand="dgvTipific_RowCommand">
                    <Columns>

                        <asp:BoundField DataField="Id" HeaderText="Id"/>
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo"/>
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion"/>
                        <asp:BoundField DataField="Estado" HeaderText="Estado"/>

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
                                    OnClientClick="return confirm('¿Estás seguro de que deseas borrar esta tipificacion?');" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Grilla de control de Stock y Precios -->
            <div class="dgviewSyP" id="div_gral_dgvSyp" runat="server" visible="false">
                <div>
                    <div>
                    <asp:Label ID="lblTitulo" runat="server" Text="Ingrese la combinacion que desee actualziar"></asp:Label>
                </div>
                    
                    <div>
                    <asp:Label ID="lblArticulo" runat="server" Text="Articulo: "></asp:Label>
                    <asp:DropDownList ID="ddlArticulo" runat="server" OnSelectedIndexChanged="ddlArticulo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:Label ID="lblNombreArt" runat="server"></asp:Label>
                </div>
                    
                    <div>
                    <asp:Label ID="lblColor" runat="server" Text="Color: "></asp:Label>
                    <asp:DropDownList ID="ddlColor" runat="server"></asp:DropDownList>
                </div>
                    
                    <div>
                    <asp:Label ID="lblTalle" runat="server" Text="Talle: "></asp:Label>
                    <asp:DropDownList ID="ddlTalle" runat="server"></asp:DropDownList>
                </div>
                    
                    <div>
                    <asp:Label ID="lblStock" runat="server" Text="Cantidad: "></asp:Label>
                    <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAceptarStock" OnClick="btnAceptarStock_Click" runat="server" Text="Actualziar Stock" />
                </div>
                    
                    <div>
                    <asp:Label ID="lblPrecio" runat="server" Text="Precio $: "></asp:Label>
                    <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAceptarPrecio" OnClick="btnAceptarPrecio_Click" runat="server" Text="Actualziar Precio" />
                </div>
                </div>
                <asp:GridView ID="dgvSyP" runat="server" CssClass="table table-dark table-striped-columns" DataKeyNames="IdRegSyP" AutoGenerateColumns="False"
                    OnRowDeleting="dgvSyP_RowDeleting">
                    <Columns>

                        <asp:BoundField DataField="IdRegSyP" HeaderText="Id" />
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
                                <!--
                                <asp:Button Text="Modificar Stock y Precio" CssClass="btn btn-primary"
                                CommandName="Modificar"
                                CommandArgument='<%# Eval("IdRegSyP") %>'
                                runat="server" />
                                 -->
                                <asp:Button Text="Eliminar combinacion" CssClass="btn btn-danger"
                                    CommandName="Delete"
                                    CommandArgument='<%# Eval("IdRegSyP") %>'
                                    runat="server"
                                    OnClientClick="return confirm('¿Estás seguro de que deseas borrar este artículo?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
            <!-- GRID PARA MOSTRAR LAS VENTAS -->
                 <asp:GridView ID="dgvSell" runat="server" CssClass="table table-dark table-striped-columns" AutoGenerateColumns="false" Visible="false">
                    <Columns>
                                <asp:BoundField DataField="IdVenta" HeaderText="ID Venta" />
                                <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:BoundField DataField="Detalle" HeaderText="Detalle" />
                        
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                               <asp:Image ID="imgIconoStatus" runat="server" Width="20" Height="20" ImageUrl='<%# GetStatusIcon(Eval("Status")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                      <asp:TemplateField HeaderText="Cambiar estado">
                            <ItemTemplate>
                                <asp:DropDownList runat="server" ID="ddlEstadoVenta" OnTextChanged="ddlEstadoVenta_TextChanged" >
                                    <asp:ListItem Text="" />
                                    <asp:ListItem Text="Exitoso" Value="Success"/>
                                    <asp:ListItem Text="Cancelado" Value="Canceled"/>
                                    <asp:ListItem Text="En proceso" Value="InProcess" />
                                </asp:DropDownList>               
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnSaveStatus" OnClick="btnSaveStatus_Click" Text="Guardar"
                                    CommandArgument='<%#Eval("IdVenta")%>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        
        </div>
    </div>
    <%-- FIN de RIGHT PANEL --%>
</asp:Content>
