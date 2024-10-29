-- Set de datos pre-cargados en el sistema.
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Provincias (Id, Codigo, Descripcion) VALUES
(1, 'CABA', 'Ciudad Autónoma de Buenos Aires'),
(2, 'BUE', 'Buenos Aires'),
(3, 'CAT', 'Catamarca'),
(4, 'CHA', 'Chaco'),
(5, 'CHU', 'Chubut'),
(6, 'COR', 'Córdoba'),
(7, 'COE', 'Corrientes'),
(8, 'ERI', 'Entre Ríos'),
(9, 'FOR', 'Formosa'),
(10, 'JUJ', 'Jujuy'),
(11, 'LAP', 'La Pampa'),
(12, 'LAR', 'La Rioja'),
(13, 'MEN', 'Mendoza'),
(14, 'MIS', 'Misiones'),
(15, 'NEU', 'Neuquén'),
(16, 'RNE', 'Río Negro'),
(17, 'SAL', 'Salta'),
(18, 'SJU', 'San Juan'),
(19, 'SLU', 'San Luis'),
(20, 'SCR', 'Santa Cruz'),
(21, 'SFE', 'Santa Fe'),
(22, 'SDE', 'Santiago del Estero'),
(23, 'TDF', 'Tierra del Fuego'),
(24, 'TUC', 'Tucumán');

INSERT INTO Catalogo.Ciudades (Id, Codigo, Descripcion) VALUES
(1, 'BA-BUE', 'Buenos Aires'),
(2, 'BA-LP', 'La Plata'),
(3, 'BA-MDP', 'Mar del Plata'),
(4, 'CT-SFV', 'San Fernando del Valle de Catamarca'),
(5, 'CT-BEL', 'Belén'),
(6, 'CT-TIN', 'Tinogasta'),
(7, 'CH-RES', 'Resistencia'),
(8, 'CH-SP', 'Sáenz Peña'),
(9, 'CH-VAN', 'Villa Ángela'),
(10, 'CHT-RW', 'Rawson'),
(11, 'CHT-CR', 'Comodoro Rivadavia'),
(12, 'CHT-PM', 'Puerto Madryn'),
(13, 'CB-COR', 'Córdoba'),
(14, 'CB-RC', 'Río Cuarto'),
(15, 'CB-VCP', 'Villa Carlos Paz'),
(16, 'CN-CTE', 'Corrientes'),
(17, 'CN-GOA', 'Goya'),
(18, 'CN-PAS', 'Paso de los Libres'),
(19, 'ER-PAR', 'Paraná'),
(20, 'ER-CON', 'Concordia'),
(21, 'ER-GUA', 'Gualeguaychú'),
(22, 'FO-FOR', 'Formosa'),
(23, 'FO-CLA', 'Clorinda'),
(24, 'FO-PIR', 'Pirané'),
(25, 'JU-SJ', 'San Salvador de Jujuy'),
(26, 'JU-PAL', 'Palpalá'),
(27, 'JU-LL', 'La Quiaca'),
(28, 'LP-SR', 'Santa Rosa'),
(29, 'LP-GEN', 'General Pico'),
(30, 'LP-RT', 'Realicó'),
(31, 'LR-LR', 'La Rioja'),
(32, 'LR-CHL', 'Chilecito'),
(33, 'LR-AIM', 'Aimogasta'),
(34, 'MZ-MDZ', 'Mendoza'),
(35, 'MZ-SRT', 'San Rafael'),
(36, 'MZ-LUJ', 'Luján de Cuyo'),
(37, 'MI-POS', 'Posadas'),
(38, 'MI-OBA', 'Oberá'),
(39, 'MI-ELD', 'Eldorado'),
(40, 'NQ-NQN', 'Neuquén'),
(41, 'NQ-CUT', 'Cutral Có'),
(42, 'NQ-ZAP', 'Zapala'),
(43, 'RN-VDE', 'Viedma'),
(44, 'RN-BAR', 'San Carlos de Bariloche'),
(45, 'RN-GRA', 'General Roca'),
(46, 'SA-SAL', 'Salta'),
(47, 'SA-OR', 'Orán'),
(48, 'SA-TAR', 'Tartagal'),
(49, 'SJ-SJ', 'San Juan'),
(50, 'SJ-ALB', 'Albardón'),
(51, 'SJ-CAU', 'Caucete'),
(52, 'SL-SL', 'San Luis'),
(53, 'SL-MR', 'Villa Mercedes'),
(54, 'SL-JUI', 'Justo Daract'),
(55, 'SC-RG', 'Río Gallegos'),
(56, 'SC-CL', 'Caleta Olivia'),
(57, 'SC-PQI', 'Puerto Deseado'),
(58, 'SF-SF', 'Santa Fe'),
(59, 'SF-ROS', 'Rosario'),
(60, 'SF-RA', 'Rafaela'),
(61, 'SE-SGO', 'Santiago del Estero'),
(62, 'SE-LBA', 'La Banda'),
(63, 'SE-TDL', 'Termas de Río Hondo'),
(64, 'TF-USH', 'Ushuaia'),
(65, 'TF-RGA', 'Río Grande'),
(66, 'TF-TOL', 'Tolhuin'),
(67, 'TU-TUC', 'San Miguel de Tucumán'),
(68, 'TU-TAF', 'Tafí Viejo'),
(69, 'TU-CON', 'Concepción');

INSERT INTO Catalogo.EntidadesFinancieras (Id, Codigo, Descripcion) VALUES
(1, 'BNA', 'Banco Nación'),
(2, 'BMA', 'Banco Macro'),
(3, 'BFR', 'Banco Francés'),
(4, 'GSA', 'Galicia'),
(5, 'SHB', 'Santander Río');

INSERT INTO Catalogo.MediosPago (Id, IdEntidadFinanciera, Codigo, Descripcion) VALUES
(1, NULL, 'EFEC', 'Efectivo'),
(2, NULL, 'MPAG', 'Mercado Pago');

INSERT INTO Catalogo.Talles(Id,Codigo, Descripcion, Estado) VALUES
(1,'XS', 'Extra small', 1),
(2,'S', 'Small', 1),
(3,'M', 'Medium', 1),
(4,'L', 'Large', 1),
(5,'XL', 'Extra large', 1),
(6,'XXL', 'Double extra large', 1),
(7,'XXXL', 'Triple extra large', 1);


INSERT INTO Catalogo.Marcas (Id, Codigo, Descripcion) VALUES
(1, 'ADDAS', 'Adidas'),
(2, 'NKE', 'Nike'),
(3, 'PUM', 'Puma'),
(4, 'EVRLTS', 'Everlast'),
(5, 'UMBR', 'Umbro')
;

INSERT INTO Catalogo.Tipos (Id, Codigo, Descripcion) VALUES
(1, 'CAMI-C-TA', 'Camisetas'),
(2, 'PANTA', 'Pantalon'),
(3, 'CAM', 'Camisa'),
(4, 'VSTD', 'Vestido'),
(5,'REM','Remera'),
(6,'BUZ','Buzo'),
(7,'CAMP','Campera'),
(8,'JNS','Jeans')
;

	INSERT INTO Catalogo.Categorias (Id, Codigo, Descripcion) VALUES
(1, 'DEP', 'Deportiva'),
(2, 'FRML', 'Formal'),
(3, 'ACCS', 'Accesorios'),
(4, 'CAZZU', 'Casual')
;

INSERT INTO Catalogo.Colores(Id, Codigo, Descripcion) VALUES
(1, 'RJO','Rojo'),
(2, 'AZL','Azul'),
(3, 'VRD', 'Verde'),
(4, 'AMA', 'Amarrillo'),
(5, 'NGRO', 'Negro'),
(6, 'BLCO','Blanco'),
(7, 'DRDO','Dorado')
;