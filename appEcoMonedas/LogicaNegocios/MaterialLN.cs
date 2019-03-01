using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class MaterialLN
    {
        public static IQueryable QueryListaMateriales(int log)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Material;
            return query;
        }


        /// <summary>
        /// Obtiene la lista completa de los materiales en la base de datos
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Material> ObtenerListaMateriales(int log)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Material> lista = (IEnumerable<Material>)MaterialLN.QueryListaMateriales(log);
            return lista;
        }

        public static Material ObtenerMaterial(int id)
        {
            var db = new BD_EcomonedasContext();
            Material mat = db.Material.Where(x => x.ID == id).First<Material>();
            return mat;
        }

        public static bool GuardarMaterial(string precio, string nombre, string imagen, string color, string id="")
        {
            var db = new BD_EcomonedasContext();

            int idMaterial = 0;
            Material miMate= new Material();

            bool esNumero = int.TryParse(id, out idMaterial);

            if(esNumero || idMaterial > 0)
            {
                miMate = db.Material.Where(x => x.ID == idMaterial).First<Material>();
            }

            miMate.Precio = Convert.ToDouble(precio);
            miMate.Nombre = nombre;
            miMate.Imagen = imagen;
            miMate.Color = color;

            if(id.Equals("") || !esNumero)
            {
                db.Material.Add(miMate);
            }

            db.SaveChanges();

            return true;
        }


    }
}
