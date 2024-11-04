<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webApp.Register" %>

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
            <div class="col-12 text-center mb-4">
                <br />
                <h1 style="font-size: 1.5rem;">Create account</h1>
            </div>

        </div>

        <div class="row">
            <div class="col-6" style="padding-left: 65px;">

                <%--dni--%>
                <div class="mb-3">
                    <label for="txtDNI" class="form-label">DNI</label>
                    <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label4" runat="server" ForeColor="Green"></asp:Label>


                <%--NOMBRE--%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Your name</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label6" runat="server" ForeColor="Green"></asp:Label>


                <%-- APELLIDO --%>
                <div class="mb-3">
                    <label for="txtApellido" class="form-label">Your last name</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label8" runat="server" ForeColor="Green"></asp:Label>


                <%-- EMAIL --%>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label10" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <div class="col-6" style="padding-left: 65px;">

                <%-- CALLE --%>
                <div class="mb-3">
                    <label for="txtCalle" class="form-label">Your street´s name</label>
                    <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label12" runat="server" ForeColor="Green"></asp:Label>

                <%-- NUMERo --%>
                <div class="mb-3">
                    <label for="txtNumero" class="form-label">Your house´s number</label>
                    <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label2" runat="server" ForeColor="Green"></asp:Label>


            
                <%-- CODIGO POSTAL --%>
                <div class="mb-3">
                    <label for="txtCP" class="form-label">Zip code</label>
                    <asp:TextBox runat="server" ID="txtCP" CssClass="form-control" Style="border: none; border-bottom: 1px solid #ccc; background: transparent; height: auto;" />
                </div>
                <asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="Label16" runat="server" ForeColor="Green"></asp:Label>


                <%-- CIUDADES --%>

                <div class="mb-3">
                    <label for="txtCiudad" class="form-label">Choose your city</label>
                    <asp:DropDownList runat="server" ID="ddlCiudades" DataTextField="CityName" DataValueField="CityID"  CssClass ="form-select" >
                    
                    </asp:DropDownList>
                </div>

             
             


                <%-- PROVINCIAS --%>

                <div class="mb-3">
                    <label for="txtCiudad" class="form-label">Choose your province</label>
                    <asp:DropDownList runat="server" ID="ddlProvincias" DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="form-select">
                        
                    </asp:DropDownList>
                </div>





                <%-- TERMINOS Y CONDICIONES --%>
                <div class="form-check d-flex align-items-center">
                    <asp:CheckBox runat="server" ID="chkTerms" CssClass="form-check-input me-2" />
                    <label for="chkTerms" class="form-check-label" for="chkTerminos">
                        I accept the terms and conditions
                    </label>
                </div>
                <asp:Label ID="LabelTerms" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>

        <br />
        <br />



        <%-- BOTONES ACEPTAR / CANCELAR --%>
        <div class="mb-3 d-flex justify-content-center">
            <asp:Button ID="btnCreateAccount" runat="server" CssClass="btn btn-dark me-3" OnClick="btnCreateAccount_Click" Text="Create" />

            <asp:Button ID="btnCancelAccount" runat="server" CssClass="btn btn-secondary me-3" OnClick="btnCancelAccount_Click" Text="Cancel" />
        </div>


        <br />
    </div>

<%--    SUCCESS ALERT--%>

    <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Welcome Aboard!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                You're Now Registered!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="redirectToLogin()">OK</button>
            </div>
        </div>
    </div>
</div>














</asp:Content>
