-- Procedures Generales
USE XECOMMERCE;
GO
CREATE OR ALTER PROCEDURE Catalogo.SP_ModificarArticulo
    @Codigo NVARCHAR(50),
    @Descripcion NVARCHAR(255),
    @IdTipo INT,
    @IdMarca INT,
    @IdCategoria INT,
    @Detalle VARCHAR(255),
    @UrlImagen1 VARCHAR(255),
    @UrlImagen2 VARCHAR(255),
    @UrlImagen3 VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @Id INT;
		-- obtenemos el id del articulo por su codigo
        SELECT @Id = Id FROM Catalogo.Articulos WHERE Codigo = @Codigo;

        -- Eliminamos imagenes que no coinciden con las URLs obtenidas
        DELETE FROM Catalogo.ImagenArticulos
        WHERE IdArticulo = @Id
        AND UrlImagen NOT IN (ISNULL(@UrlImagen1, ''), ISNULL(@UrlImagen2, ''), ISNULL(@UrlImagen3, ''));

        -- Actualizar la información general del artículo
        UPDATE Catalogo.Articulos
        SET Codigo = @Codigo,
            Descripcion = @Descripcion,
            IdTipo = @IdTipo,
            IdMarca = @IdMarca,
            IdCategoria = @IdCategoria,
            Detalle = @Detalle
        WHERE Id = @Id;

		-- insertamos o actualizamos las imagenes asociadas si no existen
        -- IMAGEN 1
        IF @UrlImagen1 IS NOT NULL AND @UrlImagen1 <> '' -- si la url no es nula y es distinta de vacio
        BEGIN -- si la url no existe en la tabla con el id articulo y la imagen proporcionada
            IF NOT EXISTS(SELECT 1 FROM Catalogo.ImagenArticulos WHERE IdArticulo = @Id AND UrlImagen = @UrlImagen1)
            BEGIN
                INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
                VALUES (@Id, @UrlImagen1);
            END
        END

        -- IMAGEN 2
        IF @UrlImagen2 IS NOT NULL AND @UrlImagen2 <> ''
        BEGIN
            IF NOT EXISTS(SELECT 1 FROM Catalogo.ImagenArticulos WHERE IdArticulo = @Id AND UrlImagen = @UrlImagen2)
            BEGIN
                INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
                VALUES (@Id, @UrlImagen2);
            END
        END
        -- IMAGEN 3
        IF @UrlImagen3 IS NOT NULL AND @UrlImagen3 <> ''
        BEGIN
            IF NOT EXISTS(SELECT 1 FROM Catalogo.ImagenArticulos WHERE IdArticulo = @Id AND UrlImagen = @UrlImagen3)
            BEGIN
                INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
                VALUES (@Id, @UrlImagen3);
            END
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Manejo de errores
        THROW;
    END CATCH
END;
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
WHERE a.Estado = 1
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
FROM Catalogo.Provincias
WHERE Codigo = @cod_provincia
;
GO

CREATE OR ALTER PROCEDURE Catalogo.ListarProvincia AS
SELECT Id,
    Codigo,
    Descripcion
FROM Catalogo.Provincias
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

CREATE OR ALTER PROCEDURE Operaciones.SP_Listado_StockPorArticulo
AS
BEGIN
    SELECT "Codigo",
        "Descripcion",
        "StockPorProducto"
    FROM Operaciones.VW_StockPorArticulos
    ORDER BY "Codigo"
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_Listado_StockPorArticulo_Filtrado
   @Codigo VARCHAR(10)
AS
BEGIN
    SELECT "Codigo",
        "Descripcion",
        "StockPorProducto"
    FROM Operaciones.VW_StockPorArticulos
        WHERE (@Codigo = '' OR "Codigo" = @Codigo)
    ORDER BY "Codigo";
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_StockYPrecio
AS
BEGIN
    SELECT "Id",
        "Id de Articulo",
        "Codigo de Articulo",
    	"Descripcion de Articulo",
        "Id de Color",
        "Codigo de Color",
        "Descripcion de Color",
        "Id de Talle",
        "Codigo de Talle",
        "Descripcion de Talle",
        "Cantidad",
        "Precio"
    FROM Operaciones.VW_StockYPrecios
    ORDER BY "Codigo de Articulo", "Codigo de Color", "Codigo de Talle"
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_Listado_StockYPrecio_Filtrado
    @Codigo VARCHAR(10)
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
    WHERE (@Codigo = '' OR "Codigo de Articulo" = @Codigo)
    ORDER BY "Codigo de Articulo", "Codigo de Color", "Codigo de Talle";
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_Articulo_StockYPrecio_Filtrado
    @Id INT
AS
BEGIN
    SELECT "Id de Articulo",
        "Codigo de Articulo",
        "Descripcion de Articulo",
        "Id de Color",
        "Codigo de Color",
        "Descripcion de Color",
        "Id de Talle",
        "Codigo de Talle",
        "Descripcion de Talle",
        "Cantidad",
        "Precio"
    FROM Operaciones.VW_StockYPrecios
    WHERE (@Id = '' OR "Id de Articulo" = @Id)
    ORDER BY "Codigo de Articulo", "Codigo de Color", "Codigo de Talle";
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarCliente
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

CREATE OR ALTER PROCEDURE Catalogo.ObtenerArticuloPorId
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        a.Id,
        a.Codigo,
        a.Descripcion,
        a.Estado,
        a.Detalle,
        t.Id AS "Id Tipo",
        t.Codigo AS "Codigo Tipo",
        t.Descripcion AS "Descripcion Tipo",
        m.Id AS "Id Marca",
        m.Codigo AS "Codigo Marca",
        m.Descripcion AS "Descripcion Marca",
        c.Id AS "Id Categoria",
        c.Codigo AS "Codigo Categoria",
        c.Descripcion AS "Descripcion Categoria"
    FROM
        Catalogo.Articulos a
        INNER JOIN Catalogo.Tipos t ON a.IdTipo = t.Id
        INNER JOIN Catalogo.Marcas m ON a.IdMarca = m.Id
        INNER JOIN Catalogo.Categorias c ON a.IdCategoria = c.Id
    WHERE a.Id = @Id
        AND a.Estado = 1;
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.InsertarNuevoArticulo
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(255),
    @IdTipo INT,
    @IdMarca INT,
    @IdCategoria INT,
    @Detalle VARCHAR(255)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Articulos
            INSERT INTO Articulos (Codigo, Descripcion, IdTipo, IdMarca, IdCategoria, Detalle)
            VALUES (@Codigo, @Descripcion, @IdTipo, @IdMarca, @IdCategoria, @Detalle);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.EliminarArticulo
    @IdArticulo INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE Catalogo.Articulos SET Estado = 0
            WHERE Id = @IdArticulo;
        COMMIT TRANSACTION;

        PRINT 'Artículo eliminado exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_EliminarMarca
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Catalogo.Marcas
            WHERE Id = @Id;
        COMMIT TRANSACTION;

        --PRINT 'Marca eliminada exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_EliminarTipo
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Catalogo.Tipos
            WHERE Id = @Id;
        COMMIT TRANSACTION;

        --PRINT 'Marca eliminada exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_EliminarCategoria
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Catalogo.Categorias
            WHERE Id = @Id;
        COMMIT TRANSACTION;

        --PRINT 'Marca eliminada exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_EliminarColor
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Catalogo.Colores
            WHERE Id = @Id;
        COMMIT TRANSACTION;

        --PRINT 'Marca eliminada exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_EliminarTalle
    @Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Catalogo.Talles
            WHERE Id = @Id;
        COMMIT TRANSACTION;

        --PRINT 'Marca eliminada exitosamente.';
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_ModificarArticulo
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(255),
    @IdTipo INT,
    @IdMarca INT,
    @IdCategoria INT,
    @Detalle VARCHAR(255)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;

            DECLARE @Id INT;

            --Obtenemos el id del Articulo.
            SELECT @Id = Id FROM Catalogo.Articulos WHERE Codigo = @Codigo

            -- Insertar en la tabla Articulos.
            UPDATE Catalogo.Articulos
            SET Codigo = @Codigo,
                Descripcion = @Descripcion,
                IdTipo = @IdTipo,
                IdMarca = @IdMarca,
                IdCategoria = @IdCategoria,
                Detalle = @Detalle
            WHERE Id = @Id;
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_ValidarCodigoTipificacion
    @Tipificacion INT,
    @Codigo VARCHAR(10)
AS
BEGIN

    -- Determinar la tabla de inserción según el valor de @Tipificacion
    IF @Tipificacion = 1
    BEGIN
        SELECT Estado FROM Catalogo.Marcas WHERE Codigo = @Codigo
    END
    ELSE IF @Tipificacion = 2
    BEGIN
        SELECT Estado FROM Catalogo.Tipos WHERE Codigo = @Codigo
    END
    ELSE IF @Tipificacion = 3
    BEGIN
        SELECT Estado FROM Catalogo.Categorias WHERE Codigo = @Codigo
    END
    ELSE IF @Tipificacion = 4
    BEGIN
        SELECT Estado FROM Catalogo.Colores WHERE Codigo = @Codigo
    END
    ELSE IF @Tipificacion = 5
    BEGIN
       SELECT Estado FROM Catalogo.Talles WHERE Codigo = @Codigo
    END
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarTipificacion
    @Tipificacion INT,
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Determinar la tabla de inserción según el valor de @Tipificacion
                IF @Tipificacion = 1
                BEGIN
                    INSERT INTO Catalogo.Marcas (Codigo, Descripcion)
                    VALUES (@Codigo, @Descripcion);
                END
                ELSE IF @Tipificacion = 2
                BEGIN
                     INSERT INTO Catalogo.Tipos (Codigo, Descripcion)
                    VALUES (@Codigo, @Descripcion);
                END
                ELSE IF @Tipificacion = 3
                BEGIN
                    INSERT INTO Catalogo.Categorias (Codigo, Descripcion)
                    VALUES (@Codigo, @Descripcion);
                END
                ELSE IF @Tipificacion = 4
                BEGIN
                    INSERT INTO Catalogo.Colores (Codigo, Descripcion)
                    VALUES (@Codigo, @Descripcion);
                END
                ELSE IF @Tipificacion = 5
                BEGIN
                    INSERT INTO Catalogo.Talles (Codigo, Descripcion)
                    VALUES (@Codigo, @Descripcion);
                END
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarColor
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Tipo
            INSERT INTO Catalogo.Colores (Codigo, Descripcion)
            VALUES (@Codigo, @Descripcion);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarTalle
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Tipo
            INSERT INTO Catalogo.Talles (Codigo, Descripcion)
            VALUES (@Codigo, @Descripcion);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarTipo
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Tipo
            INSERT INTO Catalogo.Tipos (Codigo, Descripcion)
            VALUES (@Codigo, @Descripcion);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarCategoria
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Categoria
            INSERT INTO Catalogo.Categorias (Codigo, Descripcion)
            VALUES (@Codigo, @Descripcion);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_InsertarMarca
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(25)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Insertar en la tabla Marca
            INSERT INTO Catalogo.Marcas (Codigo, Descripcion)
            VALUES (@Codigo, @Descripcion);
            -- Confirmar la transacción
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_Listado_TipificacionesCompletas
AS
BEGIN
    SELECT Tipificacion, Id, Codigo, Descripcion, Estado
    FROM Catalogo.VW_Tipifiaciones
    ORDER BY Tipificacion, Codigo DESC;
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_ValidarIntegridadTipificacion
    @Tipificacion INT,
    @Id INT
AS
BEGIN
    -- Definir el nombre de la columna de ID en función de @Tipificacion
    DECLARE @columnName NVARCHAR(50);

    -- Asignar la columna de ID correspondiente al tipo de tipificación
    SET @columnName = CASE @Tipificacion
                        WHEN 1 THEN 'Id Marca'
                        WHEN 2 THEN 'Id Tipo'
                        WHEN 3 THEN 'Id Categoria'
                        WHEN 4 THEN 'Id Color'
                        WHEN 5 THEN 'Id Talle'
                      END;

    -- Construir la consulta dinámica
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'SELECT COUNT(*) FROM Operaciones.VW_IntegridadTipificaciones WHERE [' + @columnName + '] = @Id';

    -- Ejecutar la consulta dinámica
    EXEC sp_executesql @sql, N'@Id INT', @Id;
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_ModificarTipificacion
    @Tipificacion INT,
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(255)
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Determinar la tabla de inserción según el valor de @Tipificacion
                IF @Tipificacion = 1
                BEGIN
                    UPDATE Catalogo.Marcas SET Descripcion = @Descripcion WHERE Codigo = @Codigo
                END
                ELSE IF @Tipificacion = 2
                BEGIN
                    UPDATE Catalogo.Tipos SET Descripcion = @Descripcion WHERE Codigo = @Codigo
                END
                ELSE IF @Tipificacion = 3
                BEGIN
                    UPDATE Catalogo.Categorias SET Descripcion = @Descripcion WHERE Codigo = @Codigo
                END
                ELSE IF @Tipificacion = 4
                BEGIN
                    UPDATE Catalogo.Colores SET Descripcion = @Descripcion WHERE Codigo = @Codigo
                END
                ELSE IF @Tipificacion = 5
                BEGIN
                    UPDATE Catalogo.Talles SET Descripcion = @Descripcion WHERE Codigo = @Codigo
                END
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo.SP_BuscarTipificacionPorId
    @Tipificacion INT,
    @Id INT
