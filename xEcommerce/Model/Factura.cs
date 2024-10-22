using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Factura
    {
        private int Id { get; set; }
        private char Letra { get; set; }
        private int PtoVenta { get; set; }
        private int Numero { get; set; }
        private Cliente Cliente { get; set; }
        private DetalleDeFactura DetFact { get; set; }
        private DetalleDePago DetPago { get; set; }

    }
}
