using Microsoft.Data.SqlClient;

namespace BankimeDev.Data;

public sealed class SqlConnectionFactory(string cadenaConexion)
{
    public SqlConnection Crear() => new(cadenaConexion);
}