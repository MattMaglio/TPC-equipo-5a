-- Procedures Generales
USE XECOMMERCE;
GO

CREATE PROCEDURE Catalogo.BuscarArticulos @cod_articulo VARCHAR(10) AS
SELECT Id,
    Codigo,
    IdTipo,
    IdMarca,
    IdCategoria,
    Descripcion,
    Estado
FROM Catalogo.Articulos
WHERE Codigo = @cod_articulo
;
GO

CREATE PROCEDURE Catalogo.ListarArticulos AS
SELECT Id,
    Codigo,
    IdTipo,
    IdMarca,
    IdCategoria,
    Descripcion,
    Estado
FROM Catalogo.Articulos
;
GO

CREATE PROCEDURE Catalogo.BuscarCategorias @cod_categoria VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Categorias
WHERE Codigo = @cod_categoria
;
GO

CREATE PROCEDURE Catalogo.ListarCategorias AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Categorias
;
GO

CREATE PROCEDURE Catalogo.BuscarMarcas @cod_marca VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
WHERE Codigo = @cod_marca
;
GO

CREATE PROCEDURE Catalogo.ListarMarcas AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
;
GO

CREATE PROCEDURE Catalogo.BuscarTipos @cod_tipo VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
WHERE Codigo = @cod_tipo
;
GO

CREATE PROCEDURE Catalogo.ListarTipos AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Tipos
;
GO

CREATE PROCEDURE Catalogo.BuscarColores @cod_color VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores
WHERE Codigo = @cod_color
;
GO

CREATE PROCEDURE Catalogo.ListarColores AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores
;
GO

CREATE PROCEDURE Catalogo.BuscarTalles @cod_talle VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Talles
WHERE Codigo = @cod_talle
;
GO

CREATE PROCEDURE Catalogo.ListarTalles AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Talles
;
GO

CREATE PROCEDURE Catalogo.BuscarClientes @dni VARCHAR(10) AS
SELECT Id,
    DNI,
    Nombre,
    Apellido,
    Email,
    Estado
FROM Catalogo.Clientes
WHERE DNI = @dni
;
GO

CREATE PROCEDURE Catalogo.ListarClientes AS
SELECT Id,
    DNI,
    Nombre,
    Apellido,
    Email,
    Estado
FROM Catalogo.Clientes
;
GO

CREATE PROCEDURE Catalogo.BuscarCiudades @cod_ciudad VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
WHERE Codigo = @cod_ciudad
;
GO

CREATE PROCEDURE Catalogo.ListarCiudades AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
;
GO

CREATE PROCEDURE Catalogo.BuscarProvincia @cod_provincia VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
WHERE Codigo = @cod_provincia
;
GO

CREATE PROCEDURE Catalogo.ListarProvincia AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
;
GO

CREATE PROCEDURE Catalogo.BuscarDirecciones @id_cliente VARCHAR(10) AS
SELECT Id,
    IdCliente,
    Calle,
    Numero,
    CodigoPostal,
    IdCiudad,
    IdProvincia,
    Estado
FROM Catalogo.Direcciones
WHERE IdCliente = @id_cliente
;
GO

CREATE PROCEDURE Catalogo.ListarDirecciones AS
SELECT Id,
    IdCliente,
    Calle,
    Numero,
    CodigoPostal,
    IdCiudad,
    IdProvincia,
    Estado
FROM Catalogo.Direcciones
;
GO

CREATE PROCEDURE Catalogo.BuscarMedioPago @cod_mdp VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    IdEntidadFinanciera
FROM Catalogo.MediosPago
WHERE Codigo = @cod_mdp
;
GO

CREATE PROCEDURE Catalogo.ListarMedioPago AS
SELECT Id,
    Codigo,
    Descripcion,
    IdEntidadFinanciera
FROM Catalogo.MediosPago
;
GO

CREATE PROCEDURE Catalogo.BuscarImagenArticulo @id_articulo VARCHAR(10) AS
SELECT Id,
    IdArticulo,
    UrlImagen
FROM Catalogo.ImagenArticulos
WHERE IdArticulo = @id_articulo
;
GO

CREATE PROCEDURE Catalogo.ListarImagenArticulo AS
SELECT Id,
    IdArticulo,
    UrlImagen
FROM Catalogo.ImagenArticulos
;
GO

CREATE PROCEDURE Catalogo.ListarMarcas
AS
BEGIN
    -- Selecciona todas las filas de la tabla Catalogo.Marcas
    SELECT id, codigo, Descripcion, Estado FROM Catalogo.Marcas;
END;

CREATE PROCEDURE Catalogo.ListarColores AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores

