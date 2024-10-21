-- Drop:
/*
USE master;
DROP DATABASE XECOMMERCE;
*/

CREATE DATABASE XECOMMERCE;
USE XECOMMERCE;

CREATE TABLE Tipos (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Ciudades (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Provincias (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE EntidadesFinancieras (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Marcas (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Categorias (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Colores (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Talles (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Clientes (
    Id INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    DNI SMALLINT,
    Email VARCHAR(255)
);

CREATE TABLE Articulos (
    Id INT NOT NULL PRIMARY KEY,
    IdTipo INT,
    IdMarca INT,
    IdCategoria INT,
    Descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdTipo) REFERENCES Tipos(Id),
    FOREIGN KEY (IdMarca) REFERENCES Marcas(Id),
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id)
);

CREATE TABLE Stock (
    Id INT NOT NULL PRIMARY KEY,
    IdArticulo INT,
    IdColor INT,
    IdTalle INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Talles(Id)
);

CREATE TABLE DetallesFactura (
    Id INT NOT NULL PRIMARY KEY,
    NumeroLinea INT NOT NULL,
    IdArticulo INT,
    IdColor INT,
    IdTalle INT,
    Precio MONEY NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Talles(Id)
);

CREATE TABLE MediosPago (
    Id INT NOT NULL PRIMARY KEY,
    IdEntidadFinanciera INT,
    Descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (IdEntidadFinanciera) REFERENCES EntidadesFinancieras(Id)
);

CREATE TABLE DetallesPago (
    Id INT NOT NULL PRIMARY KEY,
    IdMedioDePago INT,
    Monto MONEY NOT NULL,
    FOREIGN KEY (IdMedioDePago) REFERENCES MediosPago(Id)
);

CREATE TABLE EstadoEnvio (
    Id INT NOT NULL PRIMARY KEY,
    Codigo VARCHAR (10) NOT NULL,
    Descripcion VARCHAR (255) NOT NULL
)

CREATE TABLE DetallesEnvio (
    Id INT NOT NULL PRIMARY KEY,
    NumeroLinea INT NOT NULL,
    IdArticulo INT,
    IdColor INT,
    IdTalle INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(Id),
    FOREIGN KEY (IdColor) REFERENCES Colores(Id),
    FOREIGN KEY (IdTalle) REFERENCES Talles(Id)
);

CREATE TABLE Couriers (
    Id INT NOT NULL PRIMARY KEY,
    --IdTransporte INT,
    Legajo VARCHAR (10) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    --FOREIGN KEY (IdTransporte) REFERENCES Transportes(Id)
);

CREATE TABLE Direcciones (
    Id INT NOT NULL PRIMARY KEY,
    IdCliente INT,
    Calle VARCHAR(255) NOT NULL,
    Numero SMALLINT,
    CodigoPostal VARCHAR (10) NOT NULL,
    IdCiudad INT,
    IdProvincia INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(Id),
    FOREIGN KEY (IdCiudad) REFERENCES Ciudades(Id),
    FOREIGN KEY (IdProvincia) REFERENCES Provincias(Id)
);

CREATE TABLE Envios (
    Id INT NOT NULL PRIMARY KEY,
    IdDetalleEnvio INT,
    IdCourier INT,
    IdDireccion INT,
    IdEstadoEnvio INT,
    FOREIGN KEY (IdDetalleEnvio) REFERENCES DetallesEnvio(Id),
    FOREIGN KEY (IdCourier) REFERENCES Couriers(Id),
    FOREIGN KEY (IdDireccion) REFERENCES Direcciones(Id),
    FOREIGN KEY (IdEstadoEnvio) REFERENCES EstadoEnvio(Id)
);

CREATE TABLE Facturas (
    Id INT NOT NULL PRIMARY KEY,
    IdDetalleFactura INT,
    IdDetallePago INT,
    IdEnvio INT,
    IdCliente INT,
    Letra CHAR(1),
    Fecha DATE,
    PuntoDeVenta SMALLINT,
    Numero INT,
    MontoTotal MONEY,
    IVA FLOAT,
    FOREIGN KEY (IdDetalleFactura) REFERENCES DetallesFactura(Id),
    FOREIGN KEY (IdDetallePago) REFERENCES DetallesPago(Id),
    FOREIGN KEY (IdEnvio) REFERENCES Envios(Id),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(Id)
);

-- Tabla antigua descontinuada
/*
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
*/

CREATE TABLE NivelAcceso (
    Id INT NOT NULL PRIMARY KEY,
    NivelAcceso INT NOT NULL,
    DescripcionAcceso VARCHAR (255) 
);

CREATE TABLE PerfilUsuario (
    Id INT NOT NULL PRIMARY KEY,
    Usuario VARCHAR (25) NOT NULL,
    Contrasenia VARCHAR (25) NOT NULL,
    NivelAccesso INT NOT NULL
    FOREIGN KEY (NivelAccesso) REFERENCES NivelAcceso(Id),
);