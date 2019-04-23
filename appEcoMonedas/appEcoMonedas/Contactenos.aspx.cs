using LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class Contactenos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string cuerpo = "Usuario que envía la notificación: " + txtNombreEmite.Text + " " + txtApellidos.Text + "\n" +
                "Email del Usuario: " + txtCorreoEmite.Text + "\n" +
                "Mensaje: " + txtMensaje.Text;
            try
            {
                CorreoLN.enviar_CorreoContacto(cuerpo, txtObjetivo.Text, txtCorreoEmite.Text);
                lblMensaje.Visible = true;
                lblMensaje.Text = "Correo enviado correctamente";
            }catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.CssClass = "row alert alert-dismissible alert-danger";
                lblMensaje.Text = "Ha ocurrido un error: " + ex.Message;
            }
        }
    }
}