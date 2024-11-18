<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShopFullGrid.aspx.cs" Inherits="webApp.ShopFullGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

 


    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <h1 class="text-center">Conocé nuestros artículos</h1>
        <br />
        <br />


      <div class="row mb-4">
    <div class="col-md-3">
        <h5>Categoría</h5>
        <asp:DropDownList ID="ddlCategoria" runat="server" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" class="form-control">
        </asp:DropDownList>
    </div>

    <div class="col-md-3">
        <h5>Marca</h5>
        <asp:DropDownList ID="ddlMarca" runat="server" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" class="form-control">
        </asp:DropDownList>
    </div>

    <div class="col-md-3">
        <h5>Tipo de artículo</h5>
        <asp:DropDownList ID="ddlTipo" runat="server" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" class="form-control">
        </asp:DropDownList>
    </div>

    <div class="col-md-3 text-end">
        
      <h5 style="color:white">letras en blanco</h5>
        <asp:Button ID="btnMostrarTodos" runat="server" Text="Mostrar Todos" OnClick="btnMostrarTodos_Click" CssClass="btn btn-secondary" />
    </div>
</div>


       
        <br />

       
        <div class="row" id="productList">


            <asp:ListView ID="lvProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-6 col-md-3 mb-4">
                        <div class="card h-100">
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Name") %>' CssClass="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="card-text"><%# Eval("Detalle") %></p>
                                <%--         <p class="card-text"><strong>Precio: $<%# Eval("Price", "{0:F2}") %></strong></p>--%>
                                <p class="card-text">Categoría: <%# Eval("CategoriaDescripcion") %></p>
                                <p class="card-text">Marca: <%# Eval("MarcaDescripcion") %></p>
                                <p class="card-text">Tipo: <%# Eval("TipoDescripcion") %></p>
                                <a href="ProductDetail.aspx?ProductId=<%# Eval("ProductId") %>" class="btn btn-secondary"></h6></h6>Ver detalles</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>


        </div>

        <%--<div class="text-center mt-4">
            <a href="#" class="btn btn-light">View More</a>
        </div>
        <br />
        <br />
    </div>--%>

</asp:Content>



























































<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShopFullGrid.aspx.cs" Inherits="webApp.ShopFullGrid" %>

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

    

        <!-- Display of products -->
        

            <asp:Repeater ID="rptFeaturedProducts" runat="server">
    <ItemTemplate>
        <div class="col-sm-6 col-md-3 mb-4">
            <div class="card h-100">
                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Name") %>' CssClass="card-img-top" />
                <div class="card-body">
                    <h5 class="card-title"><%# Eval("Name") %></h5>
                    <p class="card-text">Brief description: <%# Eval("Detalle") %></p>
                    <p class="card-text"><strong>Price: $<%# Eval("Price", "{0:F2}") %></strong></p>
                    <a href="ProductDetail.aspx?ProductId=<%# Eval("ProductId") %>" class="btn btn-light">View Details</a>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>







           <%-- <div class="card h-100">
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
    </div>--%>

<%--<div class="text-center mt-4">
        <a href="#" class="btn btn-light">View More</a>
    </div>
    <br />
    <br />
</div>--%>




