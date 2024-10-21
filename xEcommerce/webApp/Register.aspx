<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webApp.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center mb-4">
                <br />
                <h1 style="font-size: 1.5rem;">Ingresá tus datos</h1>
            </div>

            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="col-12 text-center"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" CssClass="col-12 text-center"></asp:Label>
        </div>

        <div class="row">
            <div class="col-6" style="padding-left: 65px;">
                <div class="mb-3">
                    <label for="txtDNI" class="form-label">DNI</label>
                    <asp:TextBox runat="server" ID="dni" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label4" runat="server" ForeColor="Green"></asp:Label>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label6" runat="server" ForeColor="Green"></asp:Label>

                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Apellido</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label8" runat="server" ForeColor="Green"></asp:Label>

                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label10" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <div class="col-6" style="padding-left: 65px;">
                <div class="mb-3">
                    <label for="txtDireccion" class="form-label">Dirección</label>
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label12" runat="server" ForeColor="Green"></asp:Label>

                <div class="mb-3">
                    <label for="txtCiudad" class="form-label">Ciudad</label>
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label14" runat="server" ForeColor="Green"></asp:Label>

                <div class="mb-3">
                    <label for="txtCP" class="form-label">Código Postal</label>
                    <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label16" runat="server" ForeColor="Green"></asp:Label>

                <div class="form-check d-flex align-items-center">
                    <asp:CheckBox runat="server" ID="chkTerminos" CssClass="form-check-input me-2" />
                    <label class="form-check-label" for="chkTerminos">
                        Acepto los términos y condiciones
                    </label>
                </div>
            </div>
        </div>

        <br />
        <br />

        <div class="mb-3 d-flex justify-content-center">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-dark me-3" Text="Registrarme" />
        </div>
        <br />
    </div>
















</asp:Content>
