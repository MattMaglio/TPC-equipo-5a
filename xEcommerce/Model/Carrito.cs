using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Carrito
    {
        public int ProductoId { get; set; }
        public string Producto { get; set; }
        public int ColorId { get; set; }
        public string Color { get; set; }
        public int TalleId { get; set; }
        public string Talle { get; set; }
        public int Cantidad { get; set; }
        public float Precio { get; set; }
    }
}
