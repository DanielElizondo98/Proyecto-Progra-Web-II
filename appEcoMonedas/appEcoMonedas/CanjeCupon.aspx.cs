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
    public partial class CanjeCupon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenaDatosUsuario();
            }
        }

        public void LlenaDatosUsuario()
        {
            lblfecha.Text += DateTime.Today.ToShortDateString();
            Usuario usu = (Usuario)Session["Usuario"];
            if (usu != null)
            {
                //llena los datos del usuario
                Billetera billetera = BilleteraLN.ObtenerBilletera(usu.Correo);
                Session["Billetera"] = billetera;
                //System.Drawing.Image img = System.Drawing.Image.FromFile(imgCupon.ImageUrl);
                lblNombreUsuario.Text = usu.Nombre + " " + usu.Apellido1 + " " + usu.Apellido2;
                txtCorreo.Text = usu.Correo;
                txtDireccion.Text = usu.Direccion;
                txtEcomonedas.Text = billetera.Ecomonedas_Disponible + "";
            }

        }

        public List<Cupon> ObtenerCupon([QueryString("id")] int? cuponId)
        {
            List<Cupon> listaCupon = new List<Cupon>();
            if (cuponId.HasValue && cuponId > 0)
            {
                int id = 0;
                id = Convert.ToInt32(cuponId);

                listaCupon.Add(CuponLN.ObtenerCupon(id));
            }
            return listaCupon;
        }

        protected void btnConfirmaCanje_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["Usuario"];
            Billetera bille = (Billetera)Session["Billetera"];

            if (usu != null)
            {
                if (bille != null)
                {
                    ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;

                    HiddenField hfCuponID = (HiddenField)item.FindControl("hfCuponID");

                    if (hfCuponID != null)
                    {
                        int id = Convert.ToInt32(hfCuponID.Value);

                        if (id > 0)
                        {
                            Cupon cup = CuponLN.ObtenerCupon(id);
                            if (bille.Ecomonedas_Disponible >= cup.Precio_Canje)
                            {
                                CanjeLN.GuardarCanje(usu.Correo, id.ToString(), DateTime.Now);

                                BilleteraLN.GuardarBilletera(bille.Ecomonedas_Generadas.ToString(),
                                                                (bille.Ecomonedas_Gastadas + cup.Precio_Canje).ToString(),
                                                                (bille.Ecomonedas_Disponible - cup.Precio_Canje).ToString(), usu.Correo);
                                Session["IDCanje"] = id;
                                Response.Redirect("DetalleCuponImprimir.aspx");
                            }
                            else
                            {
                                lblMensaje.Text = "OH NO!!, No cuenta con las Ecomonedas necesarias para este canje.";
                                lblMensaje.CssClass = "alert alert-dismissible alert-secondary";
                                lblMensaje.Visible = true;
                            }
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
                        lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, no se ha detectado un Cupón a Canjear.";
                        lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                        lblMensaje.Visible = true;
                    }
                }
                else
                {
                    lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, al parecer no se encuentra su billetera, contacte con el administrador.";
                    lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                    lblMensaje.Visible = true;
                }
            }
            else
            {
                lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, no se ha detectado un Cliente.";
                lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                lblMensaje.Visible = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cupones.aspx");
        }
    }
}