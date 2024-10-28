<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShopFullGrid.aspx.cs" Inherits="webApp.ShopFullGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">
    <h1 class="text-center">Products</h1>
    <br />
    <br />

    <div class="row mb-4">
        <div class="col-md-4">
            <h5>Filter by Category</h5>
            <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control">

            </asp:DropDownList>
           
        </div>
        <div class="col-md-4">
            <h5>Filter by Brand</h5>
    <asp:DropdownList ID="ddlMarca" runat="server" class="form-control">

 </asp:DropdownList>



        </div>
        <div class="col-md-4">
            <h5>Filter by Product Type</h5>

               <asp:DropdownList ID="ddlTipo" runat="server" class="form-control">

</asp:DropdownList>




           
        </div>
    </div>
    <br />
    <br />

    <div class="row" id="productList">

        <!-- Display of products -->
        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/123" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/160" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/120" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/250" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/200" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/100" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/100" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <img src="https://picsum.photos/100" class="card-img-top" alt="Product Name">
                <div class="card-body">
                    <h5 class="card-title">Product Name</h5>
                    <p class="card-text">Brief description of the product.</p>
                    <p class="card-text"><strong>Price: $xx.xx</strong></p>
                    <a href="ProductDetail.aspx" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-4">
        <a href="#" class="btn btn-light">View More</a>
    </div>
    <br />
    <br />
</div>



</asp:Content>
