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
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = Request.QueryString["error"];
            if (accion != "")
            {
                lblMensaje.Visible = true;
                switch (accion)
                {
                    case "NoCentro":
                        lblMensaje.Text = "De momento no tiene acceso al sistema, debido a que aún no se le ha asignado ningún centro de acopio!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-danger";
                        lblMensaje.Visible = true;
                        break;
                    default:
                        lblMensaje.Visible = false;
                        lblMensaje.Text = "";
                        break;
                }
            }
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario us = UsuarioLN.AutenticarUsuario(txtCorreo.Text, txtContrasenia.Text);
                if (us != null)
                {
                    if(us.ID_Rol == 1)
                    {
                        Session["Usuario"] = us;
                        Response.Redirect("InicioAdministrador.aspx");
                    }
                    else
                    {
                        if(us.ID_Rol == 2)
                        {
                            Centro centroAdmin = CentroLN.ObtenerCentroAdminCentro(us.Correo);
                            if (centroAdmin != null)
                            {
                                Session["Usuario"] = us;
                                Response.Redirect("InicioAdminCentro.aspx");
                            }
                            else
                            {
                                Response.Redirect("InicioSesion.aspx?error=NoCentro");
                            }
                        }
                        else
                        {
                            if(us.ID_Rol == 3)
                            {
                                Session["Usuario"] = us;
                                Response.Redirect("InicioCliente.aspx");
                            }
                            else
                            {
                                Session["Usuario"] = null;
                                lblMensaje.Visible = true;
                                lblMensaje.Text = "Ha ocurrido un error autenticando la cuenta";
                            }
                        }
                    }
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "El correo electrónico o la contraseña no coinciden con ninguna cuenta";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
    }
}