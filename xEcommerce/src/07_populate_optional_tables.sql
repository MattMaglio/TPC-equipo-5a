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

SELECT * FROM Catalogo.Articulos
INSERT INTO Catalogo.Articulos (Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Detalle)
VALUES
('ART001', 1, 1, 1, 'Camiseta Deportiva', 'Una prenda super elastica para deporte de intensidad'),
('ART002', 2, 2, 1, 'Pantalón Casual', 'Un pantalo rreee facherito'),
('ART003', 3, 3, 2, 'Camisa Formal', 'Con esta sos un lord ingles'),
('ART004', 3, 3, 2, 'Vestido Casual', 'Vestido de la segunda temporada de floricienta'),
('DelArt001', 1, 1, 1, 'Test To Deleted', 'Es un articulo creado especificamente para pruebas de borrado'),
('ART005', 1, 1, 1, 'Camiseta Deportiva', 'Camiseta con tecnología de absorción de sudor'),
('ART006', 1, 2, 1, 'Camiseta Outdoor', 'Camiseta ligera para entrenamiento'),
('ART007', 2, 3, 1, 'Pantalón jogging', 'Pantalón cómodo para deportes'),
('ART008', 2, 4, 1, 'Pantalón Corto Casual', 'Ideal para días calurosos'),
('ART009', 3, 5, 2, 'Camisa de Algodón', 'Camisa suave y transpirable'),
('ART010', 3, 2, 2, 'Camisa de Rayas', 'Elegante camisa de rayas para oficina'),
('ART011', 4, 3, 3, 'Vestido de Noche', 'Vestido elegante para ocasiones especiales'),
('ART012', 4, 3, 3, 'Vestido de Verano', 'Ligero y cómodo para el verano'),
('ART013', 1, 4, 1, 'Camiseta Dry Fit', 'Camiseta diseñada para la actividad física'),
('ART014', 2, 1, 2, 'Pantalón Outdoor', 'Pantalón durable para actividades al aire libre'),
('ART015', 3, 2, 3, 'Camisa Casual', 'Perfecta para un look relajado'),
('ART016', 4, 1, 4, 'Vestido Casual', 'Vestido moderno y cómodo'),
('ART017', 1, 3, 1, 'Camiseta Cómoda', 'Camiseta versátil para todos los días'),
('ART018', 2, 5, 2, 'Pantalón Formal', 'Pantalón ideal para reuniones de trabajo'),
('ART019', 3, 3, 3, 'Camisa Deportiva', 'Camisa ligera para actividad física'),
('ART020', 4, 2, 4, 'Vestido Elegante', 'Vestido para ocasiones especiales');
;

INSERT INTO Catalogo.ImagenArticulos (IdArticulo, UrlImagen)
VALUES
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 'https://images.pexels.com/photos/2560894/pexels-photo-2560894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 'https://images.pexels.com/photos/7716960/pexels-photo-7716960.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART003' ), 'https://images.pexels.com/photos/7447363/pexels-photo-7447363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART004' ), 'https://images.pexels.com/photos/29096407/pexels-photo-29096407/free-photo-of-mujer-elegante-con-vestido-naranja-de-riverside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'DelArt001' ), 'https://images.pexels.com/photos/29205125/pexels-photo-29205125/free-photo-of-sesion-de-fotos-de-ropa-deportiva-en-la-azotea-de-austin.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART005' ), 'https://images.pexels.com/photos/29205185/pexels-photo-29205185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 'https://images.pexels.com/photos/9488415/pexels-photo-9488415.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART007' ), 'https://images.pexels.com/photos/1027160/pexels-photo-1027160.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART008' ), 'https://images.pexels.com/photos/25748420/pexels-photo-25748420/free-photo-of-modelo-maqueta-moderno-minimalista.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART009' ), 'https://images.pexels.com/photos/21207686/pexels-photo-21207686/free-photo-of-chicas-con-gaviota.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART010' ), 'https://images.pexels.com/photos/7453205/pexels-photo-7453205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART011' ), 'https://images.pexels.com/photos/12189040/pexels-photo-12189040.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART012' ), 'https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART013' ), 'https://images.pexels.com/photos/10861640/pexels-photo-10861640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART014' ), 'https://images.pexels.com/photos/8796466/pexels-photo-8796466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART015' ), 'https://images.pexels.com/photos/7973078/pexels-photo-7973078.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART016' ), 'https://images.pexels.com/photos/1933589/pexels-photo-1933589.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART017' ), 'https://images.pexels.com/photos/10341113/pexels-photo-10341113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART018' ), 'https://images.pexels.com/photos/25315908/pexels-photo-25315908/free-photo-of-hombre-pantalones-cortos-shorts-retrato.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART019' ), 'https://images.pexels.com/photos/20078830/pexels-photo-20078830/free-photo-of-mujer-modelo-maqueta-en-pie.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
;

