using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class TransaccionMaterialLN
    {
        public static int registrarTransaccion(string ID_Cliente, string ID_Centro, List<CarritoCompras> carritoItems)
        {
            var db = new BD_EcomonedasContext();
            //Enc_Transaccion
            var miEncabezado = new Enc_Transaccion();
            miEncabezado.Fecha = DateTime.Now;
            miEncabezado.ID_Centro = Convert.ToInt32(ID_Centro);
            miEncabezado.ID_Cliente = ID_Cliente;

            //Calcular total
            double calculoTotal = Convert.ToDouble(carritoItems.Sum(x => x.subTotal()));
            miEncabezado.Total_Ecomonedas = calculoTotal;

            //Agregar Enc_Transaccion a la BD
            db.Enc_Transaccion.Add(miEncabezado);
            db.SaveChanges();

            //Det_Transaccion
            foreach (var item in carritoItems)
            {
                var miDetalle = new Det_Transaccion();
                miDetalle.ID_Encabezado = miEncabezado.ID;
                miDetalle.ID_Material = item.IDMaterial;
                miDetalle.Sub_Total = Convert.ToDouble(item.subTotal());
                miDetalle.Cantidad = item.cantidad;

                //Agregar Det_Transaccion a la BD
                db.Det_Transaccion.Add(miDetalle);
                db.SaveChanges();
            }
            //pensar método en la billetera
            BilleteraLN.AumentarEcomonedas(ID_Cliente, miEncabezado.Total_Ecomonedas.ToString());
            return miEncabezado.ID;
        }

        public static IQueryable ListaCanjes()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Enc_Transaccion;
            return query;
        }

        public static IEnumerable<Enc_Transaccion> ListaCanjesCentro(int ID_Centro = 0)
        {
            var db = new BD_EcomonedasContext();
            if (ID_Centro > 0)
            {
                var query = db.Enc_Transaccion.Where(x => x.ID_Centro == ID_Centro);
                return ((IEnumerable<Enc_Transaccion>)query);
            }
            return null;
        }

        public static Enc_Transaccion ObtenerEncabezadoID(int ID_Encabezado)
        {
            var db = new BD_EcomonedasContext();
            Enc_Transaccion enc = db.Enc_Transaccion.Where(x => x.ID == ID_Encabezado).FirstOrDefault<Enc_Transaccion>();
            return enc;
        }
    }
}
