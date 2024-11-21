<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="webApp.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <script type="text/javascript">
        function showSuccessMessage() {
            $('#successModal').modal('show');
        }

        function redirectToSales() {
            window.location.href = "Sales.aspx";
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .mt-5, .my-5 {
            margin-top: 0.1rem !important;
        }
        .decorative-border {
            border: 5px solid black;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(128, 128, 128, 0.5);
        }
        .card-title {
            font-size: 2.5rem;
            color: #343a40;
            margin-bottom: 15px;
        }
        .font-weight-bold {
            font-weight: bold;
        }
        .font-italic
        {
            font-style: italic;
        }
        .text-muted {
            color: #6c757d;
        }
        .mt-3 {
            margin-top: 1rem;
        }
        .mb-2 {
            margin-bottom: 0.5rem;
        }
    </style>

    <br />
    <br />

    <div class="container mt-5">
        <h1 class="text-center">Detalles del Producto</h1>
        <br />

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card decorative-border">
                    <div class="row no-gutters">
                        <div class="col-md-6">
                            <asp:Image ID="imgProduct" runat="server" CssClass="d-block w-100 h-100" />
                        </div>
                        <div class="col-md-6 d-flex align-items-center">

                            <div class="card-body">
                                <asp:Label ID="lblProductName" runat="server" CssClass="card-title display-4 font-weight-bold"></asp:Label>
                                <br />
                                <br />
                                <p class="font-weight-bold">
                                    <strong>Marca:</strong>
                                    <asp:Label ID="lblBrand" runat="server" CssClass="font-italic"></asp:Label>
                                </p>
                                <p class="font-weight-bold">
                                    <strong>Categoría:</strong>
                                    <asp:Label ID="lblCategory" runat="server" CssClass="font-italic"></asp:Label>
                                </p>
                                <p class="font-weight-bold">
                                    <strong>Tipo:</strong>
                                    <asp:Label ID="lblType" runat="server" CssClass="font-italic"></asp:Label>
                                </p>
                                <h5 class="mt-3 font-weight-bold">Descripción:</h5>
                                <asp:Label ID="lblDescription" runat="server" CssClass="text-muted"></asp:Label>
                                <br />
                                <br />

                                <h6>Elegir Color</h6>
                                <asp:DropDownList ID="ddlColor" runat="server" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged" AutoPostBack="True" class="form-control">
                                </asp:DropDownList>

                                <br />

                                <h6>Elegir Talle</h6>
                                <asp:DropDownList ID="ddlTalle" runat="server" OnSelectedIndexChanged="ddlTalle_SelectedIndexChanged" AutoPostBack="True" class="form-control">
                                </asp:DropDownList>

                                <asp:Label ID="lblStock" runat="server" Visible="false" CssClass="font-italic"></asp:Label></p>

                                <%--PRECIO--%>
                                <asp:Label ID="lblPrecio" runat="server" Text="Precio: $" Visible="false" Font-Bold="True" Font-Size="Large"></asp:Label>
                                <%--MODIF FIN--%>

                                <%-- MENSAJE DE NO STOCK--%>
                                <asp:Label ID="lblNoStock" runat="server" Visible="false" Text="Producto sin stock" Font-Bold="True" Font-Size="Large"></asp:Label>

                                <%--MENSAJE DE ELEGIR UNA OPCIÓN--%>
                                <asp:Label ID="lblEligeUnaOpcion" runat="server" Visible="false" Text="Elegí talle y color del artículo!" Font-Bold="True" Font-Size="Large"></asp:Label>

                                <br />
                                <br />
                                <asp:DropDownList ID="ddlCant" runat="server" Enabled="false" class="form-control" ></asp:DropDownList>
                                <asp:Button ID="btnAgregarACarrito" class="btn btn-secondary mt-3" runat="server" OnClick="btnAgregarACarrito_Click" Text="Agregar al carrito" />

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="ShopFullGrid.aspx" class="btn btn-light">Volver</a>
        </div>
        <br />
    </div>


        <%--    SUCCESS ALERT--%>
        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">¡Producto agregado al carrito exitosamente!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ¿Deseas seguir comprando?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Si</button>
                    <button type="button" class="btn btn-secondary" onclick="redirectToSales()">Finalizar comrpa</button>
                </div>
            </div>
        </div>
        </div>

    <!-- Bootstrap JS (optional, for carousel functionality) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>




</asp:Content>
