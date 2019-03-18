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
        }

        private void LlenarDatosResumenCanje()
        {
            lblTotal.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
            CantActual.InnerText = CarritoLN.Carrito.Instancia.totalCantidad().ToString();

            //Resumen del canje
            Usuario us = (Usuario)Session["Usuario"];
            lblCentroDeAcopio.Text = CentroLN.ObtenerCentroAdminCentro( us.Correo).Nombre;
            lblNombreAdminCentro.Text = String.Format("{0} {1} {2}", us.Nombre, us.Apellido1, us.Apellido2);
            lblSubtotalCanje.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
            lblTotalCanje.Text = CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
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
    }
}