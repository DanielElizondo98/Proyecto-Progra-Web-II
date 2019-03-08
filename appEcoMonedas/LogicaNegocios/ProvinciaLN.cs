using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class ProvinciaLN
    {
        public static IQueryable QueryListaProvincias()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Provincia;
            return query;
        }

        public static IEnumerable<Provincia> ObtenerListaProvincias()
        {
            IEnumerable<Provincia> lista = (IEnumerable<Provincia>)ProvinciaLN.QueryListaProvincias();
            return lista;
        }
    }
}
