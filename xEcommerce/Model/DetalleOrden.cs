using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DetalleOrden
    {
        public int Id {set; get;}
        public int IdOrden {set; get;}
        public string Articulo {set; get;}
        public string Color {set; get;}
        public string Talle {set; get;}
        public int Cantidad {set; get;}
        public float Precio {set; get;}
    }
}
