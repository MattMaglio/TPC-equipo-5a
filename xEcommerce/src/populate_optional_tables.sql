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
(5,'REM','Remera')
(6,'BUZ','Buzo')
(7,'CAMP','Campera')
(8,'JNS','Jeans')
;

INSERT INTO Catalogo.Marcas (Id, Codigo, Descripcion) VALUES 
(1, 'ADDAS', 'Adidas'), 
(2, 'NKE', 'Nike'), 
(3, 'PUM', 'Puma'), 
(4, 'EVRLTS', 'Everlast')
(4, 'UMBR', 'Umbro')
;

INSERT INTO Catalogo.Talles (Id, Codigo) VALUES 
(1, 'XS','Extra Small'), 
(2, 'S','SMALL'), 
(3, 'M', 'Medium'), 
(4, 'L', 'Large')
(5, 'XL', 'Extra large')
(6, 'XXL','Double extra large')
(7, 'XXXL','Triple extra large')
;

INSERT INTO Catalogo.Colores (Id, Codigo) VALUES 
(1, 'RJO','Rojo'), 
(2, 'AZL','Azul'), 
(3, 'VRD', 'Verde'), 
(4, 'AMA', 'Amarrillo')
(5, 'NGRO', 'Negro')
(6, 'BLCO',Blanco')
(7, 'DRDO','Dorado')
;
