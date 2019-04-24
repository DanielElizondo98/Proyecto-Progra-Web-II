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
            string ID_Canje = Request.QueryString["id"];
            int id = 0;
            bool esNumero = int.TryParse(ID_Canje, out id);
            if (esNumero || id > 0)
            {
                if (!IsPostBack)
                {
                    LlenaDatosUsuario();
                    try
                    {

                        cargarDatosCanje(id);
                    }
                    catch (Exception)
                    {
                        Response.Redirect("Cupones.aspx?Error=NoEncontrado");
                    }
                }
            }
            else
            {
                Response.Redirect("Cupones.aspx?Error=NoEncontrado");
            }
        }

        private void cargarDatosCanje(int cuponId)
        {
            Cupon cup = CuponLN.ObtenerCupon(cuponId);
            List<Cupon> listaCupon = new List<Cupon>();
            if (cup != null)
            {
                listaCupon.Add(cup);
                gvCupon.DataSource = listaCupon;
                gvCupon.DataBind();
            }else
            {

                Response.Redirect("Cupones.aspx?Error=NoEncontrado");
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
                //Probar con un DataBinding o con un prerender
                lblNombreUsuario.Text = usu.Nombre + " " + usu.Apellido1 + " " + usu.Apellido2;
                txtCorreo.Text = usu.Correo;
                txtDireccion.Text = usu.Direccion;
                txtEcomonedas.Text = billetera.Ecomonedas_Disponible + "";
            }

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
                                try
                                {
                                    int IDCanje = CanjeLN.GuardarCanje(usu.Correo, id.ToString(), DateTime.Now);

                                    BilleteraLN.GuardarBilletera(bille.Ecomonedas_Generadas.ToString(),
                                                                    (bille.Ecomonedas_Gastadas + cup.Precio_Canje).ToString(),
                                                                    (bille.Ecomonedas_Disponible - cup.Precio_Canje).ToString(), usu.Correo);
                                    Session["IDCanje"] = IDCanje;
                                    Response.Redirect("DetalleCuponImprimir.aspx");
                                }
                                catch (Exception)
                                {
                                    lblMensaje.Text = "OH NO!!, Ha ocurrido un error.";
                                    lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                                    lblMensaje.Visible = true;
                                }
                            }
                            else
                            {
                                lblMensaje.Text = "OH NO!!, No cuenta con las Ecomonedas necesarias para este canje.";
                                lblMensaje.CssClass = "alert alert-dismissible alert-warning";
                                lblMensaje.Visible = true;
                            }
                        }
                        else
                        {
                            lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error";
                            lblMensaje.CssClass = "alert alert-dismissible alert-danger";
                            lblMensaje.Visible = true;
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "OH NO¡¡ Ha ocurrido un error, no se ha detectado un Cupón a Canjear.";
                        lblMensaje.CssClass = "alert alert-dismissible alert-warning";
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