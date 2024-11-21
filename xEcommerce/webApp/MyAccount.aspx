<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="webApp.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            margin-top: 20px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #333;
            background-color: #fff;
        }

        .ui-w-80 {
            width: 80px !important;
            height: auto;
        }

        .btn-default {
            border-color: rgba(24,28,33,0.1);
            background: rgba(0,0,0,0);
            color: #4E5155;
        }

        label.btn {
            margin-bottom: 0;
        }

        .btn-outline-primary {
            border-color: #26B4FF;
            background: transparent;
            color: #26B4FF;
        }

        .btn {
            cursor: pointer;
        }

        .text-light {
            color: #babbbc !important;
        }

        .btn-facebook {
            border-color: rgba(0,0,0,0);
            background: #3B5998;
            color: #fff;
        }

        .btn-instagram {
            border-color: rgba(0,0,0,0);
            background: #000;
            color: #fff;
        }

        .card {
            background-clip: padding-box;
            box-shadow: 0 1px 4px rgba(24,28,33,0.012);
        }

        .row-bordered {
            overflow: hidden;
        }

        .account-settings-fileinput {
            position: absolute;
            visibility: hidden;
            width: 1px;
            height: 1px;
            opacity: 0;
        }

        .account-settings-links .list-group-item.active {
            font-weight: bold !important;
        }

        html:not(.dark-style) .account-settings-links .list-group-item.active {
            background: transparent !important;
        }

        .account-settings-multiselect ~ .select2-container {
            width: 100% !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

        .material-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

        .dark-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(255, 255, 255, 0.03) !important;
        }

            .dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }

        .light-style .account-settings-links .list-group-item.active {
            color: #4E5155 !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24,28,33,0.03) !important;
        }

        .form-control {
            border: none;
            border-bottom: 1px solid #ced4da;
            background: transparent;
            box-shadow: none;
            padding: 10px 0;
            margin-bottom: 20px;
        }

            .form-control:focus {
                outline: none;
                border-bottom: 1px solid #007bff;
            }

        .form-group {
            position: relative;
        }

        .form-label {
            position: absolute;
            left: 0;
            top: -10px;
            font-size: 12px;
            color: #000;
            transition: 0.2s;
        }

        .switcher .switcher-input:checked + .switcher-indicator {
            background-color: #000;
        }

            .switcher .switcher-input:checked + .switcher-indicator .switcher-yes {
                background-color: #000;
            }

            .switcher .switcher-input:checked + .switcher-indicator .switcher-no {
                background-color: transparent;
            }




        .btn-outline-primary {
            border-color: #6c757d;
            background: transparent;
            color: #6c757d;
            transition: background-color 0.3s, color 0.3s;
        }

            .btn-outline-primary:hover {
                background-color: #6c757d;
                color: #fff;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container light-style flex-grow-1 container-p-y">

        <h4 class="font-weight-bold py-3 mb-4">Mi Cuenta
        </h4>

        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="accordion-item"> 
                        <h2 class="accordion-header" id="headingArticles"></h2>
  
                        <div class="accordion-body">
                            <ul class="list-group mb-3">
                                
                                <li class="list-group-item">
                                    <asp:Button Text="Mis datos" CssClass="btn btn-dark w-100" ID="btnDatos" OnClick="btnDatos_Click" runat="server" />
                                </li>
                                
                                <li class="list-group-item">
                                    <asp:Button Text="Ver mis compras" CssClass="btn btn-dark w-100" ID="btnMisCompras" OnClick="btnMisCompras_Click" runat="server" />
                                </li> 
                                
                            </ul>
                        </div>
                    </div>

                </div>
               
                <div class="col-md-9">
                    <div class="tab-content">

                        <div class="tab-pane fade active show" id="tab_datos">
                            <hr class="border-light m-0">
                            <div class="card-body" runat="server" id="tb_datos">
                                <div class="form-group">
                                    <label class="form-label">Nombre de usuario</label>
                                    <asp:TextBox CssClass="form-control" ID="txtUsuario" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">E-mail</label>
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Nombre</label>
                                    <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Apellido</label>
                                    <asp:TextBox CssClass="form-control" ID="txtApellido" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">DNI</label>
                                    <asp:TextBox CssClass="form-control" ID="txtDni" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Actualizar datos!</label>
                                    <asp:Button CssClass="btn btn-default" ID="btn_actDatos" OnClick="btn_actDatos_Click" runat="server" Text="Actualizar!" />
                                </div>

                            </div>
                        </div>
                       
                        <%--<div class="tab-pane fade show" id="tab_misCompras">--%>
                        <div class="card-body pb-2" runat="server" id="tb_compras">

                            <!-- Grilla de ordenes -->
                            <div runat="server" id="div_compras" visible="false">
                            <asp:GridView ID="dgvOrden" runat="server" CssClass="table table-light table-striped-columns"
                                    DataKeyNames="Id" AutoGenerateColumns="False" OnRowCommand="dgvOrden_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" />
                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                    <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                                    <asp:BoundField DataField="TieneEnvio" HeaderText="Tiene Envio" />
                                    <asp:BoundField DataField="TieneRetiro" HeaderText="Tiene Retiro" />
                                    <asp:BoundField DataField="Pagado" HeaderText="Pagado" />
                                    <asp:BoundField DataField="Entregado" HeaderText="Entregado" />
                                    <asp:BoundField DataField="MontoTotal" HeaderText="Monto Total" />
                                    <asp:BoundField DataField="ComprobanteFiscal" HeaderText="Comprobante Fiscal" />
                                    <asp:TemplateField HeaderText="Acción">
                                    <ItemTemplate>
                 
                                        <asp:Button Text="Ver detalle" CssClass="btn btn-primary"
                                            CommandName="Detalle"
                                            CommandArgument='<%# Eval("Id") %>'
                                            runat="server" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            </div>

                            <!-- Grilla de detalle de ordenes -->
                            <div runat="server" id="div_detalle_compras" visible="false">
                                <asp:Button cssClass="btn btn-dark" ID="btnVerOrdenes" runat="server" Text="Volver a las compras"
                                    OnClick="btnVerOrdenes_Click"/>

                                <asp:GridView ID="dgvDetOrden" runat="server" CssClass="table table-light table-striped-columns" 
                                    DataKeyNames="Id" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" />
                                        <asp:BoundField DataField="IdOrden" HeaderText="Orden Nro°" />
                                        <asp:BoundField DataField="Articulo" HeaderText="Articulo" />
                                        <asp:BoundField DataField="Color" HeaderText="Color" />
                                        <asp:BoundField DataField="Talle" HeaderText="Talle" />
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                                
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="text-right mt-3">

            <asp:Button ID="btnVolver" runat="server" Text="Volver a Inicio" OnClick="btnVolver_Click" class="btn btn-secondary" />
        </div>
        <br />
        <br />
    </div>

</asp:Content>
