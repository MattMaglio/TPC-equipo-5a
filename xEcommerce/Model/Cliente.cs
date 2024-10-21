using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    internal class Cliente
    {
        private int Id { get; set; }
        private string Nombre { get; set; }
        private string Apellido { get; set; }
        private string Dni { get; set; }
        private string Email { get; set; }
        private Direccion Direccion { get; set; }
}
}
