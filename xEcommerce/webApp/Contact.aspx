<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="webApp.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        body {
            background-color: #eaeaea;
            font-family: Arial, sans-serif;
        }

        .contact-area {
            background-color: #f9f9f9;
            padding: 40px 0;
        }

       

        .contact-us-form {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin-bottom: 30px;
        }

        .section-heading h3 {
            color: #333;
            margin-bottom: 20px;
        }

        .contact-form p {
            margin: 10px 0 5px;
        }

        .contact-form input[type="text"],
        .contact-form input[type="email"],
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .contact-form input[type="submit"],
        .newsletter-area button {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .contact-form input[type="submit"]:hover,
        .newsletter-area button:hover {
            background-color: #555;
        }

        .newsletter-area {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .newsletter-box input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .subscribing {
            margin-top: 15px;
        }

        .checkbox-title {
            color: #555;
        }

        @media (max-width: 767px) {
            .contact-form input[type="text"],
            .contact-form input[type="email"],
            .contact-form textarea {
                width: 100%;
            }
        }
    </style>


<div class="contact-area">
    
    <div class="form-newsletter-area"> 
        <div class="container">         
            <div class="row adjust-padding">
                <div class="col-md-6 col-xs-12">
                    <div class="contact-us-form">
                        <div class="section-heading">
                            <h3>Formulario de contacto</h3>
                        </div>  
                        <div class="contact-form">
                            <form action="mail.php" method="post">
                                <p>Nombre</p>
                                <asp:TextBox runat="server" ID="txtNombre" placeholder="Nombre" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                                
                                <p>E-mail</p>
                                <asp:TextBox runat="server" ID="txtEmailContacto" placeholder="Tu email" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                                
                                <p>Asunto</p>
                                <asp:TextBox runat="server" ID="txtAsunto" placeholder="Asunto" CssClass="form-control" style="border: none;"></asp:TextBox>
                                
                                <p>Mensaje</p>
                                <asp:TextBox runat="server" ID="txtMensaje" TextMode="MultiLine"></asp:TextBox>
                                <asp:Button Text="Enviar" ID="btnEnviar" OnClick="btnEnviar_Click" CssClass="form-control" runat="server" />
                            </form>
                        </div>
                    </div>    
                </div>    
            </div>    
        </div>
    </div>  
</div>

  


    


</asp:Content>
