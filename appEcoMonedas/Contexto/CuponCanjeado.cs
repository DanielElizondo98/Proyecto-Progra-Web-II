using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto
{
    public class CuponCanjeado
    {
        //Propiedades para mostrar en reportes
        public int IDUnico { get; set; }
        
        public byte[] CodigoQR { get; set; }
        
        
        public String NombreCupon { get; set; }
        
        public String DescCupon { get; set; }
        
        public String NombreCliente { get; set; }
        
        public double Precio_Canje { get; set; }
    }
}
