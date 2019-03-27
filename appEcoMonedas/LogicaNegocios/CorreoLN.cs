using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class CorreoLN
    {
        public static void enviar_Correo(String correoUs, string cuerpoMensaje, string Objetivo)
        {
            try
            {
                string cuerpo = cuerpoMensaje;


                MailMessage correo = new MailMessage();
                SmtpClient ServidorSMTP = new SmtpClient("smtp.gmail.com");

                correo.To.Clear();
                correo.Body = "";
                correo.Subject = "";

                correo.Subject = Objetivo;
                correo.SubjectEncoding = System.Text.Encoding.UTF8;

                correo.Body.IsNormalized();
                correo.Body = cuerpo;
                correo.BodyEncoding = System.Text.Encoding.UTF8;
                //correo.IsBodyHtml = true;

                correo.To.Add(correoUs.Trim());


                correo.From = new MailAddress("ecomonedas.proyectoutn@gmail.com");
                ServidorSMTP.Credentials = new System.Net.NetworkCredential("ecomonedas.proyectoutn@gmail.com", "ProyectoEcoICuatri");

                ServidorSMTP.Port = 587;
                ServidorSMTP.EnableSsl = true;

                ServidorSMTP.Send(correo);
            }
            catch (Exception ex)
            {
                throw new ApplicationException("El correo electronico no existe o esta mal digitado por favor verificar.\nMás información: " + ex.Message);
            }
        }
    }
}
