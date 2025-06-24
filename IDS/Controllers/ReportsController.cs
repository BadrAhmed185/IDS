using Microsoft.AspNetCore.Mvc;

namespace IDS.Controllers
{
    public class ReportsController : Controller
    {
        public IActionResult Index()
        {
           return PartialView();
        }
    }
}