INSERT INTO Operaciones.Stock (IdArticulo, IdColor, IdTalle, Cantidad)
VALUES
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 1, 2, 20), -- Art 001, Rojo,
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 1, 3, 20), -- Art 001, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 2, 4, 12), -- Art 001, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 6, 5, 9), -- Art 001, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 3, 5, 20), -- Art 002, Verde, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 7, 5, 4), -- Art 002, Dorado, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART003' ), 4, 2, 7), -- Art 003, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART003' ), 5, 7, 1), -- Art 003, Negro, XXXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART004' ), 2, 3, 0), -- Art 004, Azul, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART004' ), 2, 4, 11), -- Art 004, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART005' ), 1, 3, 90), -- Del Art 001, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART005' ), 2, 4, 95), -- Del Art 001, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 1, 3, 25), -- Art 006, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 2, 4, 30), -- Art 006, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 3, 2, 10), -- Art 006, Verde, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART007' ), 4, 5, 15), -- Art 007, Amarrillo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART007' ), 5, 6, 20), -- Art 007, Negro, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART008' ), 2, 3, 50), -- Art 008, Azul, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART008' ), 6, 4, 40), -- Art 008, Blanco, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART009' ), 3, 4, 35), -- Art 009, Verde, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART009' ), 7, 5, 12), -- Art 009, Dorado, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART010' ), 4, 2, 45), -- Art 010, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART010' ), 1, 3, 20), -- Art 010, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART011' ), 2, 6, 30), -- Art 011, Azul, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART011' ), 3, 4, 10), -- Art 011, Verde, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART012' ), 4, 3, 25), -- Art 012, Amarrillo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART012' ), 1, 5, 15), -- Art 012, Rojo, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART013' ), 2, 4, 35), -- Art 013, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART013' ), 5, 5, 20), -- Art 013, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART014' ), 6, 2, 22), -- Art 014, Blanco, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART014' ), 3, 7, 18), -- Art 014, Verde, XXXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART015' ), 7, 3, 60), -- Art 015, Dorado, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART015' ), 4, 6, 10), -- Art 015, Amarrillo, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART016' ), 2, 4, 45), -- Art 016, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART016' ), 1, 5, 30), -- Art 016, Rojo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART017' ), 5, 3, 15), -- Art 017, Negro, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART017' ), 6, 4, 12), -- Art 017, Blanco, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART018' ), 3, 2, 40), -- Art 018, Verde, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART018' ), 2, 6, 20), -- Art 018, Azul, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART019' ), 7, 4, 15), -- Art 019, Dorado, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART019' ), 5, 5, 10), -- Art 019, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART020' ), 4, 2, 20), -- Art 020, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART020' ), 1, 3, 30) -- Art 020, Rojo, M
;


INSERT INTO Operaciones.Precios (IdArticulo, IdColor, IdTalle, Precio)
VALUES
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 7, 2, 9999), -- Art 002, Dorado, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 1, 3, 21000), -- Art 001, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 2, 4, 21000), -- Art 001, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART001' ), 6, 5, 21000), -- Art 001, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 3, 5, 14000), -- Art 002, Verde, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART002' ), 7, 5, 1700), -- Art 002, Dorado, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART003' ), 4, 2, 25000), -- Art 003, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART003' ), 5, 7, 19999), -- Art 003, Negro, XXXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART004' ), 2, 3, 23999), -- Art 004, Azul, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART004' ), 2, 4, 23999), -- Art 004, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART005' ), 1, 3, 999), -- Del Art 001, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART005' ), 2, 4, 995), -- Del Art 001, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 1, 3, 3500), -- Art 006, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 2, 4, 4000), -- Art 006, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART006' ), 3, 2, 3200), -- Art 006, Verde, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART007' ), 4, 5, 4500), -- Art 007, Amarrillo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART007' ), 5, 6, 4800), -- Art 007, Negro, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART008' ), 2, 3, 3500), -- Art 008, Azul, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART008' ), 6, 4, 3800), -- Art 008, Blanco, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART009' ), 3, 4, 5200), -- Art 009, Verde, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART009' ), 7, 5, 4200), -- Art 009, Dorado, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART010' ), 4, 2, 2100), -- Art 010, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART010' ), 1, 3, 3000), -- Art 010, Rojo, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART011' ), 2, 6, 8500), -- Art 011, Azul, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART011' ), 3, 4, 8200), -- Art 011, Verde, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART012' ), 4, 3, 6000), -- Art 012, Amarrillo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART012' ), 1, 5, 5500), -- Art 012, Rojo, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART013' ), 2, 4, 2500), -- Art 013, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART013' ), 5, 5, 2900), -- Art 013, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART014' ), 6, 2, 3900), -- Art 014, Blanco, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART014' ), 3, 7, 4300), -- Art 014, Verde, XXXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART015' ), 7, 3, 6000), -- Art 015, Dorado, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART015' ), 4, 6, 6800), -- Art 015, Amarrillo, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART016' ), 2, 4, 4000), -- Art 016, Azul, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART016' ), 1, 5, 5500), -- Art 016, Rojo, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART017' ), 5, 3, 3700), -- Art 017, Negro, M
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART017' ), 6, 4, 3900), -- Art 017, Blanco, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART018' ), 3, 2, 4600), -- Art 018, Verde, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART018' ), 2, 6, 5100), -- Art 018, Azul, XXL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART019' ), 7, 4, 4300), -- Art 019, Dorado, L
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART019' ), 5, 5, 4500), -- Art 019, Negro, XL
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART020' ), 4, 2, 3200), -- Art 020, Amarrillo, S
((select Id FROM Catalogo.Articulos WHERE Codigo = 'ART020' ), 1, 3, 3900)  -- Art 020, Rojo, M
;
