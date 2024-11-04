namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Catalogo.Direcciones")]
    public partial class Direcciones
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Direcciones()
        {
            Envios = new HashSet<Envios>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int IdCliente { get; set; }

        [Required]
        [StringLength(255)]
        public string Calle { get; set; }

        public short Numero { get; set; }

        [Required]
        [StringLength(10)]
        public string CodigoPostal { get; set; }

        public int IdCiudad { get; set; }

        public int IdProvincia { get; set; }

        public bool Estado { get; set; }

        public virtual Ciudades Ciudades { get; set; }

        public virtual Clientes Clientes { get; set; }

        public virtual Provincias Provincias { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Envios> Envios { get; set; }
    }
}
