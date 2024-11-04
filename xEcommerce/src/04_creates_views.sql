-- Creacion de vista para los listados de Stock.
CREATE VIEW Operaciones.VW_Stock AS
SELECT a.Codigo AS "Codigo de Articulo",
    a.Descripcion AS "Descripcion de Articulo",
    c.Codigo AS "Codigo de Color",
    c.Descripcion AS "Descripcion de Color",
    t.Codigo AS "Codigo de Talle",
    t.Descripcion AS "Descripcion de Talle",
    s.Cantidad
FROM Operaciones.Stock s
INNER JOIN Catalogo.Articulos a ON s.IdArticulo = a.Id
INNER JOIN Catalogo.Colores c ON s.IdColor = c.Id
INNER JOIN Catalogo.Talles t ON s.IdTalle = t.Id
;
GO

-- Creacion de vista para los listados de precios.
CREATE VIEW Operaciones.VW_Precios AS
SELECT a.Codigo AS "Codigo de Articulo",
    a.Descripcion AS "Descripcion de Articulo",
    c.Codigo AS "Codigo de Color",
    c.Descripcion AS "Descripcion de Color",
    t.Codigo AS "Codigo de Talle",
    t.Descripcion AS "Descripcion de Talle",
    p.Precio
FROM Operaciones.Precios p
INNER JOIN Catalogo.Articulos a ON p.IdArticulo = a.Id
INNER JOIN Catalogo.Colores c ON p.IdColor = c.Id
INNER JOIN Catalogo.Talles t ON p.IdTalle = t.Id
;
GO

-- Creacion de vista para los listados de precios.
CREATE VIEW Operaciones.VW_StockYPrecios AS
SELECT  a.Codigo AS "Codigo de Articulo",
    a.Descripcion AS "Descripcion de Articulo",
    c.Codigo AS "Codigo de Color",
    c.Descripcion AS "Descripcion de Color",
    t.Codigo AS "Codigo de Talle",
    t.Descripcion AS "Descripcion de Talle",
    s.Cantidad,
    p.Precio
FROM Operaciones.Precios p
INNER JOIN Catalogo.Articulos a ON p.IdArticulo = a.Id
INNER JOIN Catalogo.Colores c ON p.IdColor = c.Id
INNER JOIN Catalogo.Talles t ON p.IdTalle = t.Id
INNER JOIN Operaciones.Stock s
    ON p.IdArticulo = s.IdArticulo
    AND p.IdColor = s.IdColor
    AND p.IdTalle = s.IdTalle
;
GO

-- Creacion de vista para los articulos agrupados por codigo.
CREATE VIEW Operaciones.VW_StockPorArticulos AS
SELECT a.Codigo,
    a.Descripcion,
    Operaciones.FC_TotalStockPorCodigo(a.Codigo) AS StockPorProducto
FROM Operaciones.Stock s
INNER JOIN Catalogo.Articulos a ON s.IdArticulo = a.Id
INNER JOIN Catalogo.Colores c ON s.IdColor = c.Id
INNER JOIN Catalogo.Talles t ON s.IdTalle = t.Id
GROUP BY a.Codigo, a.Descripcion
;
GO

CREATE VIEW Catalogo.VW_Tipifiaciones AS
    SELECT 'Marca' AS Tipificacion, Id, Codigo, Descripcion, Estado FROM Catalogo.Marcas
        UNION ALL
    SELECT 'Tipo' AS Tipificacion, Id, Codigo, Descripcion, Estado FROM Catalogo.Tipos
        UNION ALL
    SELECT 'Categoria' AS Tipificacion, Id, Codigo, Descripcion, Estado FROM Catalogo.Categorias
        UNION ALL
    SELECT 'Color' AS Tipificacion, Id, Codigo, Descripcion, Estado FROM Catalogo.Colores
        UNION ALL
    SELECT 'Talle' AS Tipificacion, Id, Codigo, Descripcion, Estado FROM Catalogo.Talles
;
GO

CREATE VIEW Operaciones.VW_IntegridadTipificaciones AS
SELECT a.Id AS "Id Art",
    a.Codigo AS "Codigo de Articulo",
    '1' AS "Tip Marca",
    a.IdMarca AS "Id Marca",
    '2' AS "Tip Tipo",
    a.IdTipo AS "Id Tipo",
    '3' AS "Tip Categoria",
    a.IdCategoria AS "Id Categoria",
    '4' AS "Tip Color",
    c.Id AS "Id Color",
    '5' AS "Tip Talle",
    t.Id AS "Id Talle",
    s.Cantidad,
    p.Precio
FROM Operaciones.Precios p
INNER JOIN Catalogo.Articulos a ON p.IdArticulo = a.Id
INNER JOIN Catalogo.Colores c ON p.IdColor = c.Id
INNER JOIN Catalogo.Talles t ON p.IdTalle = t.Id
INNER JOIN Operaciones.Stock s
    ON p.IdArticulo = s.IdArticulo
    AND p.IdColor = s.IdColor
    AND p.IdTalle = s.IdTalle
;
GO