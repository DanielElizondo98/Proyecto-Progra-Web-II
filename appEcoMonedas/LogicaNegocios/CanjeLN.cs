using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class CanjeLN
    {
        public static IQueryable QueryListaCanjesxUsuario(string idCliente)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Canje.Where(x => x.ID_Cliente.Equals(idCliente));
            return query;
        }

        public static IEnumerable<Canje> ObtenerListaCanjexUsuario(string idCliente)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Canje> lista = (IEnumerable<Canje>)CanjeLN.QueryListaCanjesxUsuario(idCliente);
            return lista;
        }

        public static bool GuardarCanje(string idCliente, string idCupon, DateTime fecha)
        {
            var db = new BD_EcomonedasContext();

            Canje miCanje = new Canje();

            miCanje.ID_Cliente = idCliente;
            miCanje.ID_Cupon = Convert.ToInt32(idCupon);
            miCanje.FechaCanje = fecha;
                      
            db.Canje.Add(miCanje);

            db.SaveChanges();

            return true;
        }



    }
}
