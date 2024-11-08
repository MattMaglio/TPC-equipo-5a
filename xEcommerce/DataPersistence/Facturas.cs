namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Facturacion.Facturas")]
    public partial class Facturas
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int IdDetalleFactura { get; set; }

        public int IdDetallePago { get; set; }

        public int IdEnvio { get; set; }

        public int IdCliente { get; set; }

        [Required]
        [StringLength(1)]
        public string Letra { get; set; }

        [Column(TypeName = "date")]
        public DateTime Fecha { get; set; }

        public short PuntoDeVenta { get; set; }

        public int Numero { get; set; }

        [Column(TypeName = "money")]
        public decimal MontoTotal { get; set; }

        public double IVA { get; set; }

        public virtual Clientes Clientes { get; set; }

        public virtual DetallesFactura DetallesFactura { get; set; }

        public virtual DetallesPago DetallesPago { get; set; }

        public virtual Envios Envios { get; set; }
    }
}
