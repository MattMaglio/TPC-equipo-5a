USE XECOMMERCE;
GO

CREATE FUNCTION Operaciones.FC_TotalStockPorCodigo (@CodigoProducto VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @TotalStock INT;

    SELECT @TotalStock = SUM(s.Cantidad)
    FROM Operaciones.Stock s
    INNER JOIN Catalogo.Articulos a ON s.IdArticulo = a.Id
    WHERE a.Codigo = @CodigoProducto;

    RETURN ISNULL(@TotalStock, 0);
END;
GO

CREATE FUNCTION  Catalogo.FC_ObtenerCodigoArticulo (@CodigoProducto VARCHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @Id INT;

    SELECT @Id = a.id
    FROM Catalogo.Articulos a
    WHERE a.Codigo = @CodigoProducto
    ;

    RETURN ISNULL(@Id, 0);
END;
GO

CREATE FUNCTION Catalogo.FC_ObtenerIdCliente(@DNI varchar(10))
RETURNS INT
AS
BEGIN
    DECLARE @Id INT;

    SELECT @Id = c.Id
    FROM Catalogo.Clientes c
    WHERE c.DNI = @DNI
    ;

    RETURN @Id;
END;
GO