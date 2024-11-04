<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyClient.aspx.cs" Inherits="webApp.ModifyClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function showSuccessMessage() {
        $('#successModal').modal('show');
    }

    function redirectToLogin() {
        window.location.href = "Login.aspx"; 
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container mt-5">
        

        <div class="row">
            <div class="col-6" style="padding-left: 65px;">
                <h2>Modify your Information</h2>

                <div class="mb-3">
                    <label for="txtDNI" class="form-label">DNI</label>
                    <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" />
                    <asp:Label ID="LabelDNI" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Your Name</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:Label ID="LabelNombre" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Your Lastname</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                    <asp:Label ID="LabelApellido" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                    <asp:Label ID="LabelEmail" runat="server" ForeColor="Red"></asp:Label>
                </div>
                </div>
            
           
                <div class="col-6" style="padding-left: 65px;">
                    <div class="mb-3">
                        <label for="txtCalle" class="form-label">Your Street's Name</label>
                        <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control" />
                        <asp:Label ID="LabelCalle" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label for="txtNumero" class="form-label">Your House's Number</label>
                        <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
                        <asp:Label ID="LabelNumero" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label for="txtCP" class="form-label">Zip Code</label>
                        <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" />
                        <asp:Label ID="LabelCP" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <%-- CIUDADES --%>

                    <div class="mb-3">
                        <label for="txtCiudad" class="form-label">Choose your city</label>
                        <asp:DropDownList runat="server" ID="ddlCiudades" DataTextField="CityName" DataValueField="CityID" CssClass="form-select">
                        </asp:DropDownList>
                    </div>


                    <%-- PROVINCIAS --%>

                    <div class="mb-3">
                        <label for="txtCiudad" class="form-label">Choose your province</label>
                        <asp:DropDownList runat="server" ID="ddlProvincias" DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="form-select">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn btn-secondary" />
                    <asp:Button runat="server" ID="btnDelete" Text="Delete account" CssClass="btn btn-danger" />

                </div>
            </div>

                <br />
                <br />

        <%--    SUCCESS ALERT--%>

    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Congrats!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Your profile was updated!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="redirectToLogin()">OK</button>
            </div>
        </div>
    </div>
</div>

</asp:Content>
