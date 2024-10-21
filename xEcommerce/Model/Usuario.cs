using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Usuario
    {
        private int Id { get; set; }
        private string User { get; set; }
        private string Password { get; set; }
        private NivelDeAccesso NivAcceso { get; set; }
    }
}
