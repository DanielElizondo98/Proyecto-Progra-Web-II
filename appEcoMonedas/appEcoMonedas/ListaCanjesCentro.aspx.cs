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
    public partial class ListaCanjesCentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string error = Request.QueryString["Error"];
            switch (error)
            {
                case "NoEncontrado":
                    lblMensaje.CssClass = "col-12 alert alert-dismissible alert-danger";
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Lo sentimos, pero no se ha encontrado el canje seleccionado";
                    break;
                default:
                    break;
            }
            if (!IsPostBack)
            {
                LlenarDatosCanjes();
            }
        }

        private void LlenarDatosCanjes()
        {
            Usuario us = (Usuario)Session["Usuario"];
            if (us != null)
            {
                Centro centro = CentroLN.ObtenerCentroAdminCentro(us.Correo);
                lblNombreCentroCabecera.Text = centro.Nombre;
                lblNombreCentroInformacion.Text = centro.Nombre;

                IEnumerable<Enc_Transaccion> lista = TransaccionMaterialLN.ListaCanjesCentro(centro.ID, "");
                if (lista != null)
                {
                    grvCanjes.DataSource = lista.ToList();
                    grvCanjes.DataBind();
                }
                else
                {
                    lblMensaje.CssClass = "col-12 alert alert-dismissible alert-warning";
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Aún no se han realizado canjes en " + centro.Nombre;
                }
            }
        }

        protected void grvCanjes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }
    }
}