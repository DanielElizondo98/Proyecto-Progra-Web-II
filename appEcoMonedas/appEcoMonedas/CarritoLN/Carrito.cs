using Contexto;
using LogicaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appEcoMonedas.CarritoLN
{
    public class Carrito
    {
        public List<CarritoCompras> materiales { get; private set; }

        //Implementación Singleton

        // Las propiedades de solo lectura solo se pueden establecer en la inicialización o en un constructor
        public static readonly Carrito Instancia;

        // Se llama al constructor estático tan pronto como la clase se carga en la memoria
        static Carrito()
        {
            // Si el carrito no está en la sesión, cree uno y guarde los items.
            if (HttpContext.Current.Session["carrito"] == null)
            {
                Instancia = new Carrito();
                Instancia.materiales = new List<CarritoCompras>();
                HttpContext.Current.Session["carrito"] = Instancia;
            }
            else
            {
                // De lo contrario, obténgalo de la sesión.
                Instancia = (Carrito)HttpContext.Current.Session["carrito"];
            }
        }

        // Un constructor protegido asegura que un objeto no se puede crear desde el exterior
        protected Carrito() { }

        /**
         * AgregarItem (): agrega un artículo a la compra
         */
        public void AgregarItem(int IDmaterial)
        {
            // Crear un nuevo artículo para agregar al carrito
            Material mat = MaterialLN.ObtenerMaterial(IDmaterial);
            CarritoCompras nuevoItem = new CarritoCompras(IDmaterial, mat);
            // Si este artículo ya existe en lista de artículos, aumente la cantidad
            // De lo contrario, agregue el nuevo elemento a la lista

            if (materiales.Exists(x => x.IDMaterial == IDmaterial))
            {
                CarritoCompras item = materiales.Find(x => x.IDMaterial == IDmaterial);
                item.cantidad++;
                return;
            }

            nuevoItem.cantidad = 1;
            materiales.Add(nuevoItem);

        }

        /**
         * SetItemcantidad(): cambia la cantidad de un artículo en el carrito
         */
        public void SetItemcantidad(int IDMaterial, int cantidad)
        {
            // Si estamos configurando la cantidad a 0, elimine el artículo por completo
            if (cantidad <= 0)
            {
                EliminarItem(IDMaterial);
                return;
            }

            // Encuentra el artículo y actualiza la cantidad
            CarritoCompras actualizarItem = new CarritoCompras(IDMaterial);
            if (materiales.Exists(x => x.IDMaterial == IDMaterial))
            {
                CarritoCompras item = materiales.Find(x => x.IDMaterial == IDMaterial);
                item.cantidad = cantidad;
                return;
            }
        }

        /**
         * EliminarItem (): elimina un artículo del carrito de compras
         */
        public void EliminarItem(int IDMaterial)
        {
            if (materiales.Exists(x => x.IDMaterial == IDMaterial))
            {
                var itemEliminar = materiales.Single(x => x.IDMaterial == IDMaterial);
                materiales.Remove(itemEliminar);
            }

        }

        /**
         * GetSubTotal() - Devuelve el precio total de todos los artículos.
         */
        public decimal GetTotal()
        {
            decimal subTotal = 0;
            
            subTotal += materiales.Sum(x => x.subTotal());

            return subTotal;
        }
        public int totalCantidad()
        {
            int total = 0;
            total = materiales.Sum(x => x.cantidad);

            return total;
        }

        public void eliminarCarrito()
        {
            materiales.Clear();

        }
    }
}