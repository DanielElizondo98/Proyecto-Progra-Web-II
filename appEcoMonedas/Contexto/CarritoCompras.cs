using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contexto
{
    public class CarritoCompras
    {
        public int IDMaterial { get; set; }

        public int cantidad { get; set; }

        //Para establecer el precio del producto
        public double? precioUnitario
        {
            get { return material.Precio; }
        }
        public virtual Material material
        {
            get; set;
        }
        public decimal subTotal()
        {
            return Convert.ToDecimal(precioUnitario * cantidad);
        }
        public CarritoCompras()
        {

        }
        public CarritoCompras(int IDMaterial, Material mat)
        {
            this.IDMaterial = IDMaterial;
            this.material = new Material();
            material = mat;
        }
        public CarritoCompras(int IDMaterial)
        {
            this.IDMaterial = IDMaterial;
        }
    }
}
