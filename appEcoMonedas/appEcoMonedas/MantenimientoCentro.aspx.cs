using LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class MantenimientoCentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarListadoCentrosGrid();
            }
        }

        private void CargarListadoCentrosGrid()
        {
            grvListado.DataSource = CentroLN.ObtenerListaCentros(1).ToList();
            grvListado.DataBind();
        }

        public void ListaProvincias()
        {

        }
        public void ListaAdminsAcopio()
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}