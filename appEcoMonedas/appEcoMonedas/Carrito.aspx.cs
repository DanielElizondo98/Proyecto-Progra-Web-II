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
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Lista del gridView
                llenarListaCarrito();
                LlenarDatosResumenCanje();
            }
            if(CarritoLN.Carrito.Instancia.materiales.Count == 0)
            {
                btnConfirmaCanje.Enabled = false;
            }else
            {
                btnConfirmaCanje.Enabled = true;
            }
        }

        private void LlenarDatosResumenCanje()
        {
            Usuario us = (Usuario)Session["Usuario"];
            if(us != null)
            {
                if (us.ID_Rol == 2)
                {
                    lblTotal.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
                    CantActual.InnerText = CarritoLN.Carrito.Instancia.totalCantidad().ToString();

                    //Resumen del canje
                    lblCentroDeAcopio.Text = CentroLN.ObtenerCentroAdminCentro(us.Correo).Nombre;
                    lblNombreAdminCentro.Text = String.Format("{0} {1} {2}", us.Nombre, us.Apellido1, us.Apellido2);
                    lblSubtotalCanje.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
                    lblTotalCanje.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
                }
            }
        }

        private void llenarListaCarrito()
        {
            List<CarritoCompras> items = CarritoLN.Carrito.Instancia.materiales;
            grvCarrito.DataSource = items.ToList();
            grvCarrito.DataBind();
        }

        protected void grvCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idMaterial = Convert.ToInt32(grvCarrito.DataKeys[e.RowIndex].Values[0]);
            CarritoLN.Carrito.Instancia.EliminarItem(idMaterial);
            llenarListaCarrito();
            PrincipalAdminCentro master = Page.Master as PrincipalAdminCentro;
            master.LlenarCarritoMenu();
            master.listaCarrito();
            LlenarDatosResumenCanje();
        }

        protected void CantidadComprar_TextChanged(object sender, EventArgs e)
        {
            GridViewRow currentRow = (GridViewRow)((TextBox)sender).Parent.Parent;
            TextBox txtCantidad = (TextBox)currentRow.FindControl("CantidadComprar");
            if (txtCantidad.Text != "")
            {
                int cantidad = Convert.ToInt32(txtCantidad.Text);
                int idMaterial = Convert.ToInt32(grvCarrito.DataKeys[currentRow.RowIndex].Values[0]);
                CarritoLN.Carrito.Instancia.SetItemcantidad(idMaterial, cantidad);
                llenarListaCarrito();
                PrincipalAdminCentro master = Page.Master as PrincipalAdminCentro;
                master.LlenarCarritoMenu();
                master.listaCarrito();
                LlenarDatosResumenCanje();
            }
        }

        protected void btnConfirmaCanje_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            lblMensaje.Visible = false;
            Usuario us = (Usuario)Session["Usuario"];
            Centro centro = CentroLN.ObtenerCentroAdminCentro(us.Correo);

            if (centro.Log_Activo != 0)
            {
                Response.Redirect("ProcesarCanje.aspx?permiso=aceptado");
            }else
            {
                lblMensaje.Text = "Lo sentimos, el centro de acopio: \"" + centro.Nombre + "\" se encuentra en estos momentos inactivo, por lo que no podrá realizar canjes hasta que vuelva a ser habilitado, agradecemos su compresión";
                lblMensaje.Visible = true;
            }
        }
    }
}