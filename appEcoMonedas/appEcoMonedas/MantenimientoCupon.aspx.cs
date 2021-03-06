﻿using Contexto;
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
                Session["estadoCarga"] = 1;

                CargarListadoCuponesGrid();
            }
        }

        public void CargarListadoCuponesGrid()
        {
            int estadoCargaCentro = Convert.ToInt32(Session["estadoCarga"]);
            grvListado.DataSource = CuponLN.ObtenerListaCupones(estadoCargaCentro).ToList();
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
            String fileName = "";
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
                if (archivoOK)
                {
                    try
                    {
                        String path = Server.MapPath("~/imagenes/");
                        archivoImagen.PostedFile.SaveAs(path + "cupon/" + archivoImagen.FileName);
                        fileName = archivoImagen.FileName;
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = ex.Message;
                    }
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No se puede aceptar el tipo de archivo.";
                    return;
                }
            }
            bool confirmar = CuponLN.GuardarCupon(txtNombre.Text, txtDescripcion.Text, txtPrecio.Text, archivoImagen.FileName, hiddenID.Value);
            if (confirmar)
            {

                // Recargar la pagina
                string accion = (hiddenID.Value == "" || hiddenID.Value == "0") ? "nuevo" : "actu";
                rqvArchivoImagen.Enabled = true;
                Response.Redirect("MantenimientoCupon.aspx?accion=" + accion);

            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No se puede agregar un nuevo Cupon";
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
            rqvArchivoImagen.Enabled = false;
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
            CargarListadoCuponesGrid();
        }

        protected void grvListado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.TableSection = TableRowSection.TableHeader;
        }
    }
}