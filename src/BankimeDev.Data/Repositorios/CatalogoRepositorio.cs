using BankimeDev.Core.Modelos;

namespace BankimeDev.Data.Repositorios;

public class CatalogoRepositorio(SqlConnectionFactory factory) : RepositorioBase(factory)
{
    public Task<List<Agencia>> Agencias(bool soloActivas = true) => Lista<Agencia>("cat.sp_Agencias_Listar", new { soloActivas = soloActivas });
}