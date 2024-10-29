<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="webApp.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ></asp:ScriptManager>
<style>
    /* Ajustes generales */
    .container {
        display: flex;
        flex-wrap: wrap; /* SE ENVUELEN SI NO HAY SUFICIENTE ESPACIO */
        justify-content: space-between;
        padding: 10px;
    }

    .left-panel, .right-panel {
        padding: 10px;
    }

    /* AJUSTE DEL TAMAÑO DEL PANEL IZQUIERDO */
    .left-panel {
        width: 100%; 
        max-width: 300px; 
    }

    .right-panel {
        width: 100%; /* Ocupa EL 100% DE PANTALLAS CHICAS */
        max-width: 700px; /* MAX PARA PANTALLAS GRANDES */
        margin-top: 20px;
    }

    /* Flexibilidad en los formularios y grids */
    .form-article{
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        padding: 10px;
        margin-top: -30px;
    }
    .dgviewArticles{
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        padding: 0;
        display: flex;
        justify-content: center; /* Centra horizontalmente */
        align-items: center;     /* Centra verticalmente */
        height: 100vh; 
        margin-top: -150px;
    }

    /* RESPONSIVE CON MEDIA QUERYS */
    @media (min-width: 768px) {
        .container {
            flex-direction: row; /* Alinea los paneles en fila para pantallas grandes */
        }

        .left-panel {
            width: 30%; /* Ajusta el ancho de los paneles para pantallas grandes */
        }

        .right-panel {
            width: 65%; /* Ajusta el ancho del panel derecho en pantallas grandes */
        }
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column; /* Apila los paneles en pantallas pequeñas */
        }

        .left-panel, .right-panel {
            width: 100%; /* Ancho completo en pantallas pequeñas */
        }
    }

    /* AJUSTES BOTONES Y ACORDEON */
    .accordion-button::after {
        filter: invert(1);
    }

    .accordion-button.collapsed::after {
        filter: invert(0);
    }

    .list-group-item {
        padding: 0;
    }

    .list-group-item a {
        display: block;
        text-align: center;
    }

    .bn5 {
  padding: 0.6em 2em;
  border: none;
  outline: none;
  color: rgb(255, 255, 255);
  background: #111;
  cursor: pointer;
  position: relative;
  z-index: 0;
  border-radius: 10px;
}

.bn5:before {
  content: "";
  background: linear-gradient(
    45deg,
    #ff0000,
    #ff7300,
    #fffb00,
    #48ff00,
    #00ffd5,
    #002bff,
    #7a00ff,
    #ff00c8,
    #ff0000
  );
  position: absolute;
  top: -2px;
  left: -2px;
  background-size: 400%;
  z-index: -1;
  filter: blur(5px);
  width: calc(100% + 4px);
  height: calc(100% + 4px);
  animation: glowingbn5 20s linear infinite;
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  border-radius: 10px;
}

@keyframes glowingbn5 {
  0% {
    background-position: 0 0;
  }
  50% {
    background-position: 400% 0;
  }
  100% {
    background-position: 0 0;
  }
}

.bn5:active {
  color: #000;
}

.bn5:active:after {
  background: transparent;
}

.bn5:hover:before {
  opacity: 1;
}

.bn5:after {
  z-index: -1;
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: #191919;
  left: 0;
  top: 0;
  border-radius: 10px;
}

