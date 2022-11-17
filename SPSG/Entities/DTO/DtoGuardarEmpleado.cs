using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.DTO
{
    public class DtoGuardarEmpleado
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public List<int> Jefe { get; set; }
    }
}
