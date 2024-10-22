using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Articulo
    {
        private int Id { get; set; }
        private string Codigo { get; set; }
        private string Nombre { get; set; }
        private string Descripcion { get; set; }
        private Tipo Tipo { get; set; }
        private Categoria Categoria { get; set; }
        private Marca Marca { get; set; }
        private Color Color { get; set; }
        private Talle Talle { get; set; }
        private List <Imagen> Imagen { get; set; }
        private int Stock { get; set; }
        private float Precio { get; set; }
    }
}
