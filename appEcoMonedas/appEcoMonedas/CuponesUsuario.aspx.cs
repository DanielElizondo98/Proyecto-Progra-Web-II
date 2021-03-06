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
    public partial class CuponesUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<Canje> ListadoCanjear()
        {
            List<Canje> listaCanjes = new List<Canje>();

            Usuario usu = (Usuario)Session["Usuario"];
            if (usu != null)
            {
                string id = usu.Correo;

                listaCanjes = ((List<Canje>)CanjeLN.ObtenerListaCanjexUsuario(id,1).ToList());
            }
            return listaCanjes;
        }

        public List<Canje> ListadoCanjeados()
        {
            List<Canje> listaCanjes = new List<Canje>();

            Usuario usu = (Usuario)Session["Usuario"];
            if (usu != null)
            {
                string id = usu.Correo;

                listaCanjes = CanjeLN.ObtenerListaCanjexUsuario(id, 0).ToList();
            }
            return listaCanjes;
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {

        }

        protected void btnImprimir_Click1(object sender, EventArgs e)
        {
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;

            HiddenField hfCanjeID = (HiddenField)item.FindControl("hfCanjeID");

            int id = Convert.ToInt32(hfCanjeID.Value);

            Session["IDCanje"] = id;

            Response.Redirect("DetalleCuponImprimir.aspx");
        }
    }
}