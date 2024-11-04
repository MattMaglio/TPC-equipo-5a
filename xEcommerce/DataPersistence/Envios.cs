namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Shipping.Envios")]
    public partial class Envios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Envios()
        {
            Facturas = new HashSet<Facturas>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? IdDetalleEnvio { get; set; }

        public int? IdCourier { get; set; }

        public int? IdDireccion { get; set; }

        public int? IdEstadoEnvio { get; set; }

        public virtual Direcciones Direcciones { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Facturas> Facturas { get; set; }

        public virtual Couriers Couriers { get; set; }

        public virtual DetallesEnvio DetallesEnvio { get; set; }

        public virtual EstadoEnvio EstadoEnvio { get; set; }
    }
}
