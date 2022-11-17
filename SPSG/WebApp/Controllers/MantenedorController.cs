using Business;
using Entities.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class MantenedorController : Controller
    {
        #region Jefe
        public ActionResult Jefe()
        {
            DTOFiltroMantenedor dto = new DTOFiltroMantenedor();
            ViewData["Empleado"] = MantenedorBs.GET_Empleado(dto);
            return View();
        }
        public PartialViewResult JefeLista(DTOFiltroMantenedor dto)
        {
            dto.Filas = 10;
            ViewData["Filas"] = dto.Filas;
            ViewData["PaginaActual"] = dto.Pagina;

            return PartialView(MantenedorBs.GET_JEFE(dto));
        }
        public JsonResult JefeGuardar(DtoGuardarJefe dto)
        {
            bool resp = MantenedorBs.SET_Jefe(dto);

            return Json(resp);
        }
        public JsonResult JefeEliminar(int id)
        {
            bool resp = MantenedorBs.DELETE_JEFE(id);

            return Json(resp);
        }
        #endregion

        #region Empleado
        public ActionResult Empleado()
        {
            DTOFiltroMantenedor dto = new DTOFiltroMantenedor();
            ViewData["Jefe"] = MantenedorBs.GET_JEFE(dto);
            return View();
        }
        public PartialViewResult EmpleadoLista(DTOFiltroMantenedor dto)
        {
            dto.Filas = 10;
            ViewData["Filas"] = dto.Filas;
            ViewData["PaginaActual"] = dto.Pagina;
            return PartialView(MantenedorBs.GET_Empleado(dto));
        }

        public JsonResult EmpleadoGuardar(DtoGuardarEmpleado dto)
        {
            bool resp = MantenedorBs.SET_Empleado(dto);

            return Json(resp);  
        }
        public JsonResult EmpleadoEliminar(int id)
        {
            bool resp = MantenedorBs.DELETE_Empleado(id);

            return Json(resp);  
        }
        #endregion
    }
}