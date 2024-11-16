using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ApplicationService
{
    public class EmailAS
    {
        private Email email; 

        public EmailAS()
        {
            email = new Email(); 
        }

        public void ArmarCorreo(string emailDestino, string nombre, string asunto)
        {
            email.Emmail = new MailMessage();
            email.Emmail.From = new MailAddress("noresponder@xEcoomerceGrupo5A.com.ar");
            email.Emmail.To.Add(emailDestino); // Destinatario
            email.Emmail.Subject = asunto;    // Asunto
            email.Emmail.Body = $@"
            <h1>¡Hola {nombre}!,</h1>
        
            <br />
            <p>Gracias por contactarte con nosotros, analizaremos tu consulta y te responderemos a la brevedad</p>";
            email.Emmail.IsBodyHtml = true;  
        }

        public void EnviarEmail()
        {
            try
            {
              
                email.Server.Send(email.Emmail);
            }
            catch (Exception ex)
            {
                
                throw new Exception("Error al enviar el correo: " + ex.Message);
            }
        }
    }
}
