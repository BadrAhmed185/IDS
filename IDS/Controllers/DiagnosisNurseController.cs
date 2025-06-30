using IDS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IDS.Controllers
{
    public class DiagnosisNurseController : Controller
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        private readonly AppDbContext _context;

        public DiagnosisNurseController(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            this._userManager = userManager;

            _roleManager = roleManager;
            _context = context;
        }
        public IActionResult Index()
        {
            var tickets = _context.Tickets
                .Where(t => t.Status == "1")
                .OrderBy(t => t.AppointmentDate)
                    .Include(t => t.Patient)
                    .ThenInclude(t => t.MedicalHistory)
                    .Include(t => t.ReferredTo)
                    .Include(t => t.Asnan)
                    .Include(t => t.TicketAccountancy)
                    .ToList();
            return View(tickets);
        }

        [HttpPost]
        [ValidateAntiForgeryTokenAttribute]
        public async Task<IActionResult> EnteringTicket(string id)
        {
                 _context.Tickets
               .FirstOrDefault(t => t.TicketId == id).Status = "2";

            _context.SaveChangesAsync();
            Console.WriteLine("Badr");

          return RedirectToAction(nameof(Index));

        }

    }
}
