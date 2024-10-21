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
</style>

<div class="container mt-5">
    <h1 class="text-center">Product Details</h1>
    <br />

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card decorative-border">
                <div class="row no-gutters">
                    <div class="col-md-6">
                        <div id="productCarousel" class="carousel slide h-100" data-ride="carousel">
                            <div class="carousel-inner h-100">
                                <div class="carousel-item active h-100">
                                    <img src="https://picsum.photos/600/400?1" class="d-block w-100 h-100" alt="Product Image 1">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="https://picsum.photos/600/400?2" class="d-block w-100 h-100" alt="Product Image 2">
                                </div>
                                <div class="carousel-item h-100">
                                    <img src="https://picsum.photos/600/400?3" class="d-block w-100 h-100" alt="Product Image 3">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <div class="card-body">
                            <h2 class="card-title">Product Name</h2>
                            <p class="lead"><strong>Price: $xx.xx</strong></p>
                            <p><strong>Brand:</strong> Brand Name</p>
                            <p><strong>Category:</strong> Category Name</p>
                            <p><strong>Type:</strong> Product Type</p>
                            <br />
                            <h5>Description:</h5>
                            <p>Detailed description of the product. Include all features, materials, and any other relevant information to help customers make an informed decision.</p>
                            <br />
                            <a href="#" class="btn btn-light">Add to Cart</a>
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
    <br />
</div>

<!-- Bootstrap JS (optional, for carousel functionality) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>




</asp:Content>
