using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class ColorLN
    {
        /// <summary>
        /// Retorna un query con la lista de colores que existen en la base de datos
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static IQueryable QueryListaColores()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Color;
            return query;
        }


        /// <summary>
        /// Obtiene la lista completa de los materiales en la base de datos
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Color> ObtenerListaColores()
        {
            //recordar el where para solo los activos
            IEnumerable<Color> lista = (IEnumerable<Color>)ColorLN.QueryListaColores();
            return lista;
        }
    }
}
