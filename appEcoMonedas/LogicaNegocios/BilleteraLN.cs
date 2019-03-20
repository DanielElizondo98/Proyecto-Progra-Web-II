using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class BilleteraLN
    {
        /// <summary>
        /// Obtiene una lista de billeteras de la base de datos
        /// </summary>
        /// <returns></returns>
        public static IQueryable QueryListaBilletera()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Billetera;
            return query;
        }

        /// <summary>
        /// Obtiene la billetera de un usuario
        /// </summary>
        /// <param name="correoUsuario"></param>
        /// <returns></returns>
        public static Billetera ObtenerBilletera(String correoUsuario)
        {
            var db = new BD_EcomonedasContext();
            Billetera billetera = db.Billetera.Where(x => x.ID_Propietario.Equals(correoUsuario)).FirstOrDefault<Billetera>();
            return billetera;
        }

        public static bool GuardarBilletera(String EcoMonedasGeneradas, String EcoMonedasGastadas, String EcoMonedasDisponibles, String correo = "")
        {
            var db = new BD_EcomonedasContext();
            bool esNuevo = false;
            Billetera miBilletera = db.Billetera.Where(x => x.ID_Propietario.Equals(correo)).FirstOrDefault();

            if (miBilletera == null)
            {
                miBilletera = new Billetera();
                miBilletera.ID_Propietario = correo;
                esNuevo = true;
            }

            miBilletera.Ecomonedas_Disponible = Convert.ToDouble(EcoMonedasDisponibles);
            miBilletera.Ecomonedas_Gastadas = Convert.ToDouble(EcoMonedasGastadas);
            miBilletera.Ecomonedas_Generadas = Convert.ToDouble(EcoMonedasGeneradas);

            if (esNuevo)
            {
                db.Billetera.Add(miBilletera);
            }
            db.SaveChanges();
            return true;
        }

        public static bool AumentarEcomonedas(String CorreoUsuario, String EcoMonedasSuma)
        {
            var db = new BD_EcomonedasContext();
            Billetera billetera = db.Billetera.Where(x=> x.ID_Propietario.Equals(CorreoUsuario)).FirstOrDefault();
            double ecomonedasAumenta = Convert.ToDouble(EcoMonedasSuma);
            if (billetera == null)
            {
                billetera.ID_Propietario = CorreoUsuario;
                billetera.Ecomonedas_Disponible = ecomonedasAumenta;
                billetera.Ecomonedas_Gastadas = 0;
                billetera.Ecomonedas_Generadas = ecomonedasAumenta;

                db.Billetera.Add(billetera);
            }
            else
            {
                billetera.Ecomonedas_Disponible += ecomonedasAumenta;
                billetera.Ecomonedas_Generadas += ecomonedasAumenta;
            }
            db.SaveChanges();
            return true;
        }
    }
}
