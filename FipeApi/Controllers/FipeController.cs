using FipeApi.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FipeApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FipeController : ControllerBase
    {
        private readonly FipeDbContext _context;

        public FipeController(FipeDbContext context)
        {
            _context = context;
        }

        [HttpGet("marcas/{tipoVeiculo}")]
        public async Task<IActionResult> GetMarcas(string tipoVeiculo)
        {
            var marcas = await _context.Marcas
                .Where(m => m.TipoVeiculo == tipoVeiculo)
                .OrderBy(m => m.Nome)
                .ToListAsync();
            
            return Ok(marcas);
        }

        [HttpGet("modelos/{tipoVeiculo}/{marcaId}")]
        public async Task<IActionResult> GetModelos(string tipoVeiculo, int marcaId)
        {
            var modelos = await _context.Modelos
                .Where(m => m.MarcaId == marcaId)
                .OrderBy(m => m.Nome)
                .ToListAsync();

            return Ok(modelos);
        }

        [HttpGet("anos/{tipoVeiculo}/{marcaId}/{modeloId}")]
        public async Task<IActionResult> GetAnos(string tipoVeiculo, int marcaId, int modeloId)
        {
            var anos = await _context.Veiculos
                .Where(v => v.ModeloId == modeloId)
                .Select(v => new { Codigo = v.CodigoFipe, Nome = v.AnoModelo }) // O frontend espera {Codigo, Nome}
                .OrderByDescending(v => v.Nome)
                .ToListAsync();

            return Ok(anos);
        }

        [HttpGet("valor/{tipoVeiculo}/{codigoFipe}")]
        public async Task<IActionResult> GetValor(string tipoVeiculo, string codigoFipe)
        {
            var veiculo = await _context.Veiculos
                .FirstOrDefaultAsync(v => v.CodigoFipe == codigoFipe);

            if (veiculo == null) return NotFound();

            var modelo = await _context.Modelos.FindAsync(veiculo.ModeloId);
            var marca = await _context.Marcas.FindAsync(modelo.MarcaId);

            var resultado = new
            {
                Valor = veiculo.Valor,
                Marca = marca.Nome,
                Modelo = modelo.Nome,
                AnoModelo = int.Parse(veiculo.AnoModelo.Split(' ')[0]), // Pega apenas o ano
                Combustivel = veiculo.AnoModelo.Split(' ')[1], // Pega o tipo de combustível
                CodigoFipe = veiculo.CodigoFipe
            };
            
            return Ok(resultado);
        }
    }
}