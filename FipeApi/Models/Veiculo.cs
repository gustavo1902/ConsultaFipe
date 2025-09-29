namespace FipeApi.Models
{
    public class Veiculo
    {
        public int Id { get; set; }
        public string CodigoFipe { get; set; }
        public string AnoModelo { get; set; }
        public string Valor { get; set; }
        public int ModeloId { get; set; }
    }
}