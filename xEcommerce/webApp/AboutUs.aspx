<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="webApp.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        body {
            background-color: #eaeaea;
        }

        .shipping-section {
            padding: 40px 0;
        }

        .work-desk {
            position: relative;
            overflow: hidden;
        }

            .work-desk img {
                transition: transform 0.3s ease, filter 0.3s ease;
            }

            .work-desk:hover img {
                transform: scale(1.05);
                filter: brightness(1.1);
            }

        .img-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .work-desk:hover .img-overlay {
            opacity: 0;
        }

        .section-title h4 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #333;
        }

        .media {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
        }

            .media h6 {
                margin: 0;
            }

        @media (max-width: 767px) {
            .section-title h4 {
                font-size: 1.5rem;
            }
        }
    </style>
    </head>
    <body>

        <div class="container shipping-section">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 order-2 order-md-1 mt-4 pt-2 mt-sm-0">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-6 col-6">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 mt-4 pt-2">
                                    <div class="card work-desk rounded border-0 shadow-lg overflow-hidden">
                                        <img src="https://images.pexels.com/photos/7679862/pexels-photo-7679862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="img-fluid" alt="Clothing 1" />
                                        <div class="img-overlay"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 col-6">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="card work-desk rounded border-0 shadow-lg overflow-hidden">
                                        <img src="https://images.pexels.com/photos/7679868/pexels-photo-7679868.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="img-fluid" alt="Clothing 2" />
                                        <div class="img-overlay"></div>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 mt-4 pt-2">
                                    <div class="card work-desk rounded border-0 shadow-lg overflow-hidden">
                                        <img src="https://images.pexels.com/photos/7679473/pexels-photo-7679473.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="img-fluid" alt="Clothing 3" />
                                        <div class="img-overlay"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-12 order-1 order-md-2">
                    <div class="section-title ml-lg-5">
                        <h5 class="text-custom font-weight-normal mb-3">Sobre Nosotros</h5>
                        <h4 class="title mb-4">Nuestra misión es ofrecerte 
                            <br />
                            lo mejor en moda.
                        </h4>
                        <p class="text-muted mb-0">En nuestra tienda, encontrarás las últimas tendencias en ropa, siempre con la mejor calidad y a los mejores precios. Explora nuestra colección y descubre tu estilo único.</p>

                        <div class="row">
                            <div class="col-lg-6 mt-4 pt-2">
                                <div class="media align-items-center rounded shadow p-3">
                                    <h6 class="ml-3 mb-0 text-dark">Moda Sostenible</h6>
                                </div>
                            </div>
                            <div class="col-lg-6 mt-4 pt-2">
                                <div class="media align-items-center rounded shadow p-3">
                                    <h6 class="ml-3 mb-0 text-dark">Novedades</h6>
                                </div>
                            </div>
                            <div class="col-lg-6 mt-4 pt-2">
                                <div class="media align-items-center rounded shadow p-3">
                                    <h6 class="ml-3 mb-0 text-dark">Profesionales de la moda</h6>
                                </div>
                            </div>
                            <div class="col-lg-6 mt-4 pt-2">
                                <div class="media align-items-center rounded shadow p-3">
                                    <h6 class="ml-3 mb-0 text-dark">Estilo & Diseño</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
