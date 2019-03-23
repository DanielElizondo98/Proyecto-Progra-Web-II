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
    public partial class MaterialesRecibidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<Material> listadoMateriales()
        {
            List<Material> lista = MaterialLN.ObtenerListaMateriales(1).ToList();
            return lista;
        }
    }
}