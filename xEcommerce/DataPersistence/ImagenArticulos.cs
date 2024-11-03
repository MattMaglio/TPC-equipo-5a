namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Catalogo.ImagenArticulos")]
    public partial class ImagenArticulos
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int IdArticulo { get; set; }

        [Required]
        [StringLength(255)]
        public string UrlImagen { get; set; }

        public virtual Articulos Articulos { get; set; }
    }
}
