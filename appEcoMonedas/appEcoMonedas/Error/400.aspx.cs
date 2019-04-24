using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas.Error
{
    public partial class _400 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVolverInicio_Click(object sender, EventArgs e)
        {
            Usuario us = (Usuario)Session["Usuario"];
            if (us != null)
            {
                if (us.ID_Rol == 1)
                {
                    Response.Redirect("../InicioAdministrador.aspx");
                }
                else
                {
                    if (us.ID_Rol == 2)
                    {
                        Response.Redirect("../InicioAdminCentro.aspx");
                    }
                    else
                    {
                        if (us.ID_Rol == 3)
                        {
                            Response.Redirect("../InicioCliente.aspx");
                        }
                    }
                }
            }
            Response.Redirect("../Inicio.aspx");
        }
    }
}