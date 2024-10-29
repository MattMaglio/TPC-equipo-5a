-- Creacion de vista para los listados de Stock.
CREATE VIEW VW_Stock AS
SELECT  a.Codigo AS "Codigo de Articulo",
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
CREATE VIEW VW_Precios AS
SELECT  a.Codigo AS "Codigo de Articulo",
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