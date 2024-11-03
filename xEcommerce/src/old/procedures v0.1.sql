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
SELECT a.Id,
    a.Codigo,
    a.Descripcion,
    a.IdTipo,
    t.Descripcion AS "Tipo",
    a.IdMarca,
    m.Descripcion AS "Marca",
    a.IdCategoria,
    c.Descripcion AS "Categoria",
    a.Detalle,
    a.Estado
FROM Catalogo.Articulos a
INNER JOIN Catalogo.Tipos t ON a.IdTipo = t.Id
INNER JOIN Catalogo.Marcas m ON a.IdMarca = m.Id
INNER JOIN Catalogo.Categorias c ON a.IdCategoria = c.Id
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
CREATE PROCEDURE Catalogo.ListarColores AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores
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

CREATE PROCEDURE Catalogo.ListarArticulosConImagen AS
BEGIN
    SELECT
        a.Id AS ProductId,
        a.Codigo AS Code,
        a.Descripcion AS Name,
        i.UrlImagen AS ImageUrl
    FROM
        Catalogo.Articulos a
    LEFT JOIN
        Catalogo.ImagenArticulos i ON a.Id = i.IdArticulo
    WHERE
        a.Estado = 1;
END;
GO

select * from Catalogo.Articulos

CREATE PROCEDURE Catalogo.InsertarArticulosConImagenes
    @Codigo VARCHAR(10),
    @Nombre VARCHAR(255),
    @Descripcion VARCHAR(255),
    @Stock INT,
    @Precio MONEY,
    @IdMarca INT,
    @IdTalle INT,
    @IdColor INT,
    @IdTipo INT,
    @IdCategoria INT,
    @Estado BIT = 1, -- Por defecto activo
    @IdImagen VARCHAR(MAX) -- Parámetro para recibir las URLs de las imágenes separadas por comas
AS
BEGIN
    SET NOCOUNT ON; -- Evita mostrar el conteo de filas afectadas

    -- Insertar en la tabla articulos
    INSERT INTO Catalogo.Articulos
    (Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Estado, IdColor, IdTalle, Stock, Precio, IdImagen)
    VALUES 
    (@Codigo, @IdTipo, @IdMarca, @IdCategoria, @Descripcion, @Estado, @IdColor, @IdTalle, @Stock, @Precio, @IdImagen);

    -- Obtener el id del último artículo insertado
    DECLARE @IdArticulo INT = SCOPE_IDENTITY();

    -- Declarar var para almacenar la URL de cada imagen
    DECLARE @UrlImagen VARCHAR(255);

    -- Dividir las URLs de imágenes y realizar la inserción
    WHILE LEN(@IdImagen) > 0
    BEGIN
        -- Obtener la primera URL de la lista
        SET @UrlImagen = LEFT(@IdImagen, CHARINDEX(',', @IdImagen + ',') - 1);

        -- Limpiar espacios en blanco alrededor de la URL
        SET @UrlImagen = LTRIM(RTRIM(@UrlImagen));

        -- Insertar la imagen en la tabla de imágenes si la URL no está vacía
        IF @UrlImagen <> ''
        BEGIN
            INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
            VALUES (@IdArticulo, @UrlImagen);
        END

        -- Eliminar la URL procesada de la lista
        SET @IdImagen = STUFF(@IdImagen, 1, CHARINDEX(',', @IdImagen + ','), '');
    END;
END;
GO
