namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Operaciones.Stock")]
    public partial class Stock
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? IdArticulo { get; set; }

        public int? IdColor { get; set; }

        public int? IdTalle { get; set; }

        public int Cantidad { get; set; }

        public virtual Articulos Articulos { get; set; }

        public virtual Colores Colores { get; set; }

        public virtual Talles Talles { get; set; }
    }
}
