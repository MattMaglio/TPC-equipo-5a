-- Drop:
/*
USE master;
DROP DATABASE XECOMMERCE;
*/

CREATE DATABASE XECOMMERCE;
GO
USE XECOMMERCE;
GO

CREATE SCHEMA Catalogo;
GO
CREATE SCHEMA Operaciones;
GO
--CREATE SCHEMA Usuario;
--GO
CREATE SCHEMA Facturacion;
GO
--CREATE SCHEMA Shipping;
--GO

-- Dim relacionadas a los Productos

DROP TABLE IF EXISTS Catalogo.Tipos;
CREATE TABLE Catalogo.Tipos (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Marcas;
CREATE TABLE Catalogo.Marcas (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Categorias;
CREATE TABLE Catalogo.Categorias (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Colores;
CREATE TABLE Catalogo.Colores (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Talles;
CREATE TABLE Catalogo.Talles (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Articulos;
CREATE TABLE Catalogo.Articulos (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(25) NOT NULL,
    IdTipo INT,
    IdMarca INT,
    IdCategoria INT,
    Detalle VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdTipo) REFERENCES Catalogo.Tipos(Id),
    FOREIGN KEY (IdMarca) REFERENCES Catalogo.Marcas(Id),
    FOREIGN KEY (IdCategoria) REFERENCES Catalogo.Categorias(Id)
);

DROP TABLE IF EXISTS Catalogo.ImagenArticulos
CREATE TABLE Catalogo.ImagenArticulos (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdArticulo INT NOT NULL,
    UrlImagen VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Catalogo.Articulos(Id),
);

-- Dimensiones Gral. precargadas del sistema
DROP TABLE IF EXISTS Catalogo.Ciudades;
CREATE TABLE Catalogo.Ciudades (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS Catalogo.Provincias;
CREATE TABLE Catalogo.Provincias (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

-- Cliente
DROP TABLE IF EXISTS Catalogo.Clientes;
CREATE TABLE Catalogo.Clientes (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    DNI VARCHAR(10) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS Catalogo.Direcciones;
CREATE TABLE Catalogo.Direcciones (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    Calle VARCHAR(255) NOT NULL,
    Numero SMALLINT NOT NULL,
    CodigoPostal VARCHAR (10) NOT NULL,
    IdCiudad INT NOT NULL,
    IdProvincia INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
    FOREIGN KEY (IdCliente) REFERENCES Catalogo.Clientes(Id),
    FOREIGN KEY (IdCiudad) REFERENCES Catalogo.Ciudades(Id),
    FOREIGN KEY (IdProvincia) REFERENCES Catalogo.Provincias(Id)
);

DROP TABLE IF EXISTS Catalogo.Usuarios;
CREATE TABLE Catalogo.Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Usuario VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    Pass VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NULL,
    apellido VARCHAR(50) NULL,
	dni VARCHAR (10) NULL,
    TipoUser INT NOT NULL,
    Estado BIT NOT NULL
);

DROP TABLE IF EXISTS Facturacion.Ordenes;
CREATE TABLE Facturacion.Ordenes (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE NOT NULL,
    Usuario VARCHAR(25) NOT NULL,
    TieneEnvio BIT NOT NULL,
    TieneRetiro BIT NOT NULL,
    Entregado BIT NOT NULL,
    ComprobanteFiscal VARCHAR(15) NULL,
    MontoTotal MONEY NOT NULL,
    Pagado BIT NOT NULL,
);

DROP TABLE IF EXISTS Facturacion.DetallesOrdenes;
CREATE TABLE Facturacion.DetallesOrdenes (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdOrden INT NOT NULL,
    NumeroLinea INT NOT NULL,
    Articulo VARCHAR (25) NOT NULL,
    Color VARCHAR (25) NOT NULL,
    Talle VARCHAR (25) NOT NULL,
    Precio MONEY NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdOrden) REFERENCES Facturacion.Ordenes(Id)
);

-- Tablas de hechos (Operaciones)
DROP TABLE IF EXISTS Operaciones.Stock;
CREATE TABLE Operaciones.Stock (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdArticulo INT,
    IdColor INT,
    IdTalle INT,
    Cantidad INT NOT NULL CHECK (Cantidad >= 0),
    FOREIGN KEY (IdArticulo) REFERENCES Catalogo.Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Catalogo.Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Catalogo.Talles(Id),
);

DROP TABLE IF EXISTS Operaciones.Precios;
CREATE TABLE Operaciones.Precios (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdArticulo INT NOT NULL,
    IdColor INT NOT NULL,
    IdTalle INT NOT NULL,
    Precio FLOAT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Catalogo.Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Catalogo.Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Catalogo.Talles(Id)
);

GO
/* DEFINICION DE LOS TRIGGERS */
CREATE OR ALTER TRIGGER Catalogo.TR_EliminarArticulo ON Catalogo.Articulos
AFTER UPDATE
AS
BEGIN
    BEGIN TRY
        -- Inicia la transacción
        BEGIN TRANSACTION;

        -- Primero, eliminamos los registros de Stock y Precios relacionados
        DELETE FROM Operaciones.Stock
        WHERE IdArticulo IN (SELECT Id FROM INSERTED);

        DELETE FROM Operaciones.Precios
        WHERE IdArticulo IN (SELECT Id FROM INSERTED);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertimos la transacción
        ROLLBACK TRANSACTION;
    END CATCH
END;
GO

/* -- Tabla antigua descontinuada
-- Tablas relacionadas al envio.
CREATE TABLE Shipping.DetallesEnvio (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    NumeroLinea INT NOT NULL,
    IdArticulo INT,
    IdColor INT,
    IdTalle INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Catalogo.Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Catalogo.Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Catalogo.Talles(Id)
);

-- Shipping.EstadoEnvio <=> Precargada en el sistema.
CREATE TABLE Shipping.EstadoEnvio (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR (255) NOT NULL
)


CREATE TABLE Shipping.Couriers (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    --IdTransporte INT,
    Legajo VARCHAR (10) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
    --FOREIGN KEY (IdTransporte) REFERENCES Transportes(Id)
);

CREATE TABLE Shipping.Envios (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdDetalleEnvio INT,
    IdCourier INT,
    IdDireccion INT,
    IdEstadoEnvio INT,
    FOREIGN KEY (IdDetalleEnvio) REFERENCES Shipping.DetallesEnvio(Id),
    FOREIGN KEY (IdCourier) REFERENCES Shipping.Couriers(Id),
    FOREIGN KEY (IdDireccion) REFERENCES Catalogo.Direcciones(Id),
    FOREIGN KEY (IdEstadoEnvio) REFERENCES Shipping.EstadoEnvio(Id)
);

-- Tablas relacionadas a la Facturacion.
CREATE TABLE Facturacion.DetallesFactura (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    NumeroLinea INT NOT NULL,
    IdArticulo INT NOT NULL,
    IdColor INT NOT NULL,
    IdTalle INT NOT NULL,
    Precio MONEY NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Catalogo.Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Catalogo.Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Catalogo.Talles(Id)
);

CREATE TABLE Facturacion.DetallesPago (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdMedioDePago INT,
    Monto MONEY NOT NULL,
    FOREIGN KEY (IdMedioDePago) REFERENCES Catalogo.MediosPago(Id)
);

CREATE TABLE Facturacion.Facturas (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdDetalleFactura INT NOT NULL,
    IdDetallePago INT NOT NULL,
    IdEnvio INT NOT NULL,
    IdCliente INT NOT NULL,
    Letra CHAR(1) NOT NULL,
    Fecha DATE NOT NULL,
    PuntoDeVenta SMALLINT NOT NULL,
    Numero INT NOT NULL,
    MontoTotal MONEY NOT NULL,
    IVA FLOAT NOT NULL,
    FOREIGN KEY (IdDetalleFactura) REFERENCES Facturacion.DetallesFactura(Id),
    FOREIGN KEY (IdDetallePago) REFERENCES Facturacion.DetallesPago(Id),
    FOREIGN KEY (IdEnvio) REFERENCES Shipping.Envios(Id),
    FOREIGN KEY (IdCliente) REFERENCES Catalogo.Clientes(Id)
);
*/
-- Tablas de acceso de usuarios y perfiles de seguridad.
-- Tabla antigua descontinuada
/*
CREATE TABLE Usuario.NivelAcceso (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    NivelAcceso INT NOT NULL,
    DescripcionAcceso VARCHAR (255),
    Estado BIT NOT NULL DEFAULT 1
);

CREATE TABLE Usuario.PerfilUsuario (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    Usuario VARCHAR (25) NOT NULL,
    Contrasenia VARCHAR (25) NOT NULL,
    NivelAcceso INT NOT NULL,
    Estado BIT NOT NULL DEFAULT 1
    FOREIGN KEY (NivelAcceso) REFERENCES Usuario.NivelAcceso(Id),
    FOREIGN KEY (IdCliente) REFERENCES Catalogo.Clientes(Id)
);
GO

CREATE TABLE TiposTransporte (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    CargaMaxima FLOAT,
    Descripcion VARCHAR(255)
);

CREATE TABLE Transportes (
    Id INT NOT NULL PRIMARY KEY,
    IdTipo INT,
    Patente VARCHAR (10) NOT NULL,
    FOREIGN KEY (IdTipo) REFERENCES TiposTransporte(Id)
);

CREATE TABLE Catalogo.EntidadesFinancieras (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Catalogo.MediosPago (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IdEntidadFinanciera INT,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdEntidadFinanciera) REFERENCES Catalogo.EntidadesFinancieras(Id)
);
*/