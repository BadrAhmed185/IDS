using IDS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IDS.Controllers
{
    public class AdminController : Controller
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly AppDbContext _context;

        public AdminController(UserManager<ApplicationUser> userManager, AppDbContext context)
        {
            _context = context;
            // tickets = _context.Tickets.ToList();
            _userManager = userManager;


        }




        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(string load)
        {
            ViewBag.LoadPartial = load;
            return View();
        }



        public async Task<IActionResult> DisplayTicket(string id)
        {
            TempData["New"] = false;

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
                .Include(t => t.TicketAccountancy)
                .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            if (ticket == null)
            {
                return NotFound();
            }

            // ✅ Null Safety Checks
            var ticketVm = new TicketVM
            {
                // Ticket Properties
                PatientId = ticket.PatientId,
                AppointmentDate = ticket.AppointmentDate,
                ChiefComlant = ticket.ChiefComlant,
                PrevisionalDiagnosis = ticket.PrevisionalDiagnosis,
                LevelOfCompletness = ticket.LevelOfCompletness,
                NextDate = ticket.NextDate,

                ReceptionEmpName = await _userManager.Users.Where(u => u.Id == ticket.TicketAccountancy.ReceptionEmpId).Select(u => u.FullName).FirstOrDefaultAsync(),
                DiagnosisDocName = await _userManager.Users.Where(u => u.Id == ticket.TicketAccountancy.DiagnosisDocId).Select(u => u.FullName).FirstOrDefaultAsync(),
                ClinicDocName = await _userManager.Users.Where(u => u.Id == ticket.TicketAccountancy.ClinicDocId).Select(u => u.FullName).FirstOrDefaultAsync(),


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
 