using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class PaginadorController : Controller
    {
        public ActionResult SelectorPaginas(int paginaActual, int cantidadPaginas, String onclick)
        {
            ViewData["PaginaActual"] = paginaActual;
            ViewData["CantidadPaginas"] = cantidadPaginas;
            ViewData["Onclick"] = onclick;
            return PartialView();
        }
    }
}
