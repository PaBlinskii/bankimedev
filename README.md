# BankimeDev

Core bancario construido con **ASP.NET Core 10** y **SQL Server**, enfocado en integridad transaccional:
toda operación que mueve dinero se ejecuta en stored procedures con transacción, control de concurrencia
y partida contable (partida doble).

## Stack
- **Backend:** ASP.NET Core 10 (MVC + Web API), C#
- **Base de datos:** SQL Server 2022 (stored procedures, esquemas por módulo, READ_COMMITTED_SNAPSHOT)
- **Acceso a datos:** Dapper
- **Pruebas:** xUnit

## Arquitectura
Solución en capas con dependencias en una sola dirección:

    BankimeDev.Web  ──▶  BankimeDev.Data  ──▶  BankimeDev.Core
      (MVC, API)          (repositorios)        (dominio, reglas puras)

- **Core** no depende de ningún otro proyecto: el dominio no conoce la base de datos ni la web.
- **Data** es la única capa que habla con SQL Server.
- La lógica de dinero vive en stored procedures transaccionales; los errores de negocio se propagan
  como códigos `THROW 50xxx` y se traducen a respuestas HTTP 422.

## Estructura
| Carpeta | Contenido |
|---|---|
| `src/BankimeDev.Core` | Modelos y reglas de negocio |
| `src/BankimeDev.Data` | Repositorios y acceso a datos |
| `src/BankimeDev.Web` | Pantallas, API y configuración |
| `tests/BankimeDev.Tests` | Pruebas unitarias |
| `database/` | Scripts SQL versionados (numerados) |

## Cómo ejecutarlo
1. Requisitos: .NET SDK 10 y SQL Server (Express o superior).
2. Ejecutar los scripts de `database/` en orden numérico.
3. `dotnet run --project src/BankimeDev.Web`

## Roadmap
- [x] Estructura de la solución y base de datos
- [ ] Catálogos y acceso a datos con Dapper
- [ ] Seguridad: usuarios, roles y autenticación
- [ ] Clientes y cuentas
- [ ] Contabilidad (partida doble)
- [ ] Caja: depósitos, retiros y arqueo
- [ ] Transferencias con idempotencia
- [ ] API REST con JWT y OpenAPI
- [ ] Créditos y matemática financiera
- [ ] Cierre diario y conciliación
- [ ] Mensajería asíncrona (patrón Outbox)
- [ ] Observabilidad

## Licencia
MIT