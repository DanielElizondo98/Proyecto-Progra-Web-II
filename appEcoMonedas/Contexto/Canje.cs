namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Canje")]
    public partial class Canje
    {
        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string ID_Cliente { get; set; }

        public int ID_Cupon { get; set; }

        public DateTime FechaCanje { get; set; }

        public int? Log_Activo { get; set; }
        
        public virtual Cupon Cupon { get; set; }

        public virtual Usuario Usuario { get; set; }

        [NotMapped]
        public byte[] CodigoQR { get; set; }

        [NotMapped]
        public byte[] ImagenCupon { get; set; }
    }
}
