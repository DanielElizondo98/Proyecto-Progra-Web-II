﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appEcoMonedas
{
    public partial class ReporteEcomonedasGeneradas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ObjectDataSource1.SelectParameters[""].DefaultValue = 
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.Refresh();
        }
    }
}