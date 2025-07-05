using Examen2_Libreria.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;

namespace Examen2_Libreria.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private readonly LibreriaContext _context;

        public ProductosController(LibreriaContext context)
        {
            _context = context;
        }

        // GET: api/Productos
        [HttpGet]
        [Route("ListaLibros")]
        public async Task<ActionResult> GetProductosConCategoria()
        {
            var productos = await _context.Productos
                .Include(p => p.IdCategoriaNavigation) // Carga la categoría relacionada
                .ToListAsync();

            return Ok(productos);
        }

        // GET: api/Productos/PorCategoria/2
[HttpGet]
[Route("PorCategoria/{idCategoria}")]
public async Task<ActionResult> GetProductosPorCategoria(int idCategoria)
{
    var productos = await _context.Productos
        .Include(p => p.IdCategoriaNavigation)
        .Where(p => p.IdCategoria == idCategoria)
        .ToListAsync();

    if (productos == null || productos.Count == 0)
    {
        return NotFound($"No se encontraron productos para la categoría con ID {idCategoria}.");
    }

    return Ok(productos);
}

        // GET: api/Productos/PorNombre/MiLibro
        [HttpGet]
        [Route("PorNombre/{nombre}")]
        public async Task<ActionResult<IEnumerable<Producto>>> GetProductosPorNombre(string nombre)
        {
            var productos = await _context.Productos
                .Include(p => p.IdCategoriaNavigation)
                .Where(p => p.Nombre != null && p.Nombre.Contains(nombre))
                .ToListAsync();

            if (productos == null || productos.Count == 0)
            {
                return NotFound($"No se encontraron productos con el nombre que contenga: '{nombre}'");
            }

            return Ok(productos);
        }

        [HttpGet]
        [Route("Categorias")]
        public async Task<ActionResult> GetCategorias()
        {
            var categorias = await _context.Categoria.ToListAsync();

            if (categorias == null || categorias.Count == 0)
            {
                return NotFound("No se encontraron categorías.");
            }

            return Ok(categorias);
        }

    }
}
