using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Model
    {
        public class Email
        {
            public MailMessage Emmail { get; set; }
            public SmtpClient Server { get; set; }

            public Email()
            {
                Server = new SmtpClient();       // aca va email y contraseña del correo a utilizar la pagina
                Server.Credentials = new NetworkCredential("xEcommerce", "aehbcmnwztxlwcmf");
                Server.EnableSsl = true;
                Server.Port = 587;
                Server.Host = "smtp.gmail.com";
            
            }
        }
}
    