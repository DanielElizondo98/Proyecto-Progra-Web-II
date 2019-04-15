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
    public partial class ListaCanjesUsuario : System.Web.UI.Page
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

                if (us.ID_Rol != 3)
                {
                    if (us.ID_Rol == 1)
                    {
                        Response.Redirect("InicioAdministrador.aspx");
                    }
                    else
                    {
                        if (us.ID_Rol == 2)
                        {
                            Response.Redirect("InicioAdminCentro.aspx");
                        }
                    }
                }
                else
                {
                    IEnumerable<Enc_Transaccion> lista = TransaccionMaterialLN.ListaCanjesCentro(0, us.Correo);
                    if (lista != null)
                    {
                        grvCanjes.DataSource = lista.ToList();
                        grvCanjes.DataBind();
                        lblTotalGenerado.Text = lista.Sum(x => x.Total_Ecomonedas).ToString();
                    }
                    else
                    {
                        lblMensaje.CssClass = "col-12 alert alert-dismissible alert-warning";
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Aún no se han realizado canjes en su cuenta ";
                    }
                }
            }
        }

        protected void grvCanjes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}