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
    public partial class MantenimientoCentro : System.Web.UI.Page
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
                        lblMensaje.Text = "Centro registrado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-success";
                        lblMensaje.Visible = true;
                        break;
                    case "actu":
                        lblMensaje.Text = "Centro actualizado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-info";
                        lblMensaje.Visible = true;
                        break;
                    case "desactiva":
                        lblMensaje.Text = "Centro desactivado satisfactoriamente!";
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
                CargarListadoCentrosGrid();
                ListaProvincias();
                ListaAdminsAcopio();
            }
        }

        private void CargarListadoCentrosGrid()
        {
            int estadoCargaCentro = Convert.ToInt32(Session["estadoCarga"]);
            grvListado.DataSource = CentroLN.ObtenerListaCentros(estadoCargaCentro).ToList();
            grvListado.DataBind();
        }

        public void ListaProvincias()
        {
            ddlProvincias.DataSource = ProvinciaLN.ObtenerListaProvincias().ToList();
            ddlProvincias.DataBind();
        }
        public void ListaAdminsAcopio()
        {
            ddlAdminsAcopio.DataSource = UsuarioLN.ListaAdminAcopioLibres().ToList();
            ddlAdminsAcopio.DataBind();
        }

        public void limpiaMensaje()
        {
            lblMensaje.Visible = false;
            lblMensaje.Text = "";
            lblMensaje.CssClass = "alert alert-dismissible alert-danger";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            limpiaMensaje();

            bool confirmar = CentroLN.GuardarCentro(txtNombre.Text, ddlProvincias.SelectedValue, txtOtrasSenas.Text, ddlAdminsAcopio.SelectedValue, hiddenID.Value);
            if (confirmar)
            {
                // Recargar la pagina
                string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                Response.Redirect("MantenimientoCentro.aspx?accion=" + accion);

            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede agregar un nuevo Centro";
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiaMensaje();
            txtNombre.Text = "";
            ddlProvincias.SelectedIndex = 0;
            txtOtrasSenas.Text = "";
            ddlProvincias.SelectedIndex = 0;
            hiddenID.Value = "";
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiaMensaje();
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Centro cen = CentroLN.ObtenerListaCentros(2).Where(p => p.ID == id).FirstOrDefault<Centro>();
            txtNombre.Text = cen.Nombre;
            ddlProvincias.SelectedValue = cen.ID_Provincia.ToString();
            txtOtrasSenas.Text = cen.Otras_Senias;
            Usuario adm = UsuarioLN.ObtenerUsuario(cen.ID_Administrador_Centro);
            ddlAdminsAcopio.Items.Add(adm.Correo);
            ddlAdminsAcopio.SelectedValue = cen.ID_Administrador_Centro.ToString();
            hiddenID.Value = cen.ID.ToString();
        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvListado.EditIndex = e.NewEditIndex;
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.EditIndex].Values[0]);
            if (!id.Equals("") || !id.Equals("0"))
            {
                try
                {
                    bool confirmacion = CentroLN.CambiarEstadoCentro(id);
                    if (confirmacion)
                    {
                        string accion = "desactiva";
                        Response.Redirect("MantenimientoCentro.aspx?accion=" + accion);
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No se puedo cambiar el estado del cupon";
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error: " + ex.Message;
                    lblMensaje.Visible = true;
                }

            }
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
            CargarListadoCentrosGrid();
        }

    }
}