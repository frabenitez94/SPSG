using DataAccess.Context;
using Entities;
using Entities.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class MantenedorBs
    {
        public static List<SP_GET_EMPLEADO_Result> GET_Empleado(DTOFiltroMantenedor dto)
        {
            using (Context context = new Context())
            {
                return context.SP_GET_EMPLEADO(dto.Nombre, dto.Correo, dto.Pagina, dto.Filas).ToList();
            }
        }

        public static List<SP_GET_JEFE_Result> GET_JEFE(DTOFiltroMantenedor dto)
        {
            using (Context context = new Context())
            {
                return context.SP_GET_JEFE(dto.Nombre, dto.Correo, dto.Pagina, dto.Filas).ToList();
            }
        }



    }
}
