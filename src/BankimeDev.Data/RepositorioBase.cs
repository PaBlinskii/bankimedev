using System.Data;
using System.Security.Cryptography;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;

namespace BankimeDev.Data;

public abstract class RepositorioBase(SqlConnectionFactory factory)
{
    protected const CommandType SP = CommandType.StoredProcedure;
    // Atajo para simplificar el llamado al SP

    protected async Task<T> Ejecutar<T>(Func<SqlConnection, Task<T>> accion)
    {
        await using var cn = factory.Crear();
        return await accion(cn);
    }

    protected Task<List<T>> Lista<T>(string sp, object? parametros = null) => Ejecutar(async cn => (await cn.QueryAsync<T>(sp, parametros, commandType: SP)).AsList());

    protected Task<T?> Uno<T>(string sp, object? parametros = null) => Ejecutar(cn => cn.QueryFirstOrDefaultAsync<T>(sp, parametros, commandType: SP));

}