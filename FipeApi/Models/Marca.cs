using System.Text.Json.Serialization;

namespace FipeApi.Models
{
    public class Marca
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        
        [JsonIgnore]
        public string TipoVeiculo { get; set; }
    }
}