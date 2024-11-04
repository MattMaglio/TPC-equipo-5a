-- Procedures Generales
USE XECOMMERCE;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarArticulos @cod_articulo VARCHAR(10) AS
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

CREATE OR ALTER PROCEDURE Catalogo.ListarArticulos AS
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

CREATE OR ALTER PROCEDURE Catalogo.BuscarCategorias @cod_categoria VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Categorias
WHERE Codigo = @cod_categoria
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarCategorias AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Categorias
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarMarcas @cod_marca VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
WHERE Codigo = @cod_marca
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarMarcas AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarColores AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarTipos @cod_tipo VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Marcas
WHERE Codigo = @cod_tipo
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarTipos AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Tipos
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarColores @cod_color VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Colores
WHERE Codigo = @cod_color
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarTalles @cod_talle VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Talles
WHERE Codigo = @cod_talle
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarTalles AS
SELECT Id,
    Codigo,
    Descripcion,
    Estado
FROM Catalogo.Talles
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarClientes @dni VARCHAR(10) AS
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

CREATE OR ALTER PROCEDURE Catalogo.ListarClientes AS
SELECT Id,
    DNI,
    Nombre,
    Apellido,
    Email,
    Estado
FROM Catalogo.Clientes
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarCiudades @cod_ciudad VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
WHERE Codigo = @cod_ciudad
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarCiudades AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarProvincia @cod_provincia VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
WHERE Codigo = @cod_provincia
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarProvincia AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Ciudades
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarDirecciones @id_cliente VARCHAR(10) AS
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

CREATE OR ALTER PROCEDURE Catalogo.ListarDirecciones AS
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

CREATE OR ALTER PROCEDURE Catalogo.BuscarMedioPago @cod_mdp VARCHAR(10) AS
SELECT Id,
    Codigo,
    Descripcion,
    IdEntidadFinanciera
FROM Catalogo.MediosPago
WHERE Codigo = @cod_mdp
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarMedioPago AS
SELECT Id,
    Codigo,
    Descripcion,
    IdEntidadFinanciera
FROM Catalogo.MediosPago
;
GO

CREATE OR ALTER PROCEDURE Catalogo.BuscarImagenArticulo @id_articulo VARCHAR(10) AS
SELECT Id,
    IdArticulo,
    UrlImagen
FROM Catalogo.ImagenArticulos
WHERE IdArticulo = @id_articulo
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarImagenArticulo AS
SELECT Id,
    IdArticulo,
    UrlImagen
FROM Catalogo.ImagenArticulos
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarArticulosConImagen AS
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

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarArticulo
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25),
    @Detalle VARCHAR(255),
    @IdMarca INT,
    @IdTipo INT,
    @IdCategoria INT,
    @ListaImagenes VARCHAR(MAX) -- Parámetro para recibir las URLs de las imágenes
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            -- Insertamos articulo en la tabla articulos.
            INSERT INTO Catalogo.Articulos (Codigo, Descripcion, Detalle, IdMarca, IdTipo, IdCategoria)
            VALUES (@Codigo, @Descripcion, @Detalle, @IdMarca, @IdTipo, @IdCategoria);

            -- Declaracion de varaibles para insertar las imagenes.
            DECLARE @UrlImagen VARCHAR(255);
            DECLARE @IdArticulo INT;

            -- Obtenemos el Id del articulo que acabamos de insertar.
            SET @IdArticulo = Catalogo.FC_ObtenerCodigoArticulo(@Codigo);

            -- Se divide las url y se inserta.
            WHILE LEN(@ListaImagenes) > 0
            BEGIN
                -- Obtener la primera URL de la lista.
                SET @UrlImagen = LEFT(@ListaImagenes, CHARINDEX(',', @ListaImagenes + ',') - 1);

                -- Insertar la imagen en la tabla de imágenes.
                IF @UrlImagen <> ''
                BEGIN
                    INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
                    VALUES (@IdArticulo, @UrlImagen);
                END

                -- Eliminar la URL procesada de la lista.
                SET @ListaImagenes = STUFF(@ListaImagenes, 1, CHARINDEX(',', @ListaImagenes + ',') , '');
            END;
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_StockYPrecio
AS
BEGIN
    SELECT "Codigo de Articulo",
    	"Descripcion de Articulo",
        "Codigo de Color",
        "Descripcion de Color",
        "Codigo de Talle",
        "Descripcion de Talle",
        "Cantidad",
        "Precio"
    FROM Operaciones.VW_StockYPrecios
    ORDER BY "Codigo de Articulo", "Codigo de Color", "Codigo de Talle"
END;
GO



CREATE PROCEDURE Catalogo.SP_InsertarCliente
    @nombre varchar(255),
    @apellido varchar(255),
    @dni varchar (10),
    @email varchar(255),
    @calle varchar(255),
    @numero smallint,
    @codigoPostal varchar(10),
    @idCiudad int,
    @idProvincia int
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            --insertamos el cliente en la tabla Clientes
            INSERT INTO CATALOGO.CLIENTES (Nombre, Apellido, DNI, Email)
            VALUES (@nombre, @apellido, @dni, @email);


            --declaración de variables
            DECLARE @idCliente int;
            SET @idCliente = Catalogo.FC_ObtenerIdCliente(@dni);

            --insertamos los datos de dirección del cliente en la tabla Direcciones
            INSERT INTO CATALOGO.DIRECCIONES (Calle, Numero, CodigoPostal, IdCiudad, IdProvincia, IdCliente)
            VALUES(@calle, @numero, @codigoPostal, @idCiudad, @idProvincia, @idCliente);
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO