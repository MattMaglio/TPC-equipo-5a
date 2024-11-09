<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="webApp.CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .contenedor {
            display: flex;
            gap: 10px; 
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <h1 class="text-start mb-5" style="font-size: 2.5rem;">Crear cuenta</h1>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="text-center d-block mb-3"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" CssClass="text-center d-block mb-3"></asp:Label>

            <div class="col-md-6" style="padding-left: 65px;">
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblEmailError" runat="server" ForeColor="Red"></asp:Label>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>

                <div class="mb-3">
                    <label for="txtRepeatPassword" class="form-label">Repetir contraseña</label>
                    <asp:TextBox runat="server" ID="txtRepeatPassword" CssClass="form-control" TextMode="Password" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                <%-- <div class="form-check mb-3">
                    <asp:CheckBox runat="server" ID="chkRecordar" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkRecordar">Recordar mis datos</label>
                </div>--%>

                <br />

                <div class="contenedor mb-3 d-flex justify-content-center">
                    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-dark" Text="Registrar" />
                    <asp:Button ID="btnCancelRegistrar" runat="server" CssClass="btn btn-secondary" OnClick="btnCancelRegistrar_Click" Text="Cancelar" />
                    <%-- <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnRegister_Click" Text="Create account" />--%>
                    <%--                    <asp:Button ID="btnOlvido" runat="server" CssClass="btn btn-link text-muted" Text="Olvidaste la contraseña?" />--%>
                </div>

                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>











</asp:Content>
