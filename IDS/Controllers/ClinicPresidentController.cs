using IDS.Models;
using IDS.Models.ViewModels;
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
            ViewBag.controllerName = "ClinicPresident";

            var clinicId = int.Parse(User.FindFirst("ClinicId").Value);
            ViewData["Doctors"] = new SelectList(

                // Hospital requirments d.ActivePatientsUnderResposibility < 5
                _context.Doctors
                    .Where(d => d.ClinicId == clinicId && d.ActivePatientsUnderResposibility < 5)
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
            //Console.WriteLine(clinicId);
            //Console.WriteLine("Mango");
            // var docName = User.FindFirst("DocName")?.Value;
            //  var docId = User.FindFirst("DocId")?.Value;


            var tickets = await _context.Tickets
                .Where(t => t.ClinicId == clinicId && t.Status == "4")
                .OrderBy(t => t.AppointmentDate)
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

            var ticket =_context.Tickets.Where(t => t.TicketId == id)
                .Include(t => t.TicketAccountancy)
                .FirstOrDefault();

            var doctor = _context.Doctors.Where(d => d.Id == docId).FirstOrDefault();

            if (doctor == null || ticket == null)
            {
                TempData["Error"] = "عذرآ حدث حطأ ما , الرجاء المحاوله مره اخري";
                return RedirectToAction("Index", "ClinicPresident"); // Fallback if referer is not available

            }

            ticket.TicketAccountancy.ClinicDocId = docId;
            ticket.Status = "5";

            doctor.ActivePatientsUnderResposibility++;

            await _context.SaveChangesAsync();

            TempData["Success"] = "تم تحويل الحالة إلي الطبيب المختص";
            return RedirectToAction("Index", "ClinicPresident"); // Fallback if referer is not available

        }


        public async Task<IActionResult> ShowPatientProfile(string id)
        {
            ViewBag.controllerName = "ClinicPresident";

            ViewBag.entity = "تذكرة";
            ViewBag.theEntity = "التذكرة";
            ViewBag.pluralEntity = "تذاكر";
            ViewBag.thePluralEntity = "التذكرة";
            ViewBag.placeHolder = "171155";

            if (id == null)
            {
                return NotFound();
            }

            if (!_context.patients.Select(t => t.PatientId).Contains(id))
            {
                TempData["Error"] = "عذرا , هذا المريض غير موجود";
                return RedirectToAction(nameof(Index));
            }

            PatientProfileVm ppv = new PatientProfileVm();

            Patient patient = await _context.patients
                .AsNoTracking()
                .Include(p => p.Tickets)
                .ThenInclude(t => t.ReferredTo)
                .FirstOrDefaultAsync(p => p.PatientId == id);

            ppv.PatientId = patient.PatientId;
            ppv.Name = patient.Name;
            ppv.Address = patient.Address;
            ppv.phoneNumber = patient.phoneNumber;
            ppv.Gender = patient.Gender;
            ppv.Age = patient.Age;
            ppv.Tickets = patient.Tickets.ToList();

            return View("PatientProfile", ppv);

        }


        public async Task<IActionResult> DisplayTicket(string id)
        {
            // TempData["New"] = false;
            ViewBag.controllerName = "ClinicPresident";


            if (id == null)
            {
                return NotFound();
            }

            if (!_context.Tickets.Select(t => t.TicketId).Contains(id))
            {
                TempData["Error"] = "عذرا , هذه التذكره غير موجوده";
                return RedirectToAction(nameof(Index));
            }



            /////////////Important notes About null
            #region
            ////////////////Important about null : 
            // var tickets = _context.Tickets; // ✅ This is an IQueryable<Ticket>, not a list! This does not retrieve any data immediately.    
            //  The query only executes when you iterate over it(e.g., using .ToList(), .FirstOrDefault(), etc.).

            //ToList() returns a list(empty or filled)
            //FirstOrDefault() returns a single object(or null if nothing is found)


            // What Happens When There’s No Match?
            //Query                                                         Return Type                                            What It Returns If No Match?
            //_context.Tickets.Where(e => e.Id == id);                      IQueryable<Ticket>                                     An empty queryable(not null)
            //_context.Tickets.Where(e => e.Id == id).ToList();             List<Ticket>                                           An empty list[]

            //_context.Tickets.Select(e => e.Id);                           IQueryable<int>                                        Empty queryable(not null)
            //_context.Tickets.Select(e => e.Id).ToList();                  List<int> Empty                                        list[](not null)

            //_context.Tickets.FirstOrDefault(e => e.Id == id);             Ticket ?                                                (nullable)null
            //_context.Tickets.SingleOrDefault(e => e.Id == id);            Ticket ?                                                (nullable)null(if no match), Exception(if multiple matches)

            #endregion



            #region
            //,, important about db ;loading , queries and data reader
            //  .ToList() retrieves all tickets from the database and loads them into memory.
            // .FirstOrDefault(t => t.TicketId == id) filters the list in memory to find the first matching record



            // ✅ Fix: Remove.ToList() and use FirstOrDefaultAsync() instead.
            // When you use.ToList(), EF keeps the DataReader open while it loads all records.
            //If your database has 100,000 tickets, all of them are loaded into memory even though you only need one!
            //This wastes memory and slows down performance.
            //It increases database load and can lead to higher RAM usage in large systems.

            //Missing await for database operations
            //Since you're inside an async action, database queries should use await with FirstOrDefaultAsync() to avoid blocking the thread.
            #endregion


            // Wrong code 
            //var ticket = _context.Tickets
            //.AsNoTracking()

            //.Include(t => t.MedicalHistory)
            //.Include(t => t.Patient)
            //.Include(t => t.ReferredTo)
            //.ToList()
            //.FirstOrDefault(t => t.TicketId == id); // ✅ Use ToList()

            var ticket = await _context.Tickets
                .AsNoTracking()
                .Include(t => t.Patient)
                .ThenInclude(t => t.MedicalHistory)
                .Include(t => t.ReferredTo)
                .Include(t => t.Asnan)
                .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            if (ticket == null)
            {
                return NotFound();
            }

            // ✅ Null Safety Checks
            var ticketVm = new TicketVM
            {
                // Ticket Properties
                TicketID = ticket.TicketId,
                PatientId = ticket.PatientId,
                AppointmentDate = ticket.AppointmentDate,
                ChiefComlant = ticket.ChiefComlant,
                PrevisionalDiagnosis = ticket.PrevisionalDiagnosis,

                // Patient Properties (Null check added)
                Name = ticket.Patient?.Name ?? "N/A",
                Address = ticket.Patient?.Address ?? "N/A",
                profession = ticket.Patient?.profession ?? "N/A",
                phoneNumber = ticket.Patient?.phoneNumber ?? "N/A",
                Gender = ticket.Patient?.Gender ?? "N/A",
                Age = ticket.Patient?.Age ?? 0,

                // Medical History Properties (Null check added)
                HeartTrouble = ticket.Patient.MedicalHistory?.HeartTrouble ?? false,
                Hyperttention = ticket.Patient.MedicalHistory?.Hyperttention ?? false,
                Pregnancy = ticket.Patient.MedicalHistory?.Pregnancy ?? false,
                Diabetes = ticket.Patient.MedicalHistory?.Diabetes ?? false,
                Hepatitis = ticket.Patient.MedicalHistory?.Hepatitis,
                AIDs = ticket.Patient.MedicalHistory?.AIDs ?? false,
                Tuberculosis = ticket.Patient.MedicalHistory?.Tuberculosis ?? false,
                Allergies = ticket.Patient.MedicalHistory?.Allergies ?? false,
                Anemia = ticket.Patient.MedicalHistory?.Anemia ?? false,
                Rheumatism = ticket.Patient.MedicalHistory?.Rheumatism ?? false,
                RadTherapy = ticket.Patient.MedicalHistory?.RadTherapy ?? false,
                Haemophilia = ticket.Patient.MedicalHistory?.Haemophilia ?? false,
                AspirinIntake = ticket.Patient.MedicalHistory?.AspirinIntake ?? false,
                KidneyTroubles = ticket.Patient.MedicalHistory?.KidneyTroubles ?? false,
                Asthma = ticket.Patient.MedicalHistory?.Asthma ?? false,
                HayFever = ticket.Patient.MedicalHistory?.HayFever ?? false,
                MedicalHistoryText = ticket.Patient.MedicalHistory?.MedicalHistoryText ?? "N/A",

                // Referred To Properties (Null check added)
                Oral = ticket.ReferredTo?.Oral ?? false,
                RemovableProsth = ticket.ReferredTo?.RemovableProsth ?? false,
                Operative = ticket.ReferredTo?.Operative ?? false,
                Endodontic = ticket.ReferredTo?.Endodontic ?? false,
                Ortho = ticket.ReferredTo?.Ortho ?? false,
                CrownAndBridge = ticket.ReferredTo?.CrownAndBridge ?? false,
                Surgery = ticket.ReferredTo?.Surgery ?? false,
                Pedo = ticket.ReferredTo?.Pedo ?? false,
                XRay = ticket.ReferredTo?.XRay ?? false,

                // Asnan Properties

                // Upper Right (Quadrant 1)
                tooth11 = ticket.Asnan?.tooth11 ?? false,
                tooth12 = ticket.Asnan?.tooth12 ?? false,
                tooth13 = ticket.Asnan?.tooth13 ?? false,
                tooth14 = ticket.Asnan?.tooth14 ?? false,
                tooth15 = ticket.Asnan?.tooth15 ?? false,
                tooth16 = ticket.Asnan?.tooth16 ?? false,
                tooth17 = ticket.Asnan?.tooth17 ?? false,
                tooth18 = ticket.Asnan?.tooth18 ?? false,

                // Upper Left (Quadrant 2)
                tooth21 = ticket.Asnan?.tooth21 ?? false,
                tooth22 = ticket.Asnan?.tooth22 ?? false,
                tooth23 = ticket.Asnan?.tooth23 ?? false,
                tooth24 = ticket.Asnan?.tooth24 ?? false,
                tooth25 = ticket.Asnan?.tooth25 ?? false,
                tooth26 = ticket.Asnan?.tooth26 ?? false,
                tooth27 = ticket.Asnan?.tooth27 ?? false,
                tooth28 = ticket.Asnan?.tooth28 ?? false,

                // Lower Left (Quadrant 3)
                tooth31 = ticket.Asnan?.tooth31 ?? false,
                tooth32 = ticket.Asnan?.tooth32 ?? false,
                tooth33 = ticket.Asnan?.tooth33 ?? false,
                tooth34 = ticket.Asnan?.tooth34 ?? false,
                tooth35 = ticket.Asnan?.tooth35 ?? false,
                tooth36 = ticket.Asnan?.tooth36 ?? false,
                tooth37 = ticket.Asnan?.tooth37 ?? false,
                tooth38 = ticket.Asnan?.tooth38 ?? false,

                // Lower Right (Quadrant 4)
                tooth41 = ticket.Asnan?.tooth41 ?? false,
                tooth42 = ticket.Asnan?.tooth42 ?? false,
                tooth43 = ticket.Asnan?.tooth43 ?? false,
                tooth44 = ticket.Asnan?.tooth44 ?? false,
                tooth45 = ticket.Asnan?.tooth45 ?? false,
                tooth46 = ticket.Asnan?.tooth46 ?? false,
                tooth47 = ticket.Asnan?.tooth47 ?? false,
                tooth48 = ticket.Asnan?.tooth48 ?? false,
                //  sen1=  ticket.dentals?.sen1 ?? false,
            };

            return View(ticketVm);
        }
    }
}
