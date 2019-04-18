using Contexto;
using LogicaNegocios;
using Microsoft.Reporting.WebForms;
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
            if (Session["IDCanje"]!=null)
            {
                String idCanje = (String)Session["IDCanje"].ToString();
                if (idCanje != null)
                {
                    if (!idCanje.Trim().Equals("") && !IsPostBack)
                    {
                        CargarDatosCanje(Convert.ToInt32(idCanje));
                    }
                }
                else
                {
                    Response.Redirect(Request.UrlReferrer.AbsolutePath);
                }
            }else
            {
                Response.Redirect("InicioCliente.aspx");
            }
        }


        public void CargarDatosCanje(int canjeId)
        {

            Canje miCanje = null;
            if (canjeId > 0)
            {
                int id = 0;
                id = Convert.ToInt32(canjeId);

                miCanje = CanjeLN.ObtenerCanje(id);
            }
            if (miCanje != null)
            {
                lblNombreCupon.Text = miCanje.Cupon.Nombre;
                lblDescripcionCupon.Text = miCanje.Cupon.Descripcion;
                lblPrecio.Text = String.Format("‎{0:N2} Ecomonedas", miCanje.Cupon.Precio_Canje);
                lblNombreUsuario.Text = miCanje.Usuario.Nombre;
                lblCorreo.Text = miCanje.ID_Cliente;
                lblFechaCompra.Text = miCanje.FechaCanje.ToShortDateString();
                imgCupon.ImageUrl = String.Format("~/imagenes/cupon/{0}", miCanje.Cupon.Imagen);
            }
            else
            {
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CuponesUsuario.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            if (Session["IDCanje"] != null)
            {
                String idCanje = (String)Session["IDCanje"].ToString();
                if (!idCanje.Trim().Equals(""))
                {
                    CanjeLN.CambiarEstadoCanje(Convert.ToInt32(idCanje));
                    ReportViewer1.LocalReport.Refresh();
                }
                else
                {
                    lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, no se ha detectado Cupón a Imprimir.";
                    lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                Response.Redirect("InicioCliente.aspx");
            }
        }

        public static List<CuponCanjeado> ObtenerCuponCanjeado(int idCanje)
        {
            Canje miCanje = CanjeLN.ObtenerCanje(idCanje);
            List<CuponCanjeado> lista = ((List<CuponCanjeado>)CanjeLN.ObtenerCuponCanjeado(miCanje.ID));
            return lista;
        }
        
    }
}