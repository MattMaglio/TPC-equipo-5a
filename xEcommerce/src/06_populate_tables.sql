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


INSERT INTO Catalogo.EntidadesFinancieras ( Codigo, Descripcion) VALUES
('BNA', 'Banco Nación'),
('BMA', 'Banco Macro'),
('BFR', 'Banco Francés'),
('GSA', 'Galicia'),
('SHB', 'Santander Río');

INSERT INTO Catalogo.MediosPago ( IdEntidadFinanciera, Codigo, Descripcion) VALUES
(NULL, 'EFEC', 'Efectivo'),
(NULL, 'MPAG', 'Mercado Pago');

INSERT INTO Catalogo.Usuarios (Usuario, Pass, Estado, TipoUser) VALUES
('Admin', 'Admin123', 1, 2);