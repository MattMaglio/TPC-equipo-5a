<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfreport_stockporarticulo.aspx.cs" Inherits="webApp.wfreport_stockporarticulo" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:TextBox runat="server" ID="txtCodArt" Placeholder="Codigo" CssClass="form-control" />
    <asp:Button ID="btnSearch" runat="server" Text="Buscar" OnClick="btnSearch_Click"/>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="800px"></rsweb:ReportViewer>
</asp:Content>
