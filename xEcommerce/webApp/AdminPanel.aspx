<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="webApp.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>

.custom-width {
        max-width: 200px; 
        margin-left: -60px; 
}
.h2{
 max-width: 400px; 
 margin-left: -60px; 
}   
    .accordion-button::after {
    filter: invert(1); /* Invertir el color, para pasar de negro a blanco */
}

.accordion-button.collapsed::after {
    filter: invert(0); /* Vuelve a su color original cuando esta colapsado */
}

.list-group-item {
    padding: 0; /* Elimina el padding para que el botón ocupe todo el ancho */
}

.list-group-item a {
    display: block; /* Asegura que el enlace sea un bloque */
    width: 100%; /* Hace que el enlace ocupe todo el ancho */
    text-align: center; /* Centra el texto dentro del botón */
}

</style>

     <div class="container mt-4">
        <h2 class="h2">Admin Panel</h2>

        <!-- Menú Desplegable Vertical con Acordeón -->
        <div class="accordion custom-width" id="adminAccordion">
            <!-- Sección Artículos -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingArticles">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseArticles" aria-expanded="false" aria-controls="collapseArticles">
                        Artículos
                    </button>
                </h2>
                <div id="collapseArticles" class="accordion-collapse collapse" aria-labelledby="headingArticles" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group mb-3">
                            <li class="list-group-item">
                                <asp:Button Text="Ver Articulos" CssClass="btn btn-dark w-100" OnClick="btnViewArticles_Click" ID="btnViewArticles" runat="server" />
                                 <!-- GRID PARA MOSTRAR Los articulos -->
                     <asp:GridView ID="dgvArticles" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                         <Columns>
                             <asp:BoundField DataField="idArt" HeaderText="ID articulo" />
                             <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                             <asp:BoundField DataField="Marca" HeaderText="Marca" />
                             <asp:BoundField DataField="Stock" HeaderText="Stock" />
                         </Columns>
                     </asp:GridView>
                            </li>
                            <li class="list-group-item">
                                <a href="agregarCliente.aspx" class="btn btn-dark w-100">Agregar Artículo</a>
                            </li>
                            <li class="list-group-item">
                                <a href="modificarCliente.aspx" class="btn btn-dark w-100">Modificar Artículo</a>
                            </li>
                            <li class="list-group-item">
                                <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Eliminar Artículo</a>
                            </li>
                        </ul>

                        <!-- Contenedor para las cards de artículos -->
                        <div class="row" id="articlesContainer">
                            <!-- Las cards se generarán aquí desde el code-behind -->
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección Clientes -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingClients">
                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseClients" aria-expanded="true" aria-controls="collapseClients">
                        Clientes
                    </button>
                </h2>
                <div id="collapseClients" class="accordion-collapse collapse" aria-labelledby="headingClients" data-bs-parent="#adminAccordion">
                    <div class="accordion-body">
                        <ul class="list-group">
                                  <li class="list-group-item">
           <asp:Button Text="Ver Clientes" CssClass="btn btn-dark w-100" ID="btnViewClients" runat="server" />
                            <!-- GRID PARA MOSTRAR LOS CLIENTES -->
                        <asp:GridView ID="dgvClients" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="idClient" HeaderText="ID Cliente" />
                                <asp:BoundField DataField="LastName" HeaderText="Apellido" />
                                <asp:BoundField DataField="Name" HeaderText="Nombre" />
                                <asp:BoundField DataField="Dni" HeaderText="DNI" />
                                 <asp:BoundField DataField="Address" HeaderText="Direccion" />
                            </Columns>
                        </asp:GridView>
                               </li>
                            <li class="list-group-item">
                                <a href="modificarCliente.aspx" class="btn btn-dark w-100">Modificar Cliente</a>
                            </li>
                            <li class="list-group-item">
                                <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Eliminar Cliente</a>
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
                                <asp:Button Text="Ver Ventass" CssClass="btn btn-dark w-100" ID="btnViewSell" OnClick="btnViewSell_Click" runat="server" />
                                    <!-- GRID PARA MOSTRAR LAS VENTAS -->
                                    <asp:GridView ID="dgvSell" runat="server" CssClass="table table-bordered mt-4" Visible="false">
                                        <Columns>
                                            <asp:BoundField DataField="VentaID" HeaderText="ID de Venta" />
                                            <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" />
                                        </Columns>
                                    </asp:GridView>
                                </li>
                            <li class="list-group-item">
                                <a href="modificarCliente.aspx" class="btn btn-dark w-100">Canceladas</a>
                            </li>
                            <li class="list-group-item">
                                <a href="eliminarCliente.aspx" class="btn btn-dark w-100">Exitosas</a>
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
                        <!-- ACORDEON para Filtrar por Categoría y Marca -->
                        <div class="accordion" id="filterAccordion">
                            <!-- SECCION CATEGORIA -->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingCategory">
                                 <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCategory" aria-expanded="false" aria-controls="collapseCategory">
                                     Categoría
                                     </button>
                                     </h2>
                                <div id="collapseCategory" class="accordion-collapse collapse" aria-labelledby="headingCategory" data-bs-parent="#filterAccordion">
                                    <div class="accordion-body">
                                          <!-- CHECKLIST CATEGORIA -->
                                        <asp:CheckBoxList ID="CheckBoxListCategories" runat="server" CssClass="list-group">
                                        <asp:ListItem Text="Pantalones" Value="Pantalones"></asp:ListItem>
                                        <asp:ListItem Text="Remeras" Value="Remeras"></asp:ListItem>
                                        <asp:ListItem Text="Buzos" Value="Buzos"></asp:ListItem>
                                        <asp:ListItem Text="Jeans" Value="Jeans"></asp:ListItem>
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
                                        <asp:ListItem Text="Pantalones" Value="Adidas"></asp:ListItem>
                                        <asp:ListItem Text="Remeras" Value="Nike"></asp:ListItem>
                                        <asp:ListItem Text="Buzos" Value="Umbro"></asp:ListItem>
                                        <asp:ListItem Text="Buzos" Value="Puma"></asp:ListItem>
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

     


    </asp:Content>
