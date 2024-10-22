-- Set de datos
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Categorias (Id, Codigo, Descripcion) VALUES 
(1, 'DEP', 'Deportiva'), 
(2, 'FRML', 'Formal'), 
(3, 'ACCS', 'Accesorios'), 
(4, 'CAZZU', 'Casual')
;

INSERT INTO Catalogo.Tipos (Id, Codigo, Descripcion) VALUES 
(1, 'CAMI-C-TA', 'Camisetas'), 
(2, 'PANTA', 'Pantalon'), 
(3, 'CAM', 'Camisa'), 
(4, 'VSTD', 'Vestido')
;