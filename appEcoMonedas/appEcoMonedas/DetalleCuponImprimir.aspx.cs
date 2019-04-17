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
            String idCanje = (String)Session["IDCanje"].ToString();
            if (idCanje != null)
            {
                if (idCanje != "" && !IsPostBack)
                {
                    lvCupon.DataSource = ObtenerCanje(Convert.ToInt32(idCanje));
                    lvCupon.DataBind();
                }
            }else
            {
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
        }


        public List<Canje> ObtenerCanje(int canjeId)
        {
            List<Canje> listaCanje = new List<Canje>();
            if (canjeId > 0)
            {
                int id = 0;
                id = Convert.ToInt32(canjeId);

                listaCanje.Add(CanjeLN.ObtenerCanje(id));
            }
            if (listaCanje.Count != 0)
            {
                return listaCanje;
            }
            else
            {
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
                return null;
            }
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
                    Response.Redirect("ImprimirCupon.aspx");
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

        public static List<CuponCanjeado> ObtenerCuponCanjeado(int idCanje)
        {
            Canje miCanje = CanjeLN.ObtenerCanje(idCanje);
            List<CuponCanjeado> lista = ((List<CuponCanjeado>)CanjeLN.ObtenerCuponCanjeado(miCanje));
            return lista;
        }


    }
}