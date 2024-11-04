<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container mt-5">
        <div class="row justify-content-center">
            <h1 class="text-start mb-5" style="font-size: 1.5rem;">Sign in</h1>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="text-center d-block mb-3"></asp:Label>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" CssClass="text-center d-block mb-3"></asp:Label>

            <div class="col-md-6" style="padding-left: 65px;">
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblEmailError" runat="server" ForeColor="Red"></asp:Label>

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-check mb-3">
                    <asp:CheckBox runat="server" ID="chkRecordar" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkRecordar">Remember me</label>
                </div>

                <br />


                <div class="d-flex justify-content-between">
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-dark" Text="Sign in" />
                    <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnRegister_Click" Text="Create account" />
                    <asp:Button ID="btnOlvido" runat="server" CssClass="btn btn-link text-muted" Text="Forgot password?" />
                </div>





<br />
<br />
<br />
<br />
            </div>
        </div>
    </div>










</asp:Content>
