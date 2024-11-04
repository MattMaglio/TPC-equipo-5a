namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Operaciones.VW_StockPorArticulos")]
    public partial class VW_StockPorArticulos
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string Codigo { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(25)]
        public string Descripcion { get; set; }

        public int? StockPorProducto { get; set; }
    }
}
