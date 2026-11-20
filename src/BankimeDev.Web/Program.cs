using BankimeDev.Data;
using BankimeDev.Data.Repositorios;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

var cadena = builder.Configuration.GetConnectionString("BankimeDev") ?? throw new InvalidOperationException("Falta la cadena de conexión 'BankimeDev' en appsettings.json");
builder.Services.AddSingleton(new SqlConnectionFactory(cadena));
builder.Services.AddScoped<CatalogoRepositorio>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
