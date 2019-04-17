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
        public static IQueryable QueryListaCanjesxUsuario(string idCliente, int estado)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Canje.Where(x => x.ID_Cliente.Equals(idCliente) && x.Log_Activo == estado);
            return query;
        }

        public static IEnumerable<Canje> ObtenerListaCanjexUsuario(string idCliente, int estado)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Canje> lista = (IEnumerable<Canje>)CanjeLN.QueryListaCanjesxUsuario(idCliente, estado);
            return lista;
        }

        public static bool GuardarCanje(string idCliente, string idCupon, DateTime fecha)
        {
            try
            {
                var db = new BD_EcomonedasContext();

                Canje miCanje = new Canje();

                miCanje.ID_Cliente = idCliente;
                miCanje.ID_Cupon = Convert.ToInt32(idCupon);
                miCanje.FechaCanje = fecha;
                miCanje.Log_Activo = 1;
                db.Canje.Add(miCanje);

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        //public static List<Canje> ObtenerCuponCanjeado(int idCanje)
        //{
        //    if (idCanje != 0)
        //    {
        //        var db = new BD_EcomonedasContext();
        //        //recordar el where para solo los activos
        //        List<Canje> lista = ((List<Canje>)db.Canje.Where(x => x.ID == idCanje));
        //        foreach (var item in lista)
        //        {
        //            item.CodigoQR = GeneradorQRLN.SerializarImagen(GeneradorQRLN.GenerarQR(Convert.ToString(item.ID)));
        //        }
        //        return lista;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //}

        public static List<CuponCanjeado> ObtenerCuponCanjeado(Canje canje)
        {
            List<CuponCanjeado> lista = new List<CuponCanjeado>();
            CuponCanjeado nuevoCupon = new CuponCanjeado();
            nuevoCupon.DescCupon = canje.Cupon.Descripcion;
            nuevoCupon.NombreCupon = canje.Cupon.Nombre;
            nuevoCupon.Precio_Canje = canje.Cupon.Precio_Canje;
            nuevoCupon.NombreCliente = String.Format("{0} {1} {2}", canje.Usuario.Nombre, canje.Usuario.Apellido1, canje.Usuario.Apellido2);
            nuevoCupon.IDUnico = canje.ID;
            nuevoCupon.CodigoQR = GeneradorQRLN.SerializarImagen(GeneradorQRLN.GenerarQR(Convert.ToString(canje.ID)));

            lista.Add(nuevoCupon);
            return lista;
        }

        public static Canje ObtenerCanje(int idCanje)
        {
            if (idCanje != 0)
            {
                var db = new BD_EcomonedasContext();
                //recordar el where para solo los activos
                IEnumerable<Canje> lista = ((IEnumerable<Canje>)db.Canje.Where(x => x.ID == idCanje));
                foreach (var item in lista)
                {
                    //item.ImagenCupon = GeneradorQRLN.SerializarImagen(System.Drawing.Image.FromFile("~/imagenes/cupon/" + item.Cupon.Imagen));
                    item.CodigoQR = GeneradorQRLN.SerializarImagen(GeneradorQRLN.GenerarQR(Convert.ToString(item.ID)));
                }
                return lista.First();
            }
            else
            {
                return null;
            }
        }

        public static bool CambiarEstadoCanje(int id)
        {
            if (id > 0)
            {
                var db = new BD_EcomonedasContext();
                Canje miCanje = new Canje();

                miCanje = db.Canje.Where(x => x.ID == id).First<Canje>();

                miCanje.Log_Activo = 0;

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
