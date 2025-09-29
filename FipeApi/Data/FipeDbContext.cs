using FipeApi.Models;
using Microsoft.EntityFrameworkCore;

namespace FipeApi.Data
{
    public class FipeDbContext : DbContext
    {
        public FipeDbContext(DbContextOptions<FipeDbContext> options) : base(options)
        {
        }

        public DbSet<Marca> Marcas { get; set; }
        public DbSet<Modelo> Modelos { get; set; }
        public DbSet<Veiculo> Veiculos { get; set; }
    }
}