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
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IEnumerable<Cupon> Cupones = CuponLN.ObtenerListaCupones(1);
            lblContCupones.Text = Cupones.Count()+ "  Cupones";

            IEnumerable<Centro> Centros= CentroLN.ObtenerListaCentros(1);
            lblContCentros.Text = Centros.Count() + "  Centros de Acopio";

            IEnumerable<Usuario> Usuarios = UsuarioLN.ObtenerListaUsuariosRol(1, 3);
            lblContUsuarios.Text = Usuarios.Count() + "  Clientes";
        }
    }
}