-- Set de datos pre-cargados en el sistema.
USE XECOMMERCE;
GO

INSERT INTO Catalogo.Provincias ( Codigo, Descripcion) VALUES
('CABA', 'Ciudad Autónoma de Buenos Aires'),
('BUE', 'Buenos Aires'),
('CAT', 'Catamarca'),
('CHA', 'Chaco'),
('CHU', 'Chubut'),
('COR', 'Córdoba'),
('COE', 'Corrientes'),
('ERI', 'Entre Ríos'),
('FOR', 'Formosa'),
('JUJ', 'Jujuy'),
('LAP', 'La Pampa'),
('LAR', 'La Rioja'),
('MEN', 'Mendoza'),
('MIS', 'Misiones'),
('NEU', 'Neuquén'),
('RNE', 'Río Negro'),
('SAL', 'Salta'),
('SJU', 'San Juan'),
('SLU', 'San Luis'),
('SCR', 'Santa Cruz'),
('SFE', 'Santa Fe'),
('SDE', 'Santiago del Estero'),
('TDF', 'Tierra del Fuego'),
('TUC', 'Tucumán');

INSERT INTO Catalogo.Ciudades ( Codigo, Descripcion) VALUES
('BA-BUE', 'Buenos Aires'),
('BA-LP', 'La Plata'),
('BA-MDP', 'Mar del Plata'),
('CT-SFV', 'San Fernando del Valle de Catamarca'),
('CT-BEL', 'Belén'),
('CT-TIN', 'Tinogasta'),
('CH-RES', 'Resistencia'),
('CH-SP', 'Sáenz Peña'),
('CH-VAN', 'Villa Ángela'),
('CHT-RW', 'Rawson'),
('CHT-CR', 'Comodoro Rivadavia'),
('CHT-PM', 'Puerto Madryn'),
('CB-COR', 'Córdoba'),
('CB-RC', 'Río Cuarto'),
('CB-VCP', 'Villa Carlos Paz'),
('CN-CTE', 'Corrientes'),
('CN-GOA', 'Goya'),
('CN-PAS', 'Paso de los Libres'),
('ER-PAR', 'Paraná'),
('ER-CON', 'Concordia'),
('ER-GUA', 'Gualeguaychú'),
('FO-FOR', 'Formosa'),
('FO-CLA', 'Clorinda'),
('FO-PIR', 'Pirané'),
('JU-SJ', 'San Salvador de Jujuy'),
('JU-PAL', 'Palpalá'),
('JU-LL', 'La Quiaca'),
('LP-SR', 'Santa Rosa'),
('LP-GEN', 'General Pico'),
('LP-RT', 'Realicó'),
('LR-LR', 'La Rioja'),
('LR-CHL', 'Chilecito'),
('LR-AIM', 'Aimogasta'),
('MZ-MDZ', 'Mendoza'),
('MZ-SRT', 'San Rafael'),
('MZ-LUJ', 'Luján de Cuyo'),
('MI-POS', 'Posadas'),
('MI-OBA', 'Oberá'),
('MI-ELD', 'Eldorado'),
('NQ-NQN', 'Neuquén'),
('NQ-CUT', 'Cutral Có'),
('NQ-ZAP', 'Zapala'),
('RN-VDE', 'Viedma'),
('RN-BAR', 'San Carlos de Bariloche'),
('RN-GRA', 'General Roca'),
('SA-SAL', 'Salta'),
('SA-OR', 'Orán'),
('SA-TAR', 'Tartagal'),
('SJ-SJ', 'San Juan'),
('SJ-ALB', 'Albardón'),
('SJ-CAU', 'Caucete'),
('SL-SL', 'San Luis'),
('SL-MR', 'Villa Mercedes'),
('SL-JUI', 'Justo Daract'),
('SC-RG', 'Río Gallegos'),
('SC-CL', 'Caleta Olivia'),
('SC-PQI', 'Puerto Deseado'),
('SF-SF', 'Santa Fe'),
('SF-ROS', 'Rosario'),
('SF-RA', 'Rafaela'),
('SE-SGO', 'Santiago del Estero'),
('SE-LBA', 'La Banda'),
('SE-TDL', 'Termas de Río Hondo'),
('TF-USH', 'Ushuaia'),
('TF-RGA', 'Río Grande'),
('TF-TOL', 'Tolhuin'),
('TU-TUC', 'San Miguel de Tucumán'),
('TU-TAF', 'Tafí Viejo'),
('TU-CON', 'Concepción');

INSERT INTO Catalogo.EntidadesFinancieras ( Codigo, Descripcion) VALUES
('BNA', 'Banco Nación'),
('BMA', 'Banco Macro'),
('BFR', 'Banco Francés'),
('GSA', 'Galicia'),
('SHB', 'Santander Río');

INSERT INTO Catalogo.MediosPago ( IdEntidadFinanciera, Codigo, Descripcion) VALUES
(NULL, 'EFEC', 'Efectivo'),
(NULL, 'MPAG', 'Mercado Pago');

INSERT INTO Catalogo.Talles(Codigo, Descripcion, Estado) VALUES
('XS', 'Extra small', 1),
('S', 'Small', 1),
('M', 'Medium', 1),
('L', 'Large', 1),
('XL', 'Extra large', 1),
('XXL', 'Double extra large', 1),
('XXXL', 'Triple extra large', 1);


INSERT INTO Catalogo.Marcas ( Codigo, Descripcion) VALUES
('ADDAS', 'Adidas'),
('NKE', 'Nike'),
('PUM', 'Puma'),
('EVRLTS', 'Everlast'),
('UMBR', 'Umbro')
;

INSERT INTO Catalogo.Tipos ( Codigo, Descripcion) VALUES
( 'CAMI-C-TA', 'Camisetas'),
( 'PANTA', 'Pantalon'),
( 'CAM', 'Camisa'),
( 'VSTD', 'Vestido'),
('REM','Remera'),
('BUZ','Buzo'),
('CAMP','Campera'),
('JNS','Jeans')
;

INSERT INTO Catalogo.Categorias ( Codigo, Descripcion) VALUES
('DEP', 'Deportiva'),
('FRML', 'Formal'),
('ACCS', 'Accesorios'),
('CAZZU', 'Casual')
;

INSERT INTO Catalogo.Colores( Codigo, Descripcion) VALUES
('RJO','Rojo'),
('AZL','Azul'),
('VRD', 'Verde'),
('AMA', 'Amarrillo'),
('NGRO', 'Negro'),
('BLCO','Blanco'),
('DRDO','Dorado')
;