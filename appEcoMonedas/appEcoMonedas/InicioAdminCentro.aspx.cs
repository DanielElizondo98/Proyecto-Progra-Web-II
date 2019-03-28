using Contexto;
using LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class InicioAdminCentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario us = (Usuario)Session["Usuario"];
                if (us != null)
                {
                    CargarDatosCentro();
                }
            }
        }

        private void CargarDatosCentro()
        {
            Usuario us = (Usuario)Session["Usuario"];
            Centro centro = CentroLN.ObtenerCentroAdminCentro(us.Correo);
            if (centro != null)
            {
                List<Enc_Transaccion> listaTransaccion = TransaccionMaterialLN.ListaCanjesCentro(centro.ID, "").ToList();
                double? totalEcoMonedas = listaTransaccion.Sum(x=>x.Total_Ecomonedas);
                /*Si no se tuviera el campo Total_Ecomonedas en la tabla Enc_Transaccion
                 * Con estas lineas se puede recalcular
                 * foreach (var item in listaTransaccion)
                {
                    totalEcoMonedas += item.Det_Transaccion.Sum(x => x.Sub_Total);
                }*/
                lblNombreAdminCentro.Text = String.Format("{0} {1} {2}", us.Nombre, us.Apellido1, us.Apellido2);
                lblOtrasSenias.Text = centro.Otras_Senias;
                lblProvinciaCentro.Text = centro.Provincia.Descripcion;
                lblTotalEcoMonedasGeneradas.Text = totalEcoMonedas==null? "0":totalEcoMonedas.ToString();
                lblNombreCentro.Text = centro.Nombre;
            }
        }
    }
}