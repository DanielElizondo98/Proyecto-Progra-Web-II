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
    public partial class PerfilCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario us = (Usuario)Session["Usuario"];
                if (us != null)
                    CargarDatosUsuario(us);
            }
        }
        private void CargarDatosUsuario(Usuario us)
        {
            txtApellido1Edita.Text = us.Apellido1;
            txtApellido2Edita.Text = us.Apellido2;
            txtCorreoEdita.Text = us.Correo;
            txtDireccionEdita.Text = us.Direccion;
            txtNombreEdita.Text = us.Nombre;
            txtTelefonoEdita.Text = us.Telefono.ToString();

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void btnGuardarContraseña_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Usuario us = (Usuario)Session["Usuario"];
                UsuarioLN.GuardarContrasenia(txtContraseniaNueva.Text, us.Correo);
                Session["Usuario"] = null;
                us.Contrasenia = txtContraseniaNueva.Text;
                Session["Usuario"] = us;
                LimpiarFormularioContrasenia();
            }
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            Usuario us = (Usuario)Session["Usuario"];
            ActualizarDetallesUsuario(us);
            UsuarioLN.GuardarUsuario(us);
        }

        private void LimpiarFormularioContrasenia()
        {
            txtConfirmaContrasenia.Text = "";
            txtContraseniaActual.Text = "";
            txtContraseniaNueva.Text = "";
        }

        private void ActualizarDetallesUsuario(Usuario us)
        {
            us.Nombre = txtNombreEdita.Text;
            us.Apellido1 = txtApellido1Edita.Text;
            us.Apellido2 = txtApellido2Edita.Text;
            us.Telefono = Convert.ToInt32(txtTelefonoEdita.Text);
            us.Direccion = txtDireccionEdita.Text;
        }

        protected void cvContraseniaAnterior_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Usuario us = (Usuario)Session["Usuario"];
            args.IsValid = us.Contrasenia.Equals(args.Value) ? true : false;
        }
    }
}