using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Articulo
    {
        public int IdRegSyP { get; set; }
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public string Detalle { get; set; }
        public Tipo Tipo { get; set; }
        public Categoria Categoria { get; set; }
        public Marca Marca { get; set; }
        public Color Color { get; set; }
        public Talle Talle { get; set; }
        public List <Imagen> Imagen { get; set; }
        public int Stock { get; set; }
        public float Precio { get; set; }
        public bool Estado { get; set; }

    }
}
