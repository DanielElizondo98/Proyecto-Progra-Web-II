namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Billetera")]
    public partial class Billetera
    {
        [Key]
        [StringLength(255)]
        public string ID_Propietario { get; set; }

        public double Ecomonedas_Generadas { get; set; }

        public double Ecomonedas_Gastadas { get; set; }

        public double Ecomonedas_Disponible { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
