-- Set de datos
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Categorias (Id, Codigo, Descripcion) VALUES 
(1, 'DEP', 'Deportiva'), 
(2, 'FRML', 'Formal'), 
(3, 'ACCS', 'Accesorios'), 
(4, 'CAZZU', 'Casual')
;

INSERT INTO Catalogo.Marcas (Id, Codigo, Descripcion, Estado)
VALUES 
(2, 'MARC02', 'Nike', 1),
(3, 'MARC03', 'Adidas', 1);
(4, 'MARC04', 'Patagonia', 1),
(5, 'MARC05', 'The North Face', 1);


INSERT INTO Catalogo.Tipos (Id, Codigo, Descripcion) VALUES 
(1, 'CAMI-C-TA', 'Camisetas'), 
(2, 'PANTA', 'Pantalon'), 
(3, 'CAM', 'Camisa'), 
(4, 'VSTD', 'Vestido')
;




INSERT INTO Catalogo.Articulos (Id, Codigo, IdTipo, IdMarca, IdCategoria, Descripcion, Estado)
VALUES 
(1, 'ART001', 1, 1, 1, 'Camiseta Deportiva', 1),
(2, 'ART002', 2, 2, 1, 'Pantalón Casual', 1),
(3, 'ART003', 3, 3, 2, 'Camisa Formal', 1),
(4, 'ART004', 3, 3, 2, 'Vestido Casual', 1);


INSERT INTO Catalogo.ImagenArticulos (Id, IdArticulo, UrlImagen)
VALUES 
(1, 1, 'https://images.pexels.com/photos/2560894/pexels-photo-2560894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 2, 'https://images.pexels.com/photos/7716960/pexels-photo-7716960.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 3, 'https://images.pexels.com/photos/7447363/pexels-photo-7447363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 4, 'https://images.pexels.com/photos/29096407/pexels-photo-29096407/free-photo-of-mujer-elegante-con-vestido-naranja-de-riverside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
