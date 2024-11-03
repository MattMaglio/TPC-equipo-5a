namespace DataPersistence
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario.PerfilUsuario")]
    public partial class PerfilUsuario
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int IdCliente { get; set; }

        [Required]
        [StringLength(25)]
        public string Usuario { get; set; }

        [Required]
        [StringLength(25)]
        public string Contrasenia { get; set; }

        public int NivelAcceso { get; set; }

        public bool Estado { get; set; }

        public virtual Clientes Clientes { get; set; }

        public virtual NivelAcceso NivelAcceso1 { get; set; }
    }
}
