/* 003 - Catálogo de agencias del banco */
USE BankimeDev;
GO

CREATE TABLE cat.Agencias (
    AgenciaId      INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Agencias PRIMARY KEY,
    Codigo         VARCHAR(10)   NOT NULL CONSTRAINT UQ_Agencias_Codigo UNIQUE,
    Nombre         NVARCHAR(100) NOT NULL,
    Direccion      NVARCHAR(200) NULL,
    Telefono       VARCHAR(20)   NULL,
    Activa         BIT           NOT NULL CONSTRAINT DF_Agencias_Activa DEFAULT (1),
    FechaCreacion  DATETIME2(0)  NOT NULL CONSTRAINT DF_Agencias_FechaCreacion DEFAULT (SYSDATETIME())
);
GO

-- Datos de ejemplo: 4 agencias activas y 1 cerrada (para probar el filtro)
INSERT INTO cat.Agencias (Codigo, Nombre, Direccion, Telefono)
VALUES ('AG001', N'Agencia Central Zona 10', N'Avenida La Reforma 12-01, zona 10', '2420-0001'),
       ('AG002', N'Agencia Zona 1',          N'6a. Avenida 9-30, zona 1',          '2420-0002'),
       ('AG003', N'Agencia Mixco',           N'Calzada Roosevelt 33-86, zona 11', '2420-0003'),
       ('AG004', N'Agencia Quetzaltenango',  N'14 Avenida 3-25, zona 1, Xela',     '7765-0004');

INSERT INTO cat.Agencias (Codigo, Nombre, Activa)
VALUES ('AG099', N'Agencia Antigua (cerrada)', 0);
GO