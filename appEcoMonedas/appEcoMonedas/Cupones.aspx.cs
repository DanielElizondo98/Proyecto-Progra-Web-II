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
            string error = Request.QueryString["Error"];
            switch (error)
            {
                case "NoEncontrado":
                    lblMensaje.CssClass = "col-12 alert alert-dismissible alert-danger";
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Lo sentimos, pero no se ha encontrado el cupón seleccionado";
                    break;
                default:
                    break;
            }
        }

        public IEnumerable<Cupon> ListadoCupones()
        {
            List<Cupon> lista = CuponLN.ObtenerListaCupones(1).ToList();
            return lista;
        }

        protected void btnCanjear_Click(object sender, EventArgs e)
        {
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
            HiddenField idCupon = (HiddenField)item.FindControl("hfCuponID");
            int id = Convert.ToInt32(idCupon.Value);

            Session["idCuponComprar"]= id;
        }
        
    }
}