using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class CentroLN
    {
        /// <summary>
        /// Retorna un query con la lista de centros de acopio que existen en la base de datos
        /// El parametro define el filtro, 1 retorna los activos, 0 retorna los desactivos y 2 significa traerlos todos
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static IQueryable QueryListaCentros(int log)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Centro.Where(x => x.Log_Activo == log || log == 2);
            return query;
        }


        /// <summary>
        /// Obtiene la lista completa de los centros de acopio en la base de datos
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Centro> ObtenerListaCentros(int log)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Centro> lista = (IEnumerable<Centro>)CentroLN.QueryListaCentros(log);
            return lista;
        }
    }
}
