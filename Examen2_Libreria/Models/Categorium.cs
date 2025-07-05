using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Examen2_Libreria.Models;

public partial class Categorium
{
    public int IdCategoria { get; set; }

    public string? Nombre { get; set; }

    [JsonIgnore]

    public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
}
