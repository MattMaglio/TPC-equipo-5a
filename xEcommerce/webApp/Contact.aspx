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
                            <h3>Contact Form</h3>
                        </div>  
                        <div class="contact-form">
                            <form action="mail.php" method="post">
                                <p>Name</p>
                                <asp:TextBox runat="server" ID="TextBox2" placeholder="Type your name here" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                                
                                <p>E-mail</p>
                                <asp:TextBox runat="server" ID="TextBox1" placeholder="Type your E-mail address" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                                
                                <p>Message</p>
                                <textarea id="message" rows="4" name="message" required></textarea>
                                
                                <input type="submit" value="Send">
                            </form>
                        </div>
                    </div>    
                </div>    

                <div class="col-md-6 col-xs-12">
                    <div class="newsletter-area">
                        <div class="section-heading">
                            <h3>Newsletters</h3>
                        </div>
                        <div class="newsletter-box">
                            <form action="#">
                                <asp:TextBox runat="server" ID="txtEmail" placeholder="Type your E-mail address" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />

                                <button type="submit">Subscribe Now</button>
                            </form>
                            <div class="subscribing">
                                <label class="checkbox-title">
                                    <input type="checkbox" name="subscribe" value="bank" id="transfer"> By subscribing to our newsletter you agree to receive emails from us. 
                                </label>
                            </div>
                        </div>
                    </div>                                
                </div>
            </div>    
        </div>
    </div>  
</div>




    


</asp:Content>
