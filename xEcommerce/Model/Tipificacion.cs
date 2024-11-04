using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Scripts
{
    public class Tipificacion
    {
        public int Codigo { get; set; }
        public string Descripcion { get; set; }

        // Lista estática con los valores predefinidos
        public static readonly List<Tipificacion> Tipificaciones = new List<Tipificacion>
        {
        new Tipificacion { Codigo = 1, Descripcion = "Marca" },
        new Tipificacion { Codigo = 2, Descripcion = "Tipo" },
        new Tipificacion { Codigo = 3, Descripcion = "Categoria" },
        new Tipificacion { Codigo = 4, Descripcion = "Color" },
        new Tipificacion { Codigo = 5, Descripcion = "Talle" }
        };
    }

}
