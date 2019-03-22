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
    public partial class DetalleCanjeCentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID_Canje = Request.QueryString["IDCanje"];
            int id = 0;
            bool esNumero = int.TryParse(ID_Canje, out id);
            if(esNumero || id > 0)
            {
                LlenarDatosEncabezado(id);
            }
            else
            {
                Response.Redirect("ListaCanjesCentro.aspx?Error=NoEncontrado");
            }
        }

        public void LlenarDatosEncabezado(int ID_Encabezado)
        {
            Enc_Transaccion enc = TransaccionMaterialLN.ObtenerEncabezadoID(ID_Encabezado);
            if(enc != null)
            {
                lblCanjeNumeroCabecera.Text = enc.ID.ToString();
                lblCanjeNumeroInfo.Text = enc.ID.ToString();
                lblFechaCanjeInfo.Text = String.Format("{0:dd/MM/yyyy}", enc.Fecha);

                Usuario cliente = UsuarioLN.ObtenerUsuario(enc.ID_Cliente);
                //Datos del cliente
                lblClienteCanje.Text = String.Format("{0} {1} {2}", cliente.Nombre, cliente.Apellido1, cliente.Apellido2);
                lblTelCliente.Text = cliente.Telefono.ToString();
                hlnkCorreoCliente.NavigateUrl = "mailto:" + cliente.Correo;
                hlnkCorreoCliente.Text = cliente.Correo;

                //Datos Centro
                lblNombreCentro.Text = enc.Centro.Nombre;
                lblAdminCentro.Text = enc.Centro.ID_Administrador_Centro;
                lblDireccionCentro.Text =enc.Centro.Provincia.Descripcion + ". " + enc.Centro.Otras_Senias;

                //Lista de materiales
                grvListaMateriales.DataSource = enc.Det_Transaccion;
                grvListaMateriales.DataBind();

                lblTotal.Text = enc.Total_Ecomonedas.ToString();
            }
            else
            {
                Response.Redirect("ListaCanjesCentro.aspx?Error=NoEncontrado");
            }

        }
    }
}