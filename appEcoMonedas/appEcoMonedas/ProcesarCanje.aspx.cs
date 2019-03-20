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
    public partial class ProcesarCanje : System.Web.UI.Page
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
            Usuario us = (Usuario)Session["Usuario"];
            if (us != null)
            {
                lblTotal.Text = "+ " + CarritoLN.Carrito.Instancia.GetTotal().ToString() + " EcoMonedas";
                Centro centro = CentroLN.ObtenerCentroAdminCentro(us.Correo);
                //Resumen del canje
                txtNombreCentro.Text = centro.Nombre;
                hiddenIDCentro.Value = centro.ID.ToString();
                txtNombreAdminCentro.Text = String.Format("{0} {1} {2}", us.Nombre, us.Apellido1, us.Apellido2);
            }
        }

        private void llenarListaCarrito()
        {
            List<CarritoCompras> items = CarritoLN.Carrito.Instancia.materiales;
            grvCarrito.DataSource = items.ToList();
            grvCarrito.DataBind();
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            Usuario cliente = UsuarioLN.ObtenerUsuario(txtBuscarCliente.Text, 3, 1);
            if (cliente != null)
            {
                txtNombreCliente.Text = String.Format("{0} {1} {2}", cliente.Nombre, cliente.Apellido1, cliente.Apellido2);
                txtCorreoCliente.Text = cliente.Correo;
                txtBuscarCliente.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se encuentra al cliente con el correo " + txtBuscarCliente.Text;
                lblMensaje.CssClass = "col-12 alert alert-dismissible alert-danger";
                lblMensaje.Visible = true;

                txtNombreCliente.Text = "";
                txtCorreoCliente.Text = "";
                txtBuscarCliente.Text = "";
            }
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (!txtCorreoCliente.Text.Equals(""))
            {
                if (grvCarrito.Rows.Count >= 1)
                {
                    if (TransaccionMaterialLN.registrarTransaccion(txtCorreoCliente.Text, hiddenIDCentro.Value, CarritoLN.Carrito.Instancia.materiales))
                    {
                        CarritoLN.Carrito.Instancia.eliminarCarrito();
                        //Redireccionar al detalle de este canje
                        Response.Redirect("InicioAdminCentro.aspx?accion=registro");
                    }
                }
            }
        }

    }
}