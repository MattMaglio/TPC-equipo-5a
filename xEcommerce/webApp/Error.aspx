<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="webApp.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

        <h1>Hubo un problemo</h1>
        <asp:Label ID="lblMensaje" runat="server" Text="Label"></asp:Label>

        <asp:Button ID="btnError" runat="server" Text="Intente ingresar nuevamente" OnClick="btnError_Click"/>
        <asp:Button ID="btnErrorCancelar" runat="server" Text="Cancelar" OnClick="btnErrorCancelar_Click" />

    </div>
</asp:Content>
