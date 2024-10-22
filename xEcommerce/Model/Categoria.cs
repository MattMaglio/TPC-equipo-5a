using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public bool Estado { get; set; }

        /* -- Eliminacion del encapsulamiento para poder utilizarlo de manera directa con ASP.NET
        // Id Get-Set
        public int GetId()
        {
            return Id;
        }
        public void SetId(int id)
        {
            Id = id;
        }
        
        // Codigo Get-Set
        public string GetCodigo()
        {
            return Codigo;
        }
        public void SetCodigo(string codigo)
        {
            Codigo = codigo;
        }

        // Descripcion Get-Set
        public string GetDescripcion()
        {
            return Descripcion;
        }
        public void SetDescripcion(string descripcion)
        {
            Descripcion = descripcion;
        }

        // Estado Get-Set
        public bool GetEstado()
        {
            return Estado;
        }
        public void SetEstado(bool estado)
        {
            Estado = estado;
        }
        */
    }
}
