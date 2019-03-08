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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cvConfirmarContrasenia_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Equals(txtContrasenia.Text);
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario us = UsuarioLN.ObtenerUsuario(txtCorreo.Text);
                if (us == null)
                {
                    bool confirmacion = UsuarioLN.GuardarUsuario(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtContrasenia.Text, txtDireccion.Text, txtTelefono.Text, "3", txtCorreo.Text);
                    if (confirmacion)
                    {
                        Session["Usuario"] = UsuarioLN.ObtenerUsuario(txtCorreo.Text);
                        Response.Redirect("InicioCliente.aspx");
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Ha ocurrido un error en el registro";
                    }
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Ya existe un usuario registrado con el correo " + txtCorreo.Text;
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