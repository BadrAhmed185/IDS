using Microsoft.AspNetCore.Mvc;

namespace IDS.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
