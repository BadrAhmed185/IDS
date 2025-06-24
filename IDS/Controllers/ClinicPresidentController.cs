using IDS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace IDS.Controllers
{
    public class ClinicPresidentController : Controller
    {

        // service Layer of Identity
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        private readonly AppDbContext _context;

        public ClinicPresidentController(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            this._userManager = userManager;

            _roleManager = roleManager;
            _context = context;
        }


        public async Task<IActionResult> Index()
        {
            var clinicId = int.Parse(User.FindFirst("ClinicId").Value);
            ViewData["Doctors"] = new SelectList(
                _context.Doctors
                    .Where(d => d.ClinicId == clinicId)
                    .Include(d => d.AppUser)
                    .Select(d => new
                    {
                        Id = d.Id,
                        FullName = d.AppUser.FullName
                    })
                    .ToList(),
                "Id",
                "FullName"
            );

            // var clinicName = User.FindFirst("ClinicName")?.Value;
            Console.WriteLine(clinicId);
            Console.WriteLine("Mango");
            // var docName = User.FindFirst("DocName")?.Value;
            //  var docId = User.FindFirst("DocId")?.Value;


            var tickets = await _context.Tickets
                .Where(t => t.ClinicId == clinicId)
                .Include(t => t.Patient)
                .ThenInclude(t => t.MedicalHistory)
                .Include(t => t.ReferredTo)
                .Include(t => t.Asnan)
                .Include(t => t.Clinic)
                .ToListAsync(); // ✅ Use FirstOrDefaultAsync

            return View(tickets);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> AssignDoctor(string id, string docId)
        {
            // Console.WriteLine("Mango and guava");
            if (id == null || docId == null)
                return NotFound();

            _context.Tickets.Where(t => t.TicketId == id)
                .Include(t => t.TicketAccountancy)
                .FirstOrDefault().TicketAccountancy.ClinicDocId = docId;
            _context.SaveChangesAsync();


            return RedirectToAction("Index", "ClinicPresident"); // Fallback if referer is not available



        }
    }
}
