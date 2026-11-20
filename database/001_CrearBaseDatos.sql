/* 001 - Crear la base de datos BankimeDev */

-- 1) Crear la base. SQL Server usa la carpeta de datos por defecto de la instancia.
CREATE DATABASE BankimeDev
GO
-- 2) Lecturas por versión de fila (RCSI).
--    Sin esto, un reporte que lee mucho BLOQUEA a quien quiere actualizar (y viceversa).
--    Con esto, el lector ve la última versión confirmada y nadie espera.
--    WITH ROLLBACK IMMEDIATE: si hay conexiones abiertas a la base, las corta para poder aplicar el cambio.
ALTER DATABASE BankimeDev SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK INMEDIATE;
GO