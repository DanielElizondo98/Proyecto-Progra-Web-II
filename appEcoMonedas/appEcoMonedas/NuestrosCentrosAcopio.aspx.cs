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
    public partial class NuestrosCentrosAcopio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListaProvincias();
                ddlProvincias_SelectedIndexChanged(ddlProvincias, null);
            }
        }

        private void CargarCentrosPorProvincia(String codProvincia)
        {

            try
            {
                List<Centro> listaCentros = CentroLN.ObtenerCentroProvincia(codProvincia).ToList();
                lvCentros.DataSource = listaCentros;
                lvCentros.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = ex.Message;
            }
            

        }

        private void ListaProvincias()
        {
            ddlProvincias.DataSource = ProvinciaLN.ObtenerListaProvincias().ToList();
            ddlProvincias.DataBind();
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMensaje.Visible = false;
            lblMensaje.Text = "";
            imgProvincia.ImageUrl = "imagenes/Provincias/Provincia" + ddlProvincias.SelectedValue + ".png";
            CargarCentrosPorProvincia(ddlProvincias.SelectedValue);
        }
    }
}