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
    public partial class MantenimientoMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ///Utilizar Linq para verificar que el color no sea el mismo
            string accion = Request.QueryString["accion"];
            if (accion != "")
            {
                lblMensaje.Visible = true;
                switch (accion)
                {
                    case "nuevo":
                        lblMensaje.Text = "Material registrado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-success";
                        lblMensaje.Visible = true;
                        break;
                    case "actu":
                        lblMensaje.Text = "Material actualizado satisfactoriamente!";
                        lblMensaje.CssClass = "row alert alert-dismissible alert-info";
                        lblMensaje.Visible = true;
                        break;
                    case "desactiva":
                        lblMensaje.Text = "Material desactivado satisfactoriamente!";
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
                CargarListadoMaterialesGrid();
            }
        }

        private void CargarListadoMaterialesGrid()
        {
            grvListado.DataSource = MaterialLN.ObtenerListaMateriales(1).ToList();
            grvListado.DataBind();
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
                    archivoImagen.PostedFile.SaveAs(path + "material/" + archivoImagen.FileName);
                }
                catch (Exception ex)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = ex.Message;
                }

                bool confirmar = MaterialLN.GuardarMaterial(txtPrecio.Text, txtNombre.Text, archivoImagen.FileName, txtColor.Value, hiddenID.Value);
                if (confirmar)
                {

                    // Recargar la pagina
                    string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                    Response.Redirect("MantenimientoMaterial.aspx?accion=" + accion);
                    
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No se puede agregar un nuevo material";
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
            txtColor.Value = "#000000";
            txtNombre.Text = "";
            txtPrecio.Text = "";
            imgMaterial.ImageUrl = "#";
            hiddenID.Value = "";
        }

        protected void grvListado_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiaMensaje();
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);
            
            Material mat =
                   MaterialLN.ObtenerListaMateriales(2).
                   Where(p => p.ID == id).FirstOrDefault<Material>();
            txtNombre.Text = mat.Nombre;
            txtPrecio.Text = mat.Precio.ToString();
            txtColor.Value = mat.Color;
            imgMaterial.ImageUrl = "~/imagenes/material/" + mat.Imagen;
            hiddenID.Value = mat.ID.ToString();
        }
        private void limpiaMensaje()
        {
            lblMensaje.Visible = false;
            lblMensaje.Text = "";
            lblMensaje.CssClass = "alert alert-dismissible alert-danger";
        }

        protected void grvListado_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            limpiaMensaje();
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.SelectedIndex].Values[0]);
            if (!id.Equals("") || !id.Equals("0"))
            {
                try
                {
                    bool confirmacion = MaterialLN.CambiarEstadoMaterial(id);
                    if (confirmacion)
                    {
                        string accion = "desactiva";
                        Response.Redirect("MantenimientoMaterial.aspx?accion=" + accion);
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No se puedo cambiar el estado del material";
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error: " + ex.Message;
                    lblMensaje.Visible = true;
                }

            }
        }

        protected void grvListado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvListado.EditIndex = e.NewEditIndex;
            int id = Convert.ToInt32(grvListado.DataKeys[grvListado.EditIndex].Values[0]);
            if (!id.Equals("") || !id.Equals("0"))
            {
                try
                {
                    bool confirmacion = MaterialLN.CambiarEstadoMaterial(id);
                    if (confirmacion)
                    {
                        string accion = "desactiva";
                        Response.Redirect("MantenimientoMaterial.aspx?accion=" + accion);
                    }
                    else
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "No se puedo cambiar el estado del material";
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