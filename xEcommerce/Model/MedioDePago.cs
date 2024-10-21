using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    internal class MedioDePago
    {
        private int Id { get; set; }
        private string Codigo { get; set; }
        private string Nombre { get; set; }
        private EntidadFinanciera EntidadFinanciera { get; set; }
    }
}
