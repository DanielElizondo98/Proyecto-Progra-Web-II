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
    public partial class Cupones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Cupon> ListadoCupones()
        {
            List<Cupon> lista = CuponLN.ObtenerListaCupones(1).ToList();
            return lista;
        }

        protected void btnCanjear_Click(object sender, EventArgs e)
        {

        }
        
    }
}