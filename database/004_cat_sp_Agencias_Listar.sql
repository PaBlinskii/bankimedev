/* 004 - Lista las agencias; por defecto sólo las activas */
USE BankimeDev;
GO

CREATE OR ALTER PROCEDURE cat.sp_Agencias_Listar
    @SoloActivas BIT = 1          -- parámetro OPCIONAL: si no se envía, vale 1
AS
BEGIN
    SET NOCOUNT ON;               -- no enviar mensajes "(n rows affected)" al cliente

    SELECT AgenciaId, Codigo, Nombre, Direccion, Telefono, Activa, FechaCreacion
    FROM cat.Agencias
    WHERE @SoloActivas = 0 OR Activa = 1     -- 0 = todas; 1 = sólo las activas
    ORDER BY Codigo;
END
GO