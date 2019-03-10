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
    public partial class MantenimientoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = Request.QueryString["accion"];
            if (accion != "")
            {
                lblMensaje.Visible = true;
                switch (accion)
                {
                    case "nuevo":
                        lblMensaje.Text = "Usuario registrado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-success";
                        lblMensaje.Visible = true;
                        break;
                    case "actu":
                        lblMensaje.Text = "Usuario actualizado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-info";
                        lblMensaje.Visible = true;
                        break;
                    case "estado":
                        lblMensaje.Text = "Se ha cambiado el estado del Usuario satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-secondary";
                        lblMensaje.Visible = true;
                        break;
                    default:
                        lblMensaje.Visible = false;
                        lblMensaje.Text = "";
                        break;
                }
            }
            if (!IsPostBack)
            {
                Session["estadoCarga"] = 1;
                CargarRolesDDL();
                CargarListadoUsuariosGrid();
            }
        }

        private void CargarRolesDDL()
        {
            ddlFiltroTipoUsuario.DataSource = RolLN.ListaRolesMantenimiento().ToList();
            ddlFiltroTipoUsuario.DataBind();
            ddlRol.DataSource = RolLN.ListaRolesMantenimiento().ToList();
            ddlRol.DataBind();
        }

        private void CargarListadoUsuariosGrid()
        {
            int estadoCargaMaterial = Convert.ToInt32(Session["estadoCarga"]);
            int rol = Convert.ToInt32(ddlFiltroTipoUsuario.SelectedValue);
            grvListado.DataSource = UsuarioLN.ObtenerListaUsuariosRol(estadoCargaMaterial, rol).ToList();
            grvListado.DataBind();
        }

        protected void ddlFiltroTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiaFormulario();
            ddlRol.SelectedValue = ddlFiltroTipoUsuario.SelectedValue;
            CargarListadoUsuariosGrid();
            if (Convert.ToInt32(ddlFiltroTipoUsuario.SelectedValue) == 3)
            {
                CambiarEstadoControles(false);
            }
            else
            {
                CambiarEstadoControles(true);
            }
        }

        private void CambiarEstadoControles(bool estado)
        {
            txtNombre.Enabled = estado;
            txtApellido1.Enabled = estado;
            txtApellido2.Enabled = estado;
            txtCorreo.Enabled = estado;
            txtDireccion.Enabled = estado;
            txtTelefono.Enabled = estado;
            chkGenerarContrasenia.Enabled = estado;
            btnGuardar.Enabled = estado;
        }

        protected void chkCargarInactivos_CheckedChanged(object sender, EventArgs e)
        {
            if (Session["estadoCarga"] != null)
            {
                int estadoCarga = Convert.ToInt32(Session["estadoCarga"]);
                if (estadoCarga == 1)
                {
                    Session["estadoCarga"] = 0;
                }
                else
                {
                    Session["estadoCarga"] = 1;
                }
            }
            else
            {
                Session["estadoCarga"] = 1;
                chkCargarInactivos.Checked = false;
            }
            CargarListadoUsuariosGrid();
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiaMensaje();
            String correo = Convert.ToString(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Usuario us = UsuarioLN.ObtenerUsuario(correo);
            txtNombre.Text = us.Nombre;
            txtApellido1.Text = us.Apellido1;
            txtApellido2.Text = us.Apellido2;
            txtCorreo.Text = us.Correo;
            txtDireccion.Text = us.Direccion;
            txtTelefono.Text = us.Telefono.ToString();
            ddlRol.SelectedValue = Convert.ToString(us.ID_Rol);
            chkGenerarContrasenia.Checked = false;
            hiddenCorreo.Value = us.Correo;
        }

        private void limpiaFormulario()
        {
            txtNombre.Text = "";
            txtApellido1.Text = "";
            txtApellido2.Text = "";
            txtCorreo.Text = "";
            txtDireccion.Text = "";
            txtTelefono.Text = "";
            hiddenCorreo.Value = "";
            chkGenerarContrasenia.Enabled = false;
        }

        private void limpiaMensaje()
        {
            lblMensaje.Visible = false;
            lblMensaje.Text = "";
            lblMensaje.CssClass = "alert alert-dismissible alert-danger";
        }
        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            limpiaMensaje();
            grvListado.EditIndex = e.NewEditIndex;
            String correo = Convert.ToString(grvListado.DataKeys[grvListado.EditIndex].Values[0]);
            if (!correo.Equals("") || !correo.Equals("0"))
            {
                try
                {
                    bool confirmacion = UsuarioLN.CambiarEstadoUsuario(correo);
                    if (confirmacion)
                    {
                        string accion = "estado";
                        Response.Redirect("MantenimientoUsuario.aspx?accion=" + accion);
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No se pudo cambiar el estado del usuario";
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error: " + ex.Message;
                    lblMensaje.Visible = true;
                }

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ddlRol.SelectedValue) == 2)
            {
                //validar que no exista el usuario

                Usuario us = UsuarioLN.ObtenerUsuario(txtCorreo.Text);
                if (us == null)
                {
                    bool confirmar = UsuarioLN.GuardarUsuario(txtNombre.Text, txtApellido1.Text, txtApellido2.Text, txtDireccion.Text, txtTelefono.Text, ddlRol.SelectedValue, chkGenerarContrasenia.Checked, txtCorreo.Text);
                    if (confirmar)
                    {

                        // Recargar la pagina
                        string accion = (hiddenCorreo.Value == "") ? "nuevo" : "actu";
                        Response.Redirect("MantenimientoUsuario.aspx?accion=" + accion);

                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No se pudo guardar un nuevo usuario";
                        return;
                    }
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Ya existe un usuario registrado con el correo " + txtCorreo.Text;
                    return;
                }
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Lo sentimos, solo tiene autorizado agregar usuario del tipo \"Administrador del Centro de Acopio\", agradecemos su comprención!";
                return;
            }
        }
    }
}