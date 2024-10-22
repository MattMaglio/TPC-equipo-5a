using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DetalleDeFactura
    {
        private int Id { get; set; }
        private int NumeroLinea{ get; set; }
        private Articulo DetArticulo { get; set; }
        private int Cantidad { get; set; }
        private float Precio { get; set; }
        private float TotalPorLinea { get; set; }
    }
}
