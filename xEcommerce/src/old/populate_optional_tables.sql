-- Set de datos
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Tipos (Id, Codigo, Descripcion) VALUES
(1, 'CAMI-C-TA', 'Camisetas'),
(2, 'PANTA', 'Pantalon'),
(3, 'CAM', 'Camisa'),
(4, 'VSTD', 'Vestido')
;

INSERT INTO Catalogo.Categorias (Id, Codigo, Descripcion) VALUES
(1, 'DEP', 'Deportiva'),
(2, 'FRML', 'Formal'),
(3, 'ACCS', 'Accesorios'),
(4, 'CAZZU', 'Casual')
;

INSERT INTO Catalogo.Marcas (Id, Codigo, Descripcion, Estado) VALUES
(1, 'ADDAS', 'Adidas', 1),
(2, 'NKE', 'Nike', 1),
(3, 'PUM', 'Puma', 1),
(4, 'EVRLTS', 'Everlast', 1),
(5, 'UMBR', 'Umbro', 1),
(6, 'PTGN', 'Patagonia', 1),
(7, 'TNF', 'The North Face', 1)
;

INSERT INTO Catalogo.Colores (Id, Codigo, Descripcion) VALUES
(1, 'RJO','Rojo'),
(2, 'AZL','Azul'),
(3, 'VRD', 'Verde'),
(4, 'AMA', 'Amarrillo'),
(5, 'NGRO', 'Negro'),
(6, 'BLCO','Blanco'),
(7, 'DRDO','Dorado')
;

INSERT INTO Catalogo.Talles (Id, Codigo, Descripcion) VALUES
(1, 'XS','Extra Small'),
(2, 'S','SMALL'),
(3, 'M', 'Medium'),
(4, 'L', 'Large'),
(5, 'XL', 'Extra large'),
(6, 'XXL','Double extra large'),
(7, 'XXXL','Triple extra large')
;

INSERT INTO Catalogo.Articulos (Id, Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Detalle, Estado)
VALUES
(1, 'ART001', 1, 1, 1, 'Camiseta Deportiva', 'Una prenda super elastica para deporte de intensidad', 1),
(2, 'ART002', 2, 2, 1, 'Pantalón Casual', 'Un pantalo rreee facherito', 1),
(3, 'ART003', 3, 3, 2, 'Camisa Formal', 'Con esta sos un lord ingles', 1),
(4, 'ART004', 3, 3, 2, 'Vestido Casual', 'Vestido de la segunda temporada de floricienta', 1)
;

INSERT INTO Catalogo.ImagenArticulos (Id, IdArticulo, UrlImagen)
VALUES
(1, 1, 'https://images.pexels.com/photos/2560894/pexels-photo-2560894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 2, 'https://images.pexels.com/photos/7716960/pexels-photo-7716960.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 3, 'https://images.pexels.com/photos/7447363/pexels-photo-7447363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 4, 'https://images.pexels.com/photos/29096407/pexels-photo-29096407/free-photo-of-mujer-elegante-con-vestido-naranja-de-riverside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
;

INSERT INTO Operaciones.Stock (Id, IdArticulo, IdColor, IdTalle, Cantidad)
VALUES
(1, 1, 1, 3, 20), -- Art 001, Rojo, M
(2, 1, 2, 4, 12), -- Art 001, Azul, L
(3, 1, 6, 5, 9), -- Art 001, Negro, XL
(4, 2, 3, 5, 20), -- Art 002, Verde, XL
(5, 2, 7, 5, 4), -- Art 002, Dorado, XL
(6, 3, 4, 2, 7), -- Art 003, Amarrillo, S
(7, 3, 5, 7, 1), -- Art 003, Negro, XXXL
(8, 4, 2, 3, 0), -- Art 004, Azul, M
(9, 4, 2, 4, 11) -- Art 004, Azul, L
;

INSERT INTO Operaciones.Precios (Id, IdArticulo, IdColor, IdTalle, Precio)
VALUES
(1, 1, 1, 3, 21000), -- Art 001, Rojo, M
(2, 1, 2, 4, 21000), -- Art 001, Azul, L
(3, 1, 6, 5, 21000), -- Art 001, Negro, XL
(4, 2, 3, 5, 14000), -- Art 002, Verde, XL
(5, 2, 7, 5, 1700), -- Art 002, Dorado, XL
(6, 3, 4, 2, 25000), -- Art 003, Amarrillo, S
(7, 3, 5, 7, 19999), -- Art 003, Negro, XXXL
(8, 4, 2, 3, 23999), -- Art 004, Azul, M
(9, 4, 2, 4, 23999) -- Art 004, Azul, L
;