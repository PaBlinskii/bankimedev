namespace BankimeDev.Core.Modelos;

public class Agencia
{
    public int AgenciaId { get; set; }
    public string Codigo { get; set; } = "";
    public string Nombre { get; set; } = "";
    public string? Direccion { get; set; }
    public string? Telefono { get; set; }
    public bool Activa { get; set; }
    public DateTime FechaCreacion { get; set; }

}