using Microsoft.AspNetCore.Mvc;

namespace IDS.Controllers
{
    public class DiagnosisController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
