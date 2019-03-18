using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class PrincipalAdminCentro : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario us = (Usuario)Session["Usuario"];
            if (us != null)
            {
                if (us.ID_Rol != 2)
                {
                    if (us.ID_Rol == 1)
                    {
                        Response.Redirect("InicioAdministrador.aspx");
                    }
                    else
                    {
                        if (us.ID_Rol == 3)
                        {
                            Response.Redirect("InicioCliente.aspx");
                        }
                    }
                }
                else
                {
                    lblNombreUsuario.Text = String.Format("Bienvenido {0} {1} {2}", us.Nombre, us.Apellido1, us.Apellido2);
                }
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
            if (!IsPostBack)
            {
                listaCarrito();
                LlenarCarritoMenu();
            }
        }

        public void LlenarCarritoMenu()
        {
            CantidadMat.InnerText = Convert.ToString(CarritoLN.Carrito.Instancia.totalCantidad());
            TotalCant.InnerText = Convert.ToString(CarritoLN.Carrito.Instancia.GetTotal());
            CantMatMenu.InnerText = Convert.ToString(CarritoLN.Carrito.Instancia.totalCantidad());
        }

        public void listaCarrito()
        {
            List<CarritoCompras> items = CarritoLN.Carrito.Instancia.materiales;
            lvMateriales.DataSource = items;
            lvMateriales.DataBind();
        }


        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}