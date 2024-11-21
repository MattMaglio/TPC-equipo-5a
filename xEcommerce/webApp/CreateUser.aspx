<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="webApp.CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function showSuccessMessage() {
            $('#successModal').modal('show');
        }

        function redirectToLogin() {
            window.location.href = "Login.aspx";
        }

    </script>

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
            <h1 class="text-start mb-5" style="font-size: 2.5rem;">Crea tu cuenta</h1>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="text-center d-block mb-3"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" CssClass="text-center d-block mb-3"></asp:Label>


            <%--USER--%>
            <div class="col-md-6" style="padding-left: 65px;">
                <div class="mb-3">
                    <label for="txtUser" class="form-label">Usuario</label>
                    <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" autocomplete="off" placeholder="Usuario" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblUserNoValido" runat="server" ForeColor="Red"></asp:Label>

                <%--CONTRASEÑA--%>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" autocomplete="off"  placeholder="Contraseña" TextMode="Password" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>

                <div class="mb-3">
                    <label for="txtRepeatPassword" class="form-label">Repetir contraseña</label>
                    <asp:TextBox runat="server" ID="txtConfirmoPassword" CssClass="form-control" placeholder="Repetir contraseña"  TextMode="Password" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblConfirmoPasswordError" runat="server" ForeColor="Red"></asp:Label>

             

                <br />

                <div class="contenedor mb-3 d-flex justify-content-center">
                    <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-outline-secondary" OnCLick="btnRegister_Click" Text="Crear cuenta" />
                    <asp:Button ID="btnCancelRegistrar" runat="server" CssClass="btn btn-secondary" OnClick="btnCancelRegistrar_Click" Text="Cancelar" />
                    <%--<asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-dark" Text="No usar" />--%>
                    
                </div>

                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>


    <%--    SUCCESS ALERT--%>

    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Tu cuenta ya está registrada!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Ingresá en tu cuenta para comenzar
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="redirectToLogin()">OK</button>
            </div>
        </div>
    </div>
    </div>









</asp:Content>