AS
BEGIN
    -- Iniciar una transacción para asegurar que todas las operaciones se realicen juntas
    BEGIN TRY
        BEGIN TRANSACTION;
            -- Determinar la tabla de inserción según el valor de @Tipificacion
                IF @Tipificacion = 1
                BEGIN
                    SELECT "Codigo", "Descripcion" FROM Catalogo.Marcas WHERE "Id" = @Id;
                END
                ELSE IF @Tipificacion = 2
                BEGIN
                    SELECT "Codigo", "Descripcion" FROM Catalogo.Tipos WHERE "Id" = @Id;
                END
                ELSE IF @Tipificacion = 3
                BEGIN
                   SELECT "Codigo", "Descripcion" FROM Catalogo.Categorias WHERE "Id" = @Id;
                END
                ELSE IF @Tipificacion = 4
                BEGIN
                    SELECT "Codigo", "Descripcion" FROM Catalogo.Colores WHERE "Id" = @Id;
                END
                ELSE IF @Tipificacion = 5
                BEGIN
                    SELECT "Codigo", "Descripcion" FROM Catalogo.Talles WHERE "Id" = @Id;
                END
            COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_Eliminar_StockYPrecio
    @Id INT
    /*
    @IdArt INT,
    @IdColor INT,
    @IdTalle INT
    */
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            DELETE FROM Operaciones.Stock
            WHERE "Id" = @Id
                /*
                "IdArticulo" = @IdArt
                AND "IdColor" = @IdColor
                AND "IdTalle" = @IdTalle
                */

            DELETE FROM Operaciones.Precios
            WHERE "Id" = @Id
                /*
                "IdArticulo" = @IdArt
                AND "IdColor" = @IdColor
                AND "IdTalle" = @IdTalle
                */
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_CantidadRegistrosStock
    @IdArt INT,
    @IdColor INT,
    @IdTalle INT
AS
BEGIN
    SELECT COUNT("Id") AS "CantidadRegistros"
    FROM Operaciones.Stock
    WHERE IdArticulo = @IdArt
        AND IdColor = @IdColor
        AND IdTalle = @IdTalle
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_InsertarStock
    @Art VARCHAR(25),
    @Color VARCHAR(255),
    @Talle VARCHAR(255),
    @Cantidad INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

            -- Verifica si hay un registro existente en la tabla de precios para la combinación dada
            DECLARE @TienePrecio INT;
            DECLARE @IdArt INT;
            DECLARE @IdColor INT;
            DECLARE @IdTalle INT;

            SET @IdArt = (select Id from catalogo.Articulos where "Codigo" = @Art AND Estado = 1)
            SET @IdColor = (select Id from catalogo.Colores where "Descripcion" = @Color AND Estado = 1)
            SET @IdTalle = (select Id from catalogo.Talles where "Descripcion" = @Talle AND Estado = 1)

            SET @TienePrecio = (
                SELECT COUNT(*)
                FROM Operaciones.Precios
                WHERE IdArticulo = @IdArt
                  AND IdColor = @IdColor
                  AND IdTalle = @IdTalle
            );

            -- Si no hay registro (es decir, @TienePrecio = 0), inserta un nuevo registro con precio = 0
            IF @TienePrecio = 0
            BEGIN
                INSERT INTO Operaciones.Precios (IdArticulo, IdColor, IdTalle, Precio)
                VALUES (@IdArt, @IdColor, @IdTalle, 0);
            END

            -- Inserta el nuevo registro de stock
            INSERT INTO Operaciones.Stock (IdArticulo, IdColor, IdTalle, Cantidad)
            VALUES (@IdArt, @IdColor, @IdTalle, @Cantidad);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_ModificarStock
    @Art INT,
    @Color INT,
    @Talle INT,
    @Cantidad INT
