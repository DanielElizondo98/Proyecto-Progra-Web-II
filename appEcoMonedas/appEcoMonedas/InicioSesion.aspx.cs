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
                            Session["Usuario"] = us;
                            Response.Redirect("InicioAdminCentro.aspx");
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