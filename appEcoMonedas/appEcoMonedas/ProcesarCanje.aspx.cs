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
            string permiso = Request.QueryString["permiso"];
            if(permiso == null)
            {
                Response.Redirect("InicioAdminCentro.aspx");
            }
            else
            {
                if (!permiso.Equals("aceptado"))
                {
                    Response.Redirect("InicioAdminCentro.aspx");
                }
            }

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
            lblMensaje.Text = "";
            lblMensaje.Visible = false;
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
                    try
                    {
                        int ID = TransaccionMaterialLN.registrarTransaccion(txtCorreoCliente.Text, hiddenIDCentro.Value, CarritoLN.Carrito.Instancia.materiales);
                        if (ID > 0)
                        {
                            CarritoLN.Carrito.Instancia.eliminarCarrito();
                            //Redireccionar al detalle de este canje
                            Response.Redirect("DetalleCanjeCentro.aspx?IDCanje=" + ID);
                        }
                        else
                        {
                            lblMensaje.Visible = true;
                            lblMensaje.Text = "Ha Ocurrido un error";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Error: " + ex.Message;
                    }
                }
            }else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "No hay datos en la lista de materiales, por lo que no se podrá realizar el canje";
            }
        }

    }
}