namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Det_Transaccion
    {
        public int ID { get; set; }

        public int ID_Encabezado { get; set; }

        public int ID_Material { get; set; }

        public int Cantidad { get; set; }

        public double Sub_Total { get; set; }

        public virtual Enc_Transaccion Enc_Transaccion { get; set; }

        public virtual Material Material { get; set; }
    }
}
