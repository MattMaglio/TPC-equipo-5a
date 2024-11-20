using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Orden
    {
        public int Id { get; set; }
        public string Fecha { get; set; }
        public string Usuario{ get; set; } 
        public string TieneEnvio { get; set; }
        public string TieneRetiro { get; set; }
        public string Entregado { get; set; }
        public string ComprobanteFiscal { get; set; }
        public float MontoTotal { get; set; }
        public string Pagado { get; set; }
    }
}
