namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Enc_Transaccion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Enc_Transaccion()
        {
            Det_Transaccion = new HashSet<Det_Transaccion>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string ID_Cliente { get; set; }

        public int ID_Centro { get; set; }

        public DateTime Fecha { get; set; }

        public double? Total_Ecomonedas { get; set; }

        public virtual Centro Centro { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Det_Transaccion> Det_Transaccion { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
