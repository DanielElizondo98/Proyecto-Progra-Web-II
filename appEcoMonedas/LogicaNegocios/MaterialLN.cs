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
        /// <summary>
        /// Retorna un query con la lista de materiales que existen en la base de datos
        /// El parametro define el filtro, 1 retorna los activos, 0 retorna los desactivos y 2 significa traerlos todos
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public static IQueryable QueryListaMateriales(int log)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Material.Where(x=> x.Log_Activo == log || log == 2);
            return query;
        }


        /// <summary>
        /// Obtiene la lista completa de los materiales en la base de datos
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<Material> ObtenerListaMateriales(int log)
        {
            //recordar el where para solo los activos
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
            miMate.Log_Activo = miMate.Log_Activo == null? 1: miMate.Log_Activo;

            if(id.Equals("") || !esNumero)
            {
                db.Material.Add(miMate);
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
        public static bool CambiarEstadoMaterial(int id)
        {
            if (id > 0)
            {
                var db = new BD_EcomonedasContext();
                Material miMate = new Material();

                miMate = db.Material.Where(x => x.ID == id).First<Material>();
                if(miMate.Log_Activo == 0)
                {
                    miMate.Log_Activo = 1;
                }else
                {
                    miMate.Log_Activo = 0;
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
