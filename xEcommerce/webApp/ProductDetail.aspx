<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="webApp.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
      <style>
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

        .font-italic {
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
        <h1 class="text-center">Product Details</h1>
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
                                <p class="font-weight-bold"><strong>Brand:</strong>
                                    <asp:Label ID="lblBrand" runat="server" CssClass="font-italic"></asp:Label></p>
                                <p class="font-weight-bold"><strong>Category:</strong>
                                    <asp:Label ID="lblCategory" runat="server" CssClass="font-italic"></asp:Label></p>
                                <p class="font-weight-bold"><strong>Type:</strong>
                                    <asp:Label ID="lblType" runat="server" CssClass="font-italic"></asp:Label></p>
                                <h5 class="mt-3 font-weight-bold">Description:</h5>
                                <asp:Label ID="lblDescription" runat="server" CssClass="text-muted"></asp:Label>
                                <br />
                                <br />
                                <h6>Elegir Color</h6>
                                <asp:DropDownList ID="ddlColor" runat="server" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged" AutoPostBack="True" class="form-control"></asp:DropDownList>
                                <br />
                                <h6>Elegir Talle</h6>
                                <asp:DropDownList ID="ddlTalle" runat="server" OnSelectedIndexChanged="ddlTalle_SelectedIndexChanged" AutoPostBack="True" class="form-control"></asp:DropDownList>
                                <br />
                                <br />

                                <%--PRECIO--%>
                                <asp:Label ID="lblPrecio" runat="server" Text="Precio: $" Font-Bold="True" Font-Size="Large"></asp:Label>
                                <%--MODIF FIN--%>
                                
                                <br />
                                <br />
                                <a href="#" class="btn btn-secondary mt-3">Add to Cart</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="ShopFullGrid.aspx" class="btn btn-light">Back to Product List</a>
        </div>
        <br />
    </div>


    <!-- Bootstrap JS (optional, for carousel functionality) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>




</asp:Content>
