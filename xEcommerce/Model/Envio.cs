using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Envio
    {
        private int Id { get; set; }
        private Factura DetEnvio { get; set; }
        private Cliente Cliente { get; set; }
        private Direccion DireccionEnvio { get; set; }
        private Currier Currier {  get; set; }
        private EstadoDeEnvio EstadoEnvio { get; set; }
}
}
