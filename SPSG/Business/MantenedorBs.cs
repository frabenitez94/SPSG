using DataAccess;
using DataAccess.SPSGContext;
using Entities;
using Entities.DTO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class MantenedorBs
    {
        public static bool DELETE_Empleado(int id)
        {
            using (SPSGContext context = new SPSGContext())
            {
                return context.SP_DELETE_EMPLEADO(id).First() == 1;
            }
        }

        public static List<SP_GET_EMPLEADO_Result> GET_Empleado(DTOFiltroMantenedor dto)
        {
            using (SPSGContext context = new SPSGContext())
            {
                return context.SP_GET_EMPLEADO(dto.Nombre, dto.Correo, dto.Pagina, dto.Filas).ToList();
            }
        }

        public static List<SP_GET_JEFE_Result> GET_JEFE(DTOFiltroMantenedor dto)
        {
            using (SPSGContext context = new SPSGContext())
            {
                return context.SP_GET_JEFE(dto.Nombre, dto.Correo, dto.Pagina, dto.Filas).ToList();
            }
        }

        public static bool SET_Empleado(DtoGuardarEmpleado dto)
        {
            using (SPSGContext context = new SPSGContext())
            {
                List<Dictionary<object, object>> list = new List<Dictionary<object, object>>();
                if (dto.Jefe != null)
                {
                    foreach (var item in dto.Jefe)
                    {
                        Dictionary<object, object> dy = new Dictionary<object, object>();
                        dy.Add("sjfe_Id", item);
                        list.Add(dy);
                    }
                }
                return context.SP_SET_EMPLEADO(dto.Id, dto.Name, dto.Email, JsonConvert.SerializeObject(list)).First() == 1;
            }
        }

        public static bool SET_Jefe(DtoGuardarJefe dto)
        {
            using (SPSGContext context = new SPSGContext())
            {
                List<Dictionary<object, object>> list = new List<Dictionary<object, object>>();
                if (dto.Empleado != null)
                {
                    foreach (var item in dto.Empleado)
                    {
                        Dictionary<object, object> dy = new Dictionary<object, object>();
                        dy.Add("semp_Id", item);
                        list.Add(dy);
                    }
                }
                return context.SP_SET_JEFE(dto.Id, dto.Name, dto.Email, JsonConvert.SerializeObject(list)).First() == 1;
            }
        }

        public static bool DELETE_JEFE(int id)
        {
            using (SPSGContext context = new SPSGContext())
            {
                return context.SP_DELETE_JEFE(id).First() == 1;
            }
        }
    }
}
