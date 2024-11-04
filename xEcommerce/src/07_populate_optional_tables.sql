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

INSERT INTO Catalogo.Articulos (Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Detalle)
VALUES
('ART001', 1, 1, 1, 'Camiseta Deportiva', 'Una prenda super elastica para deporte de intensidad'),
('ART002', 2, 2, 1, 'Pantalón Casual', 'Un pantalo rreee facherito'),
('ART003', 3, 3, 2, 'Camisa Formal', 'Con esta sos un lord ingles'),
('ART004', 3, 3, 2, 'Vestido Casual', 'Vestido de la segunda temporada de floricienta'),
('DelArt001', 1, 1, 1, 'Test To Deleted', 'Es un articulo creado especificamente para pruebas de borrado')
('ART005', 1, 1, 1, 'Camiseta Deportiva', 'Camiseta con tecnología de absorción de sudor', 1),
('ART006', 1, 2, 1, 'Camiseta Outdoor', 'Camiseta ligera para entrenamiento', 1),
('ART007', 2, 3, 1, 'Pantalón jogging', 'Pantalón cómodo para deportes', 1),
('ART008', 2, 4, 1, 'Pantalón Corto Casual', 'Ideal para días calurosos', 1),
('ART009', 3, 5, 2, 'Camisa de Algodón', 'Camisa suave y transpirable', 1),
('ART010', 3, 2, 2, 'Camisa de Rayas', 'Elegante camisa de rayas para oficina', 1),
('ART011', 4, 3, 3, 'Vestido de Noche', 'Vestido elegante para ocasiones especiales', 1),
('ART012', 4, 3, 3, 'Vestido de Verano', 'Ligero y cómodo para el verano', 1),
('ART013', 1, 4, 1, 'Camiseta Dry Fit', 'Camiseta diseñada para la actividad física', 1),
('ART014', 2, 1, 2, 'Pantalón Outdoor', 'Pantalón durable para actividades al aire libre', 1),
('ART015', 3, 2, 3, 'Camisa Casual', 'Perfecta para un look relajado', 1),
('ART016', 4, 1, 4, 'Vestido Casual', 'Vestido moderno y cómodo', 1),
('ART017', 1, 3, 1, 'Camiseta Cómoda', 'Camiseta versátil para todos los días', 1),
('ART018', 2, 5, 2, 'Pantalón Formal', 'Pantalón ideal para reuniones de trabajo', 1),
('ART019', 3, 3, 3, 'Camisa Deportiva', 'Camisa ligera para actividad física', 1),
('ART020', 4, 2, 4, 'Vestido Elegante', 'Vestido para ocasiones especiales', 1);
;

INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
VALUES
(1, 'https://images.pexels.com/photos/2560894/pexels-photo-2560894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 'https://images.pexels.com/photos/7716960/pexels-photo-7716960.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 'https://images.pexels.com/photos/7447363/pexels-photo-7447363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 'https://images.pexels.com/photos/29096407/pexels-photo-29096407/free-photo-of-mujer-elegante-con-vestido-naranja-de-riverside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
(5, 'https://images.pexels.com/photos/29205125/pexels-photo-29205125/free-photo-of-sesion-de-fotos-de-ropa-deportiva-en-la-azotea-de-austin.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(6, 'https://images.pexels.com/photos/29205185/pexels-photo-29205185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(7, 'https://images.pexels.com/photos/9488415/pexels-photo-9488415.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(8, 'https://images.pexels.com/photos/1027160/pexels-photo-1027160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(9, 'https://images.pexels.com/photos/25748420/pexels-photo-25748420/free-photo-of-modelo-maqueta-moderno-minimalista.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(10, 'https://images.pexels.com/photos/21207686/pexels-photo-21207686/free-photo-of-chicas-con-gaviota.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(11, 'https://images.pexels.com/photos/7453205/pexels-photo-7453205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(12, 'https://images.pexels.com/photos/12189040/pexels-photo-12189040.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(13, 'https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(14, 'https://images.pexels.com/photos/10861640/pexels-photo-10861640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(15, 'https://images.pexels.com/photos/8796466/pexels-photo-8796466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(16, 'https://images.pexels.com/photos/7973078/pexels-photo-7973078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(17, 'https://images.pexels.com/photos/1933589/pexels-photo-1933589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(18, 'https://images.pexels.com/photos/10341113/pexels-photo-10341113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(19, 'https://images.pexels.com/photos/25315908/pexels-photo-25315908/free-photo-of-hombre-pantalones-cortos-shorts-retrato.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
(20, 'https://images.pexels.com/photos/20078830/pexels-photo-20078830/free-photo-of-mujer-modelo-maqueta-en-pie.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
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
(4, 2, 4, 11), -- Art 004, Azul, L
(5, 1, 3, 90), -- Del Art 001, Rojo, M
(5, 2, 4, 95) -- Del Art 001, Azul, L
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
(4, 2, 4, 23999), -- Art 004, Azul, L
(5, 1, 3, 999), -- Del Art 001, Rojo, M
(5, 2, 4, 995) -- Del Art 001, Azul, L
;
