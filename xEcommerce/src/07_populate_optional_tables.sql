-- Set de datos
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Tipos (Codigo, Descripcion) VALUES
('CAMI-C-TA', 'Camisetas'),
('PANTA', 'Pantalon'),
('CAM', 'Camisa'),
('VSTD', 'Vestido')
;

INSERT INTO Catalogo.Categorias (Codigo, Descripcion) VALUES
('DEP', 'Deportiva'),
('FRML', 'Formal'),
('ACCS', 'Accesorios'),
('CAZZU', 'Casual')
;

INSERT INTO Catalogo.Marcas (Codigo, Descripcion, Estado) VALUES
('ADDAS', 'Adidas', 1),
('NKE', 'Nike', 1),
('PUM', 'Puma', 1),
('EVRLTS', 'Everlast', 1),
('UMBR', 'Umbro', 1),
('PTGN', 'Patagonia', 1),
('TNF', 'The North Face', 1)
;

INSERT INTO Catalogo.Colores (Codigo, Descripcion) VALUES
('RJO','Rojo'),
('AZL','Azul'),
('VRD', 'Verde'),
('AMA', 'Amarrillo'),
('NGRO', 'Negro'),
('BLCO','Blanco'),
('DRDO','Dorado')
;

INSERT INTO Catalogo.Talles (Codigo, Descripcion) VALUES
('XS','Extra Small'),
('S','SMALL'),
('M', 'Medium'),
('L', 'Large'),
('XL', 'Extra large'),
('XXL','Double extra large'),
('XXXL','Triple extra large')
;

INSERT INTO Catalogo.Articulos (Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Detalle, Estado)
VALUES
('ART001', 1, 1, 1, 'Camiseta Deportiva', 'Una prenda super elastica para deporte de intensidad', 1),
('ART002', 2, 2, 1, 'Pantalón Casual', 'Un pantalo rreee facherito', 1),
('ART003', 3, 3, 2, 'Camisa Formal', 'Con esta sos un lord ingles', 1),
('ART004', 3, 3, 2, 'Vestido Casual', 'Vestido de la segunda temporada de floricienta', 1)
;

INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
VALUES
(1, 'https://images.pexels.com/photos/2560894/pexels-photo-2560894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 'https://images.pexels.com/photos/7716960/pexels-photo-7716960.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 'https://images.pexels.com/photos/7447363/pexels-photo-7447363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 'https://images.pexels.com/photos/29096407/pexels-photo-29096407/free-photo-of-mujer-elegante-con-vestido-naranja-de-riverside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
;

INSERT INTO Operaciones.Stock (IdArticulo, IdColor, IdTalle, Cantidad)
VALUES
(1, 1, 3, 20), -- Art 001, Rojo, M
(1, 2, 4, 12), -- Art 001, Azul, L
(1, 6, 5, 9), -- Art 001, Negro, XL
(2, 3, 5, 20), -- Art 002, Verde, XL
(2, 7, 5, 4), -- Art 002, Dorado, XL
(3, 4, 2, 7), -- Art 003, Amarrillo, S
(3, 5, 7, 1), -- Art 003, Negro, XXXL
(4, 2, 3, 0), -- Art 004, Azul, M
(4, 2, 4, 11) -- Art 004, Azul, L
;

INSERT INTO Operaciones.Precios (IdArticulo, IdColor, IdTalle, Precio)
VALUES
(1, 1, 3, 21000), -- Art 001, Rojo, M
(1, 2, 4, 21000), -- Art 001, Azul, L
(1, 6, 5, 21000), -- Art 001, Negro, XL
(2, 3, 5, 14000), -- Art 002, Verde, XL
(2, 7, 5, 1700), -- Art 002, Dorado, XL
(3, 4, 2, 25000), -- Art 003, Amarrillo, S
(3, 5, 7, 19999), -- Art 003, Negro, XXXL
(4, 2, 3, 23999), -- Art 004, Azul, M
(4, 2, 4, 23999) -- Art 004, Azul, L
;