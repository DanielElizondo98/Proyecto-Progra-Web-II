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
    public partial class MantenimientoCupon : System.Web.UI.Page
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
                        lblMensaje.Text = "Cupon registrado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-success";
                        lblMensaje.Visible = true;
                        break;
                    case "actu":
                        lblMensaje.Text = "Cupon actualizado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-info";
                        lblMensaje.Visible = true;
                        break;
                    case "desactiva":
                        lblMensaje.Text = "Cupon desactivado satisfactoriamente!";
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
                CargarListadoCuponesGrid();
            }
        }

        public void CargarListadoCuponesGrid()
        {
            grvListado.DataSource = CuponLN.ObtenerListaCupones(1).ToList();
            grvListado.DataBind();
        }

        private void limpiaMensaje()
        {
            lblMensaje.Visible = false;
            lblMensaje.Text = "";
            lblMensaje.CssClass = "alert alert-dismissible alert-danger";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            limpiaMensaje();
            Boolean archivoOK = false;
            String path = Server.MapPath("~/imagenes/");
            if (archivoImagen.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(archivoImagen.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        archivoOK = true;
                    }
                }
            }

            if (archivoOK)
            {
                try
                {
                    archivoImagen.PostedFile.SaveAs(path + "cupon/" + archivoImagen.FileName);
                }
                catch (Exception ex)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = ex.Message;
                }

                bool confirmar = CuponLN.GuardarCupon(txtNombre.Text, txtDescripcion.Text, txtPrecio.Text, archivoImagen.FileName, hiddenID.Value);
                if (confirmar)
                {

                    // Recargar la pagina
                    string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                    Response.Redirect("MantenimientoCupon.aspx?accion=" + accion);

                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No se puede agregar un nuevo Cupon";
                }
            }
            else
            {

                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede aceptar el tipo de archivo.";
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiaMensaje();
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            imgMaterial.ImageUrl = "#";
            hiddenID.Value = "";
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiaMensaje();
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);

            Cupon cup = CuponLN.ObtenerListaCupones(2).Where(p => p.ID == id).FirstOrDefault<Cupon>();
            txtNombre.Text = cup.Nombre;
            txtDescripcion.Text = cup.Descripcion;
            txtPrecio.Text = cup.Precio_Canje.ToString();
            imgMaterial.ImageUrl = "~/imagenes/cupon/" + cup.Imagen;
            hiddenID.Value = cup.ID.ToString();
        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvListado.EditIndex = e.NewEditIndex;
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.EditIndex].Values[0]);
            if (!id.Equals("") || !id.Equals("0"))
            {
                try
                {
                    bool confirmacion = CuponLN.CambiarEstadoCupon(id);
                    if (confirmacion)
                    {
                        string accion = "desactiva";
                        Response.Redirect("MantenimientoCupon.aspx?accion=" + accion);
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
    }
}