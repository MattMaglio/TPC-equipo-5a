namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Operaciones.VW_Precios")]
    public partial class VW_Precios
    {
        [Key]
        [Column("Codigo de Articulo", Order = 0)]
        [StringLength(10)]
        public string Codigo_de_Articulo { get; set; }

        [Key]
        [Column("Descripcion de Articulo", Order = 1)]
        [StringLength(25)]
        public string Descripcion_de_Articulo { get; set; }

        [Key]
        [Column("Codigo de Color", Order = 2)]
        [StringLength(10)]
        public string Codigo_de_Color { get; set; }

        [Key]
        [Column("Descripcion de Color", Order = 3)]
        [StringLength(255)]
        public string Descripcion_de_Color { get; set; }

        [Key]
        [Column("Codigo de Talle", Order = 4)]
        [StringLength(10)]
        public string Codigo_de_Talle { get; set; }

        [Key]
        [Column("Descripcion de Talle", Order = 5)]
        [StringLength(255)]
        public string Descripcion_de_Talle { get; set; }

        [Key]
        [Column(Order = 6)]
        public double Precio { get; set; }
    }
}
