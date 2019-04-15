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
    public partial class BilleteraVirtual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenaBilletera();
            }
        }

        public void llenaBilletera()
        {
            Billetera miBilletera = BilleteraLN.ObtenerBilletera(((Usuario)Session["Usuario"]).Correo);

            lblGeneradas.Text = miBilletera.Ecomonedas_Generadas.ToString();
            lblDisponibles.Text = miBilletera.Ecomonedas_Disponible.ToString();
            lblGastadas.Text = miBilletera.Ecomonedas_Gastadas.ToString();
        }

        public List<Canje> ObtenerCanjesUsuario()
        {
            List<Canje> listaCanjes = new List<Canje>();

            Usuario usu = (Usuario)Session["Usuario"];
            if (usu!=null)
            {
                string id = usu.Correo;

                listaCanjes = CanjeLN.ObtenerListaCanjexUsuario(id).ToList();
            }
            return listaCanjes;
        }
    }
}