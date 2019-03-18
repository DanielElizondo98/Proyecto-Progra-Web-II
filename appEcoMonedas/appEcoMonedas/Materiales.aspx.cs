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
    public partial class Materiales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void CargarListaCarrito()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Material> listadoMateriales()
        {
            List<Material> lista = MaterialLN.ObtenerListaMateriales(1).ToList();
            return lista;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;

            HiddenField hfMaterialID = (HiddenField)item.FindControl("hfMaterialID");

            int id = Convert.ToInt32(hfMaterialID.Value);
            CarritoLN.Carrito.Instancia.AgregarItem(id);
            PrincipalAdminCentro master = Page.Master as PrincipalAdminCentro;
            master.LlenarCarritoMenu();
            master.listaCarrito();
        }

    }
}