/* 002 - Esquemas: carpetas lógicas para ordenar los objetos por módulo */
USE BankimeDev;     -- a partir de aquí todo se crea dentro de BankimeDev (y no en master)
GO

CREATE SCHEMA cat AUTHORIZATION dbo;    -- catalogos: agencias, parametros, productos
GO
CREATE SCHEMA seg AUTHORIZATION dbo;    -- seguridad: roles, usuarios, accesos
GO
CREATE SCHEMA cli AUTHORIZATION dbo;    -- clientes
GO
CREATE SCHEMA cta AUTHORIZATION dbo;    -- cuentas y movimientos
GO
CREATE SCHEMA aud AUTHORIZATION dbo;    -- auditoria y bitacora
GO