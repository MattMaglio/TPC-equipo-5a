using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Direccion
    {
        public int Id { get; set; }
        public string Calle { get; set; }
        public int Numeracion { get; set; }
        public string CodigoPostal { get; set; }
        public Provincia Provincia { get; set; }
        public Ciudad Ciudad { get; set; }
    }
}
