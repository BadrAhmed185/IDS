using IDS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IDS.Controllers
{
    public class EDoctorController : Controller
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        private readonly AppDbContext _context;

        public EDoctorController(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            this._userManager = userManager;

            _roleManager = roleManager;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {

            ViewBag.controllerName = "EDoctor";

            var clinicId = int.Parse(User.FindFirst("ClinicId")?.Value);
            var docId = User.FindFirst("DocId")?.Value;

            var tickets = await _context.Tickets
              .Where(t => t.ClinicId == clinicId && t.Status == "5" && t.TicketAccountancy.ClinicDocId == docId)
              .OrderBy(t => t.AppointmentDate)
              .Include(t => t.Patient)
              .ThenInclude(t => t.MedicalHistory)
              .Include(t => t.ReferredTo)
              .Include(t => t.Asnan)
              .Include(t => t.Clinic)
              .ToListAsync(); // ✅ Use FirstOrDefaultAsync

            return View(tickets);
        }
    }
}
