using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class CuponLN
    {
        /// <summary>
        /// Retorna un query con la lista de cupones que existen en la base de datos 
        /// El parametro define el filtro, 1 retorna los activos, 0 retorna los desactivos y 2 significa traerlos todos
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static IQueryable QueryListaCupones(int log)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Cupon.Where(x => x.Log_Activo == log || log == 2);
            return query;
        }

        /// <summary>
        /// Obtiene la lista completa de los cupones en la base de datos 
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static IEnumerable<Cupon> ObtenerListaCupones(int log)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Cupon> lista = (IEnumerable<Cupon>)CuponLN.QueryListaCupones(log);
            return lista;
        }
        public static Cupon ObtenerCupon(int id)
        {
            var db = new BD_EcomonedasContext();
            Cupon cup = db.Cupon.Where(x => x.ID == id).FirstOrDefault<Cupon>();
            return cup;
        }

        public static bool GuardarCupon(string nombre, string descripcion, string precio, string imagen = "", string id = "")
        {
            var db = new BD_EcomonedasContext();

            int idCupon = 0;
            Cupon miCupon = new Cupon();

            bool esNumero = int.TryParse(id, out idCupon);

            if (esNumero || idCupon > 0)
            {
                miCupon = db.Cupon.Where(x => x.ID == idCupon).First<Cupon>();
            }

            miCupon.Nombre = nombre;
            miCupon.Descripcion = descripcion;
            miCupon.Precio_Canje = Convert.ToDouble(precio);
            if (!imagen.Equals(""))
                miCupon.Imagen = imagen;
            miCupon.Log_Activo = 1;

            if (id.Equals("") || !esNumero)
            {
                db.Cupon.Add(miCupon);
            }

            db.SaveChanges();

            return true;
        }

        /// <summary>
        /// Método que cambia el estado. Si el estado esta en 0, lo coloca en 1 (Activo)
        /// Si el estado esta en 1, lo coloca 0 (inactivo)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool CambiarEstadoCupon(int id)
        {
            if (id > 0)
            {
                var db = new BD_EcomonedasContext();
                Cupon miCupon = new Cupon();

                miCupon = db.Cupon.Where(x => x.ID == id).First<Cupon>();
                if (miCupon.Log_Activo == 0)
                {
                    miCupon.Log_Activo = 1;
                }
                else
                {
                    miCupon.Log_Activo = 0;
                }
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
