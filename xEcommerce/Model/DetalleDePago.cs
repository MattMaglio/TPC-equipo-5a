using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    internal class DetalleDePago
    {
        private int Id { get; set; }
        private int NumeroLinea { get; set; }
        private MedioDePago MedioDePago { get; set; }
        private float Monto { get; set; }

    }
}
