namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Facturacion.DetallesFactura")]
    public partial class DetallesFactura
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DetallesFactura()
        {
            Facturas = new HashSet<Facturas>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int NumeroLinea { get; set; }

        public int IdArticulo { get; set; }

        public int IdColor { get; set; }

        public int IdTalle { get; set; }

        [Column(TypeName = "money")]
        public decimal Precio { get; set; }

        public int Cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Colores Colores { get; set; }

        public virtual Talles Talles { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Facturas> Facturas { get; set; }
    }
}
