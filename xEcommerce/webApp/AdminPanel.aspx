<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="webApp.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ></asp:ScriptManager>
<style>

        .custom-width {
            max-width: 200px; 
            margin-left: -40px;
        }
        .h2{
            max-width: 400px; 
            margin-left: -40px; 
        }   
        .accordion-button::after {
            filter: invert(1); /* Invertir el color, para pasar de negro a blanco */
        }
        .accordion-button.collapsed::after {
            filter: invert(0); /* Vuelve a su color original cuando está colapsado */
        }
        .list-group-item {
            padding: 0; /* Elimina el padding para que el botón ocupe todo el ancho */
        }
        .list-group-item a {
            display: block; /* Asegura que el enlace sea un bloque */
            width: 100%; 
            text-align: center; /* Centra el texto dentro del botón */
        }
        .container {
            display: flex; 
            justify-content: space-between; /* Espacia los elementos */
            align-items: flex-start; /* Alinea los elementos al inicio */
        }
        .left-panel {
            width: 50%; /* Panel izquierdo */
        }
        .right-panel {
            width: 300%; /* Panel derecho */
            display: flex;
            justify-content: center; /* Centra horizontalmente el formulario */
            align-items: center; /* Centra verticalmente el formulario */
            padding-left: 20px; /* Espacio entre los paneles */
        }
        .form-container {
            max-width: 400px;
            width: 100%;
          
        }
        .dgviewArticles{
             max-width: 400px;
            width: 100%; 
            margin-left: -100%;
            padding: 0; 
        }


