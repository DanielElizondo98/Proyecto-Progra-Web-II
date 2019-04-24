namespace Contexto
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            Canje = new HashSet<Canje>();
            Centro = new HashSet<Centro>();
            Enc_Transaccion = new HashSet<Enc_Transaccion>();
        }

        [Key]
        [StringLength(255)]
        public string Correo { get; set; }

        [Required]
        [StringLength(30)]
        public string Nombre { get; set; }

        [Required]
        [StringLength(30)]
        public string Apellido1 { get; set; }

        [Required]
        [StringLength(30)]
        public string Apellido2 { get; set; }

        public string Contrasenia { get; set; }

        [Required]
        public string Direccion { get; set; }

        public int Telefono { get; set; }

        public int ID_Rol { get; set; }

        public int? Log_Activo { get; set; }

        public virtual Billetera Billetera { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Canje> Canje { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Centro> Centro { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Enc_Transaccion> Enc_Transaccion { get; set; }

        public virtual Rol Rol { get; set; }
    }
}