</style>


     <div class="container mt-4">
        <div class="left-panel">
        <h2 class="h2">Admin Panel</h2>

        <!--MENU DESPEGABLE CON ACORDEON -->
        <div class="accordion custom-width" id="adminAccordion">
            <!--SECCION ARTICULOS -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingArticles">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArticles" aria-expanded="false" aria-controls="collapseArticles">
                        Articulos
                    </button>
                </h2>
                <div id="collapseArticles" class="accordion-collapse collapse" aria-labelledby="headingArticles" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group mb-3">
                            <li class="list-group-item">
                                <asp:Button Text="Ver articulos" CssClass="btn btn-dark w-100" OnClick="btnViewArticles_Click" ID="btnViewArticles" runat="server" />
                            </li>
                               <li class="list-group-item">
                                <asp:Button Text="Agregar articulo" CssClass="btn btn-dark w-100" ID="btnAddArticle" OnClick="btnAddArticle_Click" runat="server" />
                            </li>  
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SECCION USUARIOS -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingClients">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseClients" aria-expanded="true" aria-controls="collapseClients">
                       Usuarios
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
                                <asp:BoundField DataField="IdUser" HeaderText="ID Usuario" />
                                <asp:BoundField DataField="LastName" HeaderText="Apellido" />
                                <asp:BoundField DataField="Name" HeaderText="Nombre" />
                                <asp:BoundField DataField="Dni" HeaderText="DNI" />
                                 <asp:BoundField DataField="Address" HeaderText="Direccion" />
                            </Columns>
                        </asp:GridView>
                               </li>
                            <li class="list-group-item">
                                <a href="UpdateUser.aspx" class="btn btn-dark w-100">Modificar</a>
                            </li>
                            <li class="list-group-item">
                                <a href="DeleteUser.aspx" class="btn btn-dark w-100">Eliminar</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Sección Ventas -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSell">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSell" aria-expanded="false" aria-controls="collapseSell">
                        Ventas
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
                                    <asp:BoundField DataField="SellID" HeaderText="ID Venta" />
                                    <asp:BoundField DataField="User" HeaderText="Usuario" />
                                    <asp:BoundField DataField="Date" HeaderText="Fecha" />
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
                                <a href="modificarCliente.aspx" class="btn btn-dark w-100">Cancelados</a>
                            </li>
                            <li class="list-group-item">
                                <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Exitosos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

                            <!-- Sección Promociones -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingReports">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseReports" aria-expanded="false" aria-controls="collapseReports">
                        Listados
                    </button>
                </h2>
                <div id="collapseReports" class="accordion-collapse collapse" aria-labelledby="headingReports" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <asp:Button Text="Listado de prueba" CssClass="btn btn-dark w-100" ID="btnReportPrueba" OnClick="btnReportPrueba_Click" runat="server"/>
                            </li>
                            <li class="list-group-item">
                                <asp:Button Text="Listado de Stock" CssClass="btn btn-dark w-100" ID="btnReportStock" runat="server" OnClick="btnReportStock_Click"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Sección Buscar -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSearch">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSearch" aria-expanded="false" aria-controls="collapseSearch">
                        Buscar
                    </button>
                </h2>
                <div id="collapseSearch" class="accordion-collapse collapse" aria-labelledby="headingSearch" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <!-- ACORDEON para Filtrar POR CAT Y MARCA-->
                        <div class="accordion" id="filterAccordion">
                            <!-- SECCION CATEGORIA -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingCategory">
                                 <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCategory" aria-expanded="false" aria-controls="collapseCategory">
                                    Categoria
                                     </button>
                                     </h2>
                                <div id="collapseCategory" class="accordion-collapse collapse" aria-labelledby="headingCategory" data-bs-parent="#filterAccordion">
                                    <div class="accordion-body">
                                          <!-- CHECKLIST CATEGORIA -->
                                        <asp:CheckBoxList ID="CheckBoxListCategories" runat="server" CssClass="list-group">
                                        <asp:ListItem Text="Formal" Value="Formal"></asp:ListItem>
                                        <asp:ListItem Text="Deportiva" Value="Deportiva"></asp:ListItem>
                                        <asp:ListItem Text="Casual" Value="Casual"></asp:ListItem>
                                        <asp:ListItem Text="Acessorios" Value="Accesorios"></asp:ListItem>
                                    </asp:CheckBoxList>
                                    </div>
                                </div>
                            </div>

                            <!-- Sección Marca -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingBrand">
                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBrand" aria-expanded="false" aria-controls="collapseBrand">
                                        Marca
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
            <div class="form-article">
                <div class="mt-3" runat="server" id="addArticleForm" Visible="false">
                    <h4>Agregar nuevo articulo</h4>
                    <asp:TextBox runat="server" ID="txtCodeArticle"  Placeholder="Codigo" CssClass="form-control"  />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Placeholder="Descripcion"></asp:TextBox>
                     <!-- DROP DOWN LIST MARCAS -->
                    <asp:DropDownList ID="ddListBrand" runat="server" CssClass="form-control"> 
 
                    </asp:DropDownList>
                         <!-- DROP DOWN LIST TALLES -->
                    <asp:DropDownList runat="server" ID="ddListSize" CssClass="form-control">
                       
                    </asp:DropDownList>
                         <!-- DROP DOWN LIST COLORES -->
                    <asp:DropDownList runat="server" ID="ddListColors" CssClass="form-control">
                      
                    </asp:DropDownList>        
                     <!-- DROP DOWN LIST TIPOS -->
                    <asp:DropDownList ID="ddListType" runat="server" CssClass="form-control">
                      
                    </asp:DropDownList>
                     <!-- DROP DOWN LIST CATEGORIA -->
                <asp:DropDownList ID="ddListCategory" runat="server" CssClass="form-control">
                 
                </asp:DropDownList>
                    <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Placeholder="Stock" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Precio" TextMode="Number"></asp:TextBox>
                    <asp:UpdatePanel runat="server">
             <ContentTemplate>
                    <asp:TextBox ID="txtUrlImage1" runat="server" CssClass="form-control mt-3" Placeholder="URL de la imagen 1"></asp:TextBox>
                    <asp:FileUpload ID="fileImg1" runat="server" CssClass="form-control mt-3" />
                    <asp:Image ID="Image2" ImageUrl="https://img.freepik.com/foto-gratis/icono-imagen-lado-frontal_187299-39480.jpg?semt=ais_hybrid" runat="server" CssClass="img-thumbnail mt-3" Width="10%" />
                   
                 <asp:TextBox ID="txtImageUrl2" runat="server" CssClass="form-control mt-3" Placeholder="URL de la imagen 2"></asp:TextBox>
                    <asp:FileUpload ID="fileImg2" runat="server" CssClass="form-control mt-3" />
                    <asp:Image ID="Image1" ImageUrl="https://img.freepik.com/foto-gratis/icono-imagen-lado-frontal_187299-39480.jpg?semt=ais_hybrid" runat="server" CssClass="img-thumbnail mt-3" Width="10%" />
                 
                 <asp:TextBox ID="txtImageUrl3" runat="server" CssClass="form-control mt-3" Placeholder="URL de la imagen 3"></asp:TextBox>
                   <asp:FileUpload ID="fileImg3" runat="server" CssClass="form-control mt-3" />
                 <asp:Image ID="imgPreview" ImageUrl="https://img.freepik.com/foto-gratis/icono-imagen-lado-frontal_187299-39480.jpg?semt=ais_hybrid" runat="server" CssClass="img-thumbnail mt-3" Width="10%" />
             </ContentTemplate>
         </asp:UpdatePanel>
                    <asp:Button ID="btnSaveArticle" runat="server" CssClass="bn5" OnClick="btnSaveArticle_Click" Text="Guardar articulo" />
                    <a type="button" class="bn5" href="AdminPanel.aspx">Cancelar</a>
                   
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

         
   





