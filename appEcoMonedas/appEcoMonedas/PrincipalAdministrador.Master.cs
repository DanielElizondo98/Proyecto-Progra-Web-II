﻿using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class PrincipalAdministrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario us = (Usuario)Session["Usuario"];
            if (us != null)
            {
                if (us.ID_Rol != 1)
                {
                    if (us.ID_Rol == 2)
                    {
                        Response.Redirect("InicioAdminCentro.aspx");
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
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}