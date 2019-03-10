namespace Contexto
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BD_EcomonedasContext : DbContext
    {
        public BD_EcomonedasContext()
            : base("name=BD_EcomonedasContext")
        {
        }

        public virtual DbSet<Billetera> Billetera { get; set; }
        public virtual DbSet<Canje> Canje { get; set; }
        public virtual DbSet<Centro> Centro { get; set; }
        public virtual DbSet<Color> Color { get; set; }
        public virtual DbSet<Cupon> Cupon { get; set; }
        public virtual DbSet<Det_Transaccion> Det_Transaccion { get; set; }
        public virtual DbSet<Enc_Transaccion> Enc_Transaccion { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Centro>()
                .HasMany(e => e.Enc_Transaccion)
                .WithRequired(e => e.Centro)
                .HasForeignKey(e => e.ID_Centro)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Color>()
                .HasMany(e => e.Material)
                .WithRequired(e => e.Color)
                .HasForeignKey(e => e.ID_Color)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Cupon>()
                .HasMany(e => e.Canje)
                .WithRequired(e => e.Cupon)
                .HasForeignKey(e => e.ID_Cupon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Enc_Transaccion>()
                .HasMany(e => e.Det_Transaccion)
                .WithRequired(e => e.Enc_Transaccion)
                .HasForeignKey(e => e.ID_Encabezado)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Material>()
                .HasMany(e => e.Det_Transaccion)
                .WithRequired(e => e.Material)
                .HasForeignKey(e => e.ID_Material)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Provincia>()
                .HasMany(e => e.Centro)
                .WithRequired(e => e.Provincia)
                .HasForeignKey(e => e.ID_Provincia)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Rol>()
                .HasMany(e => e.Usuario)
                .WithRequired(e => e.Rol)
                .HasForeignKey(e => e.ID_Rol)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasOptional(e => e.Billetera)
                .WithRequired(e => e.Usuario);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Canje)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.ID_Cliente)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Centro)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.ID_Administrador_Centro)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Enc_Transaccion)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.ID_Cliente)
                .WillCascadeOnDelete(false);
        }

        public void FixEProviderServicesProblem() { var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance; }
    }
}
