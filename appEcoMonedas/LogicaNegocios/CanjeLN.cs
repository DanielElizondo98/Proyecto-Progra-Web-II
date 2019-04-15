﻿using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class CanjeLN
    {
        public static IQueryable QueryListaCanjesxUsuario(int idCliente)
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Canje.Where(x => x.ID_Cliente.Equals(idCliente));
            return query;
        }

        public static IEnumerable<Canje> ObtenerListaCanjexUsuario(int idCliente)
        {
            //recordar el where para solo los activos
            var db = new BD_EcomonedasContext();
            IEnumerable<Canje> lista = (IEnumerable<Canje>)CanjeLN.QueryListaCanjesxUsuario(idCliente);
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

        public static List<Canje> ObtenerCuponCanjeado(int idCanje)
        {
            if (idCanje != 0)
            {
                var db = new BD_EcomonedasContext();
                //recordar el where para solo los activos
                List<Canje> lista = ((List<Canje>)db.Canje.Where(x => x.ID == idCanje));
                foreach (var item in lista)
                {
                    item.ImagenCupon = GeneradorQRLN.SerializarImagen(System.Drawing.Image.FromFile("~/imagenes/cupon/" + item.Cupon.Imagen));
                    item.CodigoQR = GeneradorQRLN.SerializarImagen(GeneradorQRLN.GenerarQR(Convert.ToString(item.ID)));
                }
                return lista;
            }
            else
            {
                return null;
            }
        }


    }
}
