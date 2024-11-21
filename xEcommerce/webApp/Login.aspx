<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contenedor {
            display: flex;
            gap: 10px; /* Espacio entre los botones */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <h1 class="text-start mb-5" style="font-size: 2rem;">Ingresá a tu cuenta</h1>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="text-center d-block mb-3"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" CssClass="text-center d-block mb-3"></asp:Label>

            <div class="col-md-6" style="padding-left: 65px;">

                <%--USER--%>
                <div class="mb-3">
                    <asp:TextBox runat="server" ID="txtUser" placeholder="Usuario" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label10" runat="server" ForeColor="Green"></asp:Label>

                <%--PASSWORD--%>
                <div class="mb-3">
                    <asp:TextBox runat="server" ID="txtPassword" placeholder="Contraseña" CssClass="form-control" TextMode="Password" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="Green"></asp:Label>

                <%--<div class="form-check mb-3">
                    <asp:CheckBox runat="server" ID="chkRecordar" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkRecordar">Recordar mis datos</label>
                </div>--%>

             


                <div class="contenedor mb-4 d-flex justify-content-center">
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-dark" OnClick="btnLogin_Click" Text="Ingresar" />
                    <%--<asp:Button ID="btnOlvido" runat="server" CssClass="btn btn-link text-muted" Text="Olvidaste la contraseña?" />--%>

               
                    <asp:Button ID="btnCreateUser" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnCreateUser_Click" Text="Crear una cuenta" />
                    <%--<asp:Button ID="btnRegister" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnRegister_Click" Text="CreateAccount Falsa" />--%>
                </div>





                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>










</asp:Content>
