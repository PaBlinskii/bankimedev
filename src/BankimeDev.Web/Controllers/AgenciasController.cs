using BankimeDev.Data.Repositorios;
using Microsoft.AspNetCore.Mvc;

namespace BankimeDev.Web.Controllers;

public class AgenciasController(CatalogoRepositorio catalogos) : Controller
{
    public async Task<IActionResult> Index(bool todas = false)
    {
        var agencias = await catalogos.Agencias(soloActivas: !todas);
        ViewBag.Todas = todas;
        return View(agencias);
    }
}