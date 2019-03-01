namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Centro")]
    public partial class Centro
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Centro()
        {
            Enc_Transaccion = new HashSet<Enc_Transaccion>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string Nombre { get; set; }

        public int ID_Provincia { get; set; }

        [Required]
        [StringLength(255)]
        public string Otras_Senias { get; set; }

        [Required]
        [StringLength(255)]
        public string ID_Administrador_Centro { get; set; }

        public virtual Usuario Usuario { get; set; }

        public virtual Provincia Provincia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enc_Transaccion> Enc_Transaccion { get; set; }
    }
}
