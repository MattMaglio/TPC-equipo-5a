using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Direccion
    {
        private int Id { get; set; }
        private string Calle { get; set; }
        private int Numeracion { get; set; }
        private string CodigoPostal { get; set; }
        private Provincia Provincia { get; set; }
        private Ciudad Ciudad { get; set; }
    }
}
