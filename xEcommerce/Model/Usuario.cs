using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    //Conjunto de valores constantes con nombre, define posibles para el tipo de usuario
    public enum TipoUsuario
    {
        NORMAL = 1,
        ADMIN = 2
    }
    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Pass { get; set; }

        public TipoUsuario TipoUsuario { get; set; }

        //public NivelDeAccesso NivAcceso { get; set; }

        public Usuario(string user, string pass, bool admin) 
        { 
            User = user;
            Pass = pass;
            TipoUsuario = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
        }
    }

    
}