AS
BEGIN
     BEGIN TRY
        BEGIN TRANSACTION;
            DECLARE @IdArt INT;
            DECLARE @IdColor INT;
            DECLARE @IdTalle INT;

            SET @IdArt = (select Id from catalogo.Articulos where "Codigo" = @Art AND Estado = 1)
            SET @IdColor = (select Id from catalogo.Colores where "Descripcion" = @Color AND Estado = 1)
            SET @IdTalle = (select Id from catalogo.Talles where "Descripcion" = @Talle AND Estado = 1)

            UPDATE Operaciones.Stock SET Cantidad = @Cantidad
            WHERE IdArticulo = @IdArt
                AND IdColor = @IdColor
                AND IdTalle = @IdTalle
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_CantidadRegistrosPrecios
    @IdArt INT,
    @IdColor INT,
    @IdTalle INT
AS
BEGIN
    SELECT COUNT("Id") AS "CantidadRegistros"
    FROM Operaciones.Precios
    WHERE IdArticulo = @IdArt
        AND IdColor = @IdColor
        AND IdTalle = @IdTalle
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_InsertarPrecio
    @Art VARCHAR(25),
    @Color VARCHAR(255),
    @Talle VARCHAR(255),
    @Precio FLOAT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

            DECLARE @IdArt INT;
            DECLARE @IdColor INT;
            DECLARE @IdTalle INT;

            SET @IdArt = (select Id from catalogo.Articulos where "Codigo" = @Art AND Estado = 1)
            SET @IdColor = (select Id from catalogo.Colores where "Descripcion" = @Color AND Estado = 1)
            SET @IdTalle = (select Id from catalogo.Talles where "Descripcion" = @Talle AND Estado = 1)

            -- Inserta el nuevo registro de precio
            INSERT INTO Operaciones.Precios (IdArticulo, IdColor, IdTalle, Precio)
            VALUES (@IdArt, @IdColor, @IdTalle, @Precio);

            -- Verifica si hay un registro existente en la tabla de stock para la combinación dada
            DECLARE @TieneStock INT;
            SET @TieneStock = (
                SELECT COUNT(*)
                FROM Operaciones.Stock
                WHERE IdArticulo = @IdArt
                  AND IdColor = @IdColor
                  AND IdTalle = @IdTalle
            );

            -- Si no hay registro de stock, inserta uno nuevo con cantidad = 0
            IF @TieneStock = 0
            BEGIN
                INSERT INTO Operaciones.Stock (IdArticulo, IdColor, IdTalle, Cantidad)
                VALUES (@IdArt, @IdColor, @IdTalle, 0);
            END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Operaciones.SP_ModificarPrecio
    @Art INT,
    @Color INT,
    @Talle INT,
    @Precio INT
AS
BEGIN
     BEGIN TRY
        BEGIN TRANSACTION;

            DECLARE @IdArt INT;
            DECLARE @IdColor INT;
            DECLARE @IdTalle INT;

            SET @IdArt = (select Id from catalogo.Articulos where "Codigo" = @Art AND Estado = 1)
            SET @IdColor = (select Id from catalogo.Colores where "Descripcion" = @Color AND Estado = 1)
            SET @IdTalle = (select Id from catalogo.Talles where "Descripcion" = @Talle AND Estado = 1)

            UPDATE Operaciones.Precios SET Precio = @Precio
            WHERE IdArticulo = @IdArt
                AND IdColor = @IdColor
                AND IdTalle = @IdTalle
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


CREATE PROCEDURE Catalogo.InsertarNuevoArticulo
    @Codigo VARCHAR(10),
    @Descripcion VARCHAR(255),
    @IdTipo INT,
    @IdMarca INT,
    @IdCategoria INT,
    @Detalle VARCHAR(255)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        --insertamos en la tabla articulo
        INSERT INTO Articulos (Codigo, Descripcion, IdTipo, IdMarca, IdCategoria, Detalle)
        VALUES (@Codigo, @Descripcion, @IdTipo, @IdMarca, @IdCategoria, @Detalle);

        -- capturamos el id ingresado
        SELECT SCOPE_IDENTITY() AS IdArticulo;


        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
       
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE Catalogo.InsertarImagen
    @IdArticulo INT,
    @UrlImagen VARCHAR(255)
AS
BEGIN
    BEGIN TRANSACTION; 
    BEGIN TRY
        -- insertamos la imagen relacionada con el articulo
        INSERT INTO Catalogo.ImagenArticulos(IdArticulo, UrlImagen)
        VALUES (@IdArticulo, @UrlImagen);

        COMMIT TRANSACTION; 
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION; 
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE Catalogo_SPBorrarImagen
    @Id INT
AS
BEGIN
  
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Catalogo.ImagenArticulos
        WHERE Id = @Id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        BEGIN
            ROLLBACK TRANSACTION;
        END;      
    END CATCH;
END;