</style>

     <div class="container mt-4">
        <div class="left-panel">
        <h2 class="h2">Admin Panel</h2>

        <!-- Menú Desplegable Vertical con Acordeón -->
        <div class="accordion custom-width" id="adminAccordion">
            <!-- Sección Artículos -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingArticles">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArticles" aria-expanded="false" aria-controls="collapseArticles">
                        Artícles
                    </button>
                </h2>
                <div id="collapseArticles" class="accordion-collapse collapse" aria-labelledby="headingArticles" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group mb-3">
                            <li class="list-group-item">
                                <asp:Button Text="View articles" CssClass="btn btn-dark w-100" OnClick="btnViewArticles_Click" ID="btnViewArticles" runat="server" />
                            </li>
                               <li class="list-group-item">
                                <asp:Button Text="Add Article" CssClass="btn btn-dark w-100" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
                            </li>  
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Seccion users -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingClients">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseClients" aria-expanded="true" aria-controls="collapseClients">
                        Users
                    </button>
                </h2>
                <div id="collapseClients" class="accordion-collapse collapse" aria-labelledby="headingClients" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group">
                                  <li class="list-group-item">
           <asp:Button Text="View users" CssClass="btn btn-dark w-100" ID="btnViewClients" runat="server" />
                            <!-- GRID PARA MOSTRAR LOS  USERS -->
                        <asp:GridView ID="dgvClients" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="IdUser" HeaderText="ID User" />
                                <asp:BoundField DataField="LastName" HeaderText="Apellido" />
                                <asp:BoundField DataField="Name" HeaderText="Nombre" />
                                <asp:BoundField DataField="Dni" HeaderText="DNI" />
                                 <asp:BoundField DataField="Address" HeaderText="Direccion" />
                            </Columns>
                        </asp:GridView>
                               </li>
                            <li class="list-group-item">
                                <a href="UpdateUser.aspx" class="btn btn-dark w-100">Update</a>
                            </li>
                            <li class="list-group-item">
                                <a href="DeleteUser.aspx" class="btn btn-dark w-100">Delete</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Sección Ventas -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSell">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSell" aria-expanded="false" aria-controls="collapseSell">
                        Sales
                    </button>
                </h2>
                <div id="collapseSell" class="accordion-collapse collapse" aria-labelledby="headingSell" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group">
                               <li class="list-group-item">
                                <asp:Button Text="View sales" CssClass="btn btn-dark w-100" ID="btnViewSell" OnClick="btnViewSell_Click" runat="server" />
                                    <!-- GRID PARA MOSTRAR LAS VENTAS -->
                                    <asp:GridView ID="dgvSell" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                                <Columns>
                                    <asp:BoundField DataField="SellID" HeaderText="ID Sell" />
                                    <asp:BoundField DataField="User" HeaderText="User" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" />
                                    <asp:BoundField DataField="Total" HeaderText="Total" />
                                   <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Image ID="imgStatus" runat="server" Width="20" Height="20" ImageUrl='<%# GetStatusIcon(Eval("Status")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                                </li>
                            <li class="list-group-item">
                                <a href="modificarCliente.aspx" class="btn btn-dark w-100">Canceled</a>
                            </li>
                            <li class="list-group-item">
                                <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Successful</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

                              <!-- Sección Promociones -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingPromotions">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePromotions" aria-expanded="false" aria-controls="collapsePromotions">
                        Add Promotions
                    </button>
                </h2>
                <div id="collapsePromotions" class="accordion-collapse collapse" aria-labelledby="headingPromotions" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <asp:Button Text="2 x 1" CssClass="btn btn-dark w-100" ID="btnTwoForOne" OnClick="btnTwoForOne_Click" runat="server"/>
                            </li>
                            <li class="list-group-item">
                                <asp:Button Text="10% off" CssClass="btn btn-dark w-100" ID="btnTenPercentOff" runat="server" OnClick="btnTenPercentOff_Click"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Sección Buscar -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSearch">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSearch" aria-expanded="false" aria-controls="collapseSearch">
                        Search
                    </button>
                </h2>
                <div id="collapseSearch" class="accordion-collapse collapse" aria-labelledby="headingSearch" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <!-- ACORDEON para Filtrar por Categoría y Marca -->
                        <div class="accordion" id="filterAccordion">
                            <!-- SECCION CATEGORIA -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingCategory">
                                 <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCategory" aria-expanded="false" aria-controls="collapseCategory">
                                     Category
                                     </button>
                                     </h2>
                                <div id="collapseCategory" class="accordion-collapse collapse" aria-labelledby="headingCategory" data-bs-parent="#filterAccordion">
                                    <div class="accordion-body">
                                          <!-- CHECKLIST CATEGORIA -->
                                        <asp:CheckBoxList ID="CheckBoxListCategories" runat="server" CssClass="list-group">
                                        <asp:ListItem Text="Pants" Value="Pants"></asp:ListItem>
                                        <asp:ListItem Text="T-shirt" Value="T-shirt"></asp:ListItem>
                                        <asp:ListItem Text="Sweatshirt" Value="Sweatshirt"></asp:ListItem>
                                        <asp:ListItem Text="Jeans" Value="Jeans"></asp:ListItem>
                                    </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>

                            <!-- Sección Marca -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingBrand">
                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBrand" aria-expanded="false" aria-controls="collapseBrand">
                                        Brand
                                    </button>
                                </h2>
                                <div id="collapseBrand" class="accordion-collapse collapse" aria-labelledby="headingBrand" data-bs-parent="#filterAccordion">
                                    <div class="accordion-body">
                                           <!-- CHECKLIST MARCA -->
                                        <asp:CheckBoxList ID="CheckBoxListMarca" runat="server" CssClass="list-group">
                                        <asp:ListItem Text="Adidas" Value="Adidas"></asp:ListItem>
                                        <asp:ListItem Text="Nike" Value="Nike"></asp:ListItem>
                                        <asp:ListItem Text="Umbro" Value="Umbro"></asp:ListItem>
                                        <asp:ListItem Text="Puma" Value="Puma"></asp:ListItem>
                                    </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
     <div class="right-panel">
            <div class="form-container">
                <div class="mt-3" runat="server" id="addArticleForm" Visible="false">
                    <h4>Add New Article</h4>
                    <asp:TextBox runat="server" ID="txtIdArticle"  Placeholder="ID" CssClass="form-control"  />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                    <asp:DropDownList ID="ddListBrand" runat="server" CssClass="form-control">
                    
                        <asp:ListItem Text="Select Brand" Value=""></asp:ListItem>
                        <asp:ListItem Text="Adidas" Value="Adidas"></asp:ListItem>
                        <asp:ListItem Text="Nike" Value="Nike"></asp:ListItem>
                        <asp:ListItem Text="Umbro" Value="Umbro"></asp:ListItem>
                        <asp:ListItem Text="Puma" Value="Puma"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" Placeholder="Size"></asp:TextBox>
                    <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Placeholder="Stock" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Price" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" Placeholder="Color"></asp:TextBox>
                    <asp:DropDownList ID="ddListType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Type" Value=""></asp:ListItem>
                        <asp:ListItem Text="Pants" Value="Pants"></asp:ListItem>
                        <asp:ListItem Text="T-shirt" Value="T-shirt"></asp:ListItem>
                        <asp:ListItem Text="Sweatshirt" Value="Sweatshirt"></asp:ListItem>
                        <asp:ListItem Text="Jeans" Value="Jeans"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:UpdatePanel runat="server">
             <ContentTemplate>
                    <asp:TextBox ID="txtImageUrl" runat="server" OnTextChanged="txtImageUrl_TextChanged" CssClass="form-control mt-3" Placeholder="Pega aquí la URL de la imagen"></asp:TextBox>
                    <asp:FileUpload ID="fileUploadImg" runat="server" CssClass="form-control mt-3" />
                 <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary mt-3" Text="Upload Image" />
                  <asp:Image ID="imgPreview" ImageUrl="https://img.freepik.com/foto-gratis/icono-imagen-lado-frontal_187299-39480.jpg?semt=ais_hybrid" runat="server" CssClass="img-thumbnail mt-3" Width="28%" />
             </ContentTemplate>
         </asp:UpdatePanel>
                    <asp:Button ID="btnSaveArticle" runat="server" CssClass="btn btn-success mt-3" OnClick="btnSaveArticle_Click" Text="Save Article" />
                </div>
            </div>
         <div class="dgviewArticles">
                           <!-- GRID PARA MOSTRAR Los articulos -->
                    <asp:GridView ID="dgvArticles" OnRowCommand="dgvArticles_RowCommand" runat="server" CssClass="table table-bordered mt-4" Visible="false" AutoGenerateColumns="False">
                     <Columns>
                         <asp:BoundField DataField="Id" HeaderText="ID Article " />
                         <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                         <asp:BoundField DataField="Categoria.Descripcion" HeaderText="Category" />
                         <asp:BoundField DataField="Marca.Descripcion" HeaderText="Brand" />
                         <asp:BoundField DataField="Tipo.Descripcion" HeaderText="Tipo" />
                         <asp:BoundField DataField="Stock" HeaderText="Stock" />
                         <asp:BoundField DataField="Precio" HeaderText="Price" />
                        <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Button Text="Ver imágenes" CssClass="btn btn-primary" CommandName="ShowImages" CommandArgument='<%# Eval("Id") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="Update">
                         <ItemTemplate>
                         <asp:Button Text="Update" CssClass="btn btn-warning" CommandName="Update" CommandArgument='<%# Eval("Id") %>' runat="server" />
                         </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Delete">
                         <ItemTemplate>
                         <asp:Button Text="Delete" CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' runat="server" />
                         </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
        </div>
         </div>
    </div>
    </asp:Content>

         
   





