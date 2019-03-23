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


        public static IEnumerable<Centro> ObtenerCentroXIdAdmin(string idAdmin)
        {
            IEnumerable<Centro> query = (IEnumerable<Centro>)CentroLN.QueryListaCentros(2);
            IEnumerable<Centro> lista = query.Where(x => x.ID_Administrador_Centro == idAdmin);
            return lista;
        }


        public static bool GuardarCentro(String nombre, string idProvincia, String otrasSenias, String idAdmin, string id = "")
        {
            try
            {
                var db = new BD_EcomonedasContext();
                int idCentro = 0;
                Centro miCentro = new Centro();

                bool esNumero = int.TryParse(id, out idCentro);

                if (esNumero || idCentro > 0)
                {
                    miCentro = db.Centro.Where(x => x.ID == idCentro).First<Centro>();
                }

                miCentro.Nombre = nombre;
                miCentro.ID_Provincia = Convert.ToInt32(idProvincia);
                miCentro.Otras_Senias = otrasSenias;
                miCentro.ID_Administrador_Centro = idAdmin;
                miCentro.Log_Activo = miCentro.Log_Activo == null ? 1 : miCentro.Log_Activo;

                if (id.Equals("") || !esNumero)
                {
                    db.Centro.Add(miCentro);
                }
                db.SaveChanges();

                return true;
            }
            catch (EntryPointNotFoundException)
            {

                throw;
            }
        }

        public static bool CambiarEstadoCentro(int id)
        {
            if (id > 0)
            {
                var db = new BD_EcomonedasContext();
                Centro miCentro = new Centro();

                miCentro = db.Centro.Where(x => x.ID == id).First<Centro>();
                if (miCentro.Log_Activo == 0)
                {
                    miCentro.Log_Activo = 1;
                }
                else
                {
                    miCentro.Log_Activo = 0;
                }
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }


        public static Centro ObtenerCentroAdminCentro(String IDAdminCentro)
        {
            var db = new BD_EcomonedasContext();
            Centro mat = db.Centro.Where(x => x.ID_Administrador_Centro.Equals(IDAdminCentro)).First<Centro>();
            return mat;
        }

    }
}
