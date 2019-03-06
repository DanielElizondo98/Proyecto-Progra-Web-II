using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class RolLN
    {
        public static IQueryable ListaRoles()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Rol;
            return query;
        }
        public static IQueryable QueryRolesMantenimiento()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Rol.Where(x=> x.ID != 1);
            return query;
        }

        public static IEnumerable<Rol> ListaRolesMantenimiento()
        {
            //recordar el where para solo los activos
            IEnumerable<Rol> lista = (IEnumerable<Rol>)RolLN.QueryRolesMantenimiento();
            return lista;
        }
    }
}
