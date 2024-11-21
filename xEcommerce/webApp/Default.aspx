<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webApp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333333;
        }
        .hero {
            background-color: #000000;
            color: #ffffff;
        }
        .featured-products {
            background-color: #f0f0f0;
        }
        .newsletter {
            background-color: #333333;
            color: #ffffff;
        }
        .product-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s;
            background-color: #ffffff; 
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-card img {
            width: 100%;
            height: auto;
        }
        .product-card-body {
            padding: 15px;
        }
    </style>
    <title>Store</title>
</head>
<body>

<section class="hero">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://images.pexels.com/photos/5490198/pexels-photo-5490198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" style="height: 60vh; object-fit: cover;" class="d-block w-100" alt="Hero Image 1" />
            </div>
            <div class="carousel-item">
                <img src="https://images.pexels.com/photos/1884581/pexels-photo-1884581.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" style="height: 60vh; object-fit: cover;"  class ="d-block w-100" alt="Hero Image 2" />
            </div>
            <div class="carousel-item">
                <img src="https://images.pexels.com/photos/5698848/pexels-photo-5698848.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g" style="height: 60vh; object-fit: cover;"  class="d-block w-100" alt="Hero Image 3" />
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="container py-5">
        <h1 class="display-4 fw-bold">Lleva tu estilo al siguiente nivel</h1>
        <p class="lead">Descubre nuestra nueva colección de ropa premium. Diseñada para brindarte comodidad, estilo y confianza..</p>
        <asp:HyperLink ID="lnkShopNow" runat="server" Text="Ver artículos" NavigateUrl="ShopFullGrid.aspx" CssClass="btn btn-light me-2" />
        <asp:HyperLink ID="lnkLearnMore" runat="server" Text="Sobre nosotros" NavigateUrl="AboutUs.aspx" CssClass="btn btn-outline-light" />
    </div>
</section>


    <section class="featured-products py-5">
    <div class="container">
        <h2 class="text-center mb-4">Más vendidos</h2>
       
        <div class="row">
            <asp:Repeater ID="rptFeaturedProducts" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 mb-4">
                        <div class="product-card">
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Name") %>' CssClass="card-img-top" />
                            <div class="product-card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <%--<p class="card-text">$<%# Eval("Price", "{0:F2}") %></p>--%>
                                <asp:Button ID="btnGoToShop" runat="server" Text="Ver más!" OnClick="btnGoToShop_Click" CssClass="btn btn-secondary" />


                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</section>

<%--<section class="newsletter py-5">
    <div class="container text-center">
        <h2>Sé parte de nuestra comunidad</h2>
        <p>Suscribite a nuestro boletín para recibir ofertas exclusivas, consejos de estilo y las últimas novedades.</p>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingresá tu email" />
                    <asp:Button ID="btnSubscribe" runat="server" Text="Suscribirme" CssClass="btn btn-light" />
                </div>
            </div>
        </div>
    </div>
</section>--%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>


    
</asp:Content>
