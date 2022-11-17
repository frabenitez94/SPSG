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
            return View();
        }
        public PartialViewResult JefeLista(DTOFiltroMantenedor dto)
        {
            dto.Filas = 10;
            ViewData["Filas"] = dto.Filas;
            ViewData["PaginaActual"] = dto.Pagina;
            return PartialView(MantenedorBs.GET_JEFE(dto));
        }
        #endregion

        #region Empleado
        public ActionResult Empleado()
        {
            return View();
        }
        public PartialViewResult EmpleadoLista(DTOFiltroMantenedor dto)
        {
            dto.Filas = 10;
            ViewData["Filas"] = dto.Filas;
            ViewData["PaginaActual"] = dto.Pagina;
            return PartialView(MantenedorBs.GET_Empleado(dto));
        }
        #endregion
    }
}