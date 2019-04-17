using Contexto;
using LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class ImprimirCupon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Canje> ObtenerCanje([QueryString("id")] int? canjeId)
        {
            List<Canje> listaCanje = new List<Canje>();
            if (canjeId.HasValue && canjeId > 0)
            {
                int id = 0;
                id = Convert.ToInt32(canjeId);

                listaCanje.Add(CanjeLN.ObtenerCanje(id));
            }
            return listaCanje;
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CuponesUsuario.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;

            HiddenField hfCanjeID = (HiddenField)item.FindControl("hfCanjeID");

            if (hfCanjeID != null)
            {
                int id = Convert.ToInt32(hfCanjeID.Value);

                if (id > 0)
                {
                    CanjeLN.CambiarEstadoCanje(id);
                    lblMensaje.Text = "El Cupón se ha impreso correctamente";
                    lblMensaje.CssClass = "alert alert-dismissible alert-info";
                    lblMensaje.Visible = true;
                }
                else
                {
                    lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error";
                    lblMensaje.CssClass = "alert alert-dismissible alert-secondary";
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, no se ha detectado Cupón a Imprimir.";
                lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                lblMensaje.Visible = true;
            }
        }


    }
}