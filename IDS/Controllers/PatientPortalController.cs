using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using IDS.Controllers; // غيّر المسار حسب مشروعك
using IDS.Models;

namespace IDS.Controllers
{
    [Authorize(Roles = "Patient")]
    public class PatientPortalController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public PatientPortalController(AppDbContext context, UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            var user = await _userManager.GetUserAsync(User);

            var patient = await _context.patients
                .Include(p => p.Tickets)
                .Include(p => p.MedicalHistory)
                .FirstOrDefaultAsync(p => p.UserId == user.Id);

            if (patient == null)
                return NotFound();

            return View(patient);
        }
    }
}
