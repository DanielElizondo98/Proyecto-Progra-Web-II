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
    public partial class ReporteEcomonedasGeneradas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ObjectDataSource1.SelectParameters[""].DefaultValue = 
            if (!IsPostBack)
            {
                CargarTotales();
            }
        }

        private void CargarTotales()
        {
            IEnumerable<Centro> centros = CentroLN.ObtenerListaCentros(1);
            lblTotalCentros.Text = centros.Count().ToString();

            IEnumerable<Usuario> usuarios = UsuarioLN.ObtenerListaUsuariosRol(1, 3);
            lblTotalClientes.Text = usuarios.Count().ToString();

            IEnumerable<Cupon> cupones = CuponLN.ObtenerListaCupones(1);
            lblTotalCupones.Text = cupones.Count().ToString();

            IEnumerable<Material> materiales = MaterialLN.ObtenerListaMateriales(1);
            lblTotalMats.Text = materiales.Count().ToString();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.Refresh();
        }
    }
}