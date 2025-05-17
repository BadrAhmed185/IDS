//////////////// Ticket Controller //////////////////

using IDS.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace IDS.Controllers
{
    public class TicketController : Controller
    {


        private readonly AppDbContext _context;
        private readonly IEnumerable<Patient> Patients;
        private readonly IEnumerable<string> PatientsIds;
        private readonly IEnumerable<Ticket> tickets;



        public TicketController(AppDbContext context)
        {
            _context = context;
            Patients = _context.patients.ToList();
            PatientsIds = Patients.Select(p => p.PatientId).ToList();
            tickets = _context.Tickets.ToList();


        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> ShowFullTicket(string id)
        {
            TempData["New"] = false;

            if (id == null)
            {
                return NotFound();
            }

            if (!tickets.Select(t => t.TicketId).Contains(id))
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
                .Include(t => t.MedicalHistory)
                .Include(t => t.Patient)
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
                HeartTrouble = ticket.MedicalHistory?.HeartTrouble ?? false,
                Hyperttention = ticket.MedicalHistory?.Hyperttention ?? false,
                Pregnancy = ticket.MedicalHistory?.Pregnancy ?? false,
                Diabetes = ticket.MedicalHistory?.Diabetes ?? false,
                Hepatitis = ticket.MedicalHistory.Hepatitis,
                AIDs = ticket.MedicalHistory?.AIDs ?? false,
                Tuberculosis = ticket.MedicalHistory?.Tuberculosis ?? false,
                Allergies = ticket.MedicalHistory?.Allergies ?? false,
                Anemia = ticket.MedicalHistory?.Anemia ?? false,
                Rheumatism = ticket.MedicalHistory?.Rheumatism ?? false,
                RadTherapy = ticket.MedicalHistory?.RadTherapy ?? false,
                Haemophilia = ticket.MedicalHistory?.Haemophilia ?? false,
                AspirinIntake = ticket.MedicalHistory?.AspirinIntake ?? false,
                KidneyTroubles = ticket.MedicalHistory?.KidneyTroubles ?? false,
                Asthma = ticket.MedicalHistory?.Asthma ?? false,
                HayFever = ticket.MedicalHistory?.HayFever ?? false,
                MedicalHistoryText = ticket.MedicalHistory?.MedicalHistoryText ?? "N/A",

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

            return View("Ticket", ticketVm);
        }



        // In .NET, Task is a class in the System.Threading.
        // Tasks namespace used to represent asynchronous operations. 
        public async Task<IActionResult> CreateTicketForNewPatient()
        {
            TempData["New"] = true;

            return View("ReceptionTicket");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateTicketForNewPatient(TicketVM ticket)
        {

            var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
            TempData["Errors"] = errors;


            //foreach (var error in errors)
            //{
            //    Console.WriteLine(error.ErrorMessage);
            //}

            if (PatientsIds.Contains(ticket.PatientId))
            {
                TempData["Error"] = "عذرا , هذا المريض مسجل بالفعل";
                return View("ReceptionTicket", ticket);
            }

            if (ModelState.IsValid)
            {
                Patient patient = new Patient();
                Ticket newTicket = new Ticket(_context);

                // Ticket properties
                {
                    newTicket.PatientId = patient.PatientId;
                    newTicket.AppointmentDate = ticket.AppointmentDate;
                }

                // Patient properties
                {
                    patient.PatientId = ticket.PatientId;
                    patient.Name = ticket.Name;
                    patient.Address = ticket.Address;
                    patient.profession = ticket.profession;
                    patient.phoneNumber = ticket.phoneNumber;
                    patient.Gender = ticket.Gender;
                    patient.Age = ticket.Age;
                }

                // referredTo properties

                var referredTo = new ReferredTo
                {
                    Id = newTicket.TicketId,
                    Oral = ticket.Oral,
                    RemovableProsth = ticket.RemovableProsth,
                    Operative = ticket.Operative,
                    Endodontic = ticket.Endodontic,
                    Ortho = ticket.Ortho,
                    CrownAndBridge = ticket.CrownAndBridge,
                    Surgery = ticket.Surgery,
                    Pedo = ticket.Pedo,
                    XRay = ticket.XRay,
                };

                // medicalHistory properties

                var medicalHistory = new MedicalHistory
                {
                    Id = newTicket.TicketId,

                    HeartTrouble = ticket.HeartTrouble,
                    Hyperttention = ticket.Hyperttention,
                    Pregnancy = ticket.Pregnancy,
                    Diabetes = ticket.Diabetes,
                    Hepatitis = ticket.Hepatitis,
                    AIDs = ticket.AIDs,
                    Tuberculosis = ticket.Tuberculosis,
                    Allergies = ticket.Allergies,
                    Anemia = ticket.Anemia,
                    Rheumatism = ticket.Rheumatism,
                    RadTherapy = ticket.RadTherapy,
                    Haemophilia = ticket.Haemophilia,
                    AspirinIntake = ticket.AspirinIntake,
                    KidneyTroubles = ticket.KidneyTroubles,
                    Asthma = ticket.Asthma,
                    HayFever = ticket.HayFever,
                    MedicalHistoryText = ticket.MedicalHistoryText,
                };

                // asnan properties

                var asnan = new Asnan
                {
                    Id = newTicket.TicketId,

                    tooth11 = ticket.tooth11,
                    tooth12 = ticket.tooth12,
                    tooth13 = ticket.tooth13,
                    tooth14 = ticket.tooth14,
                    tooth15 = ticket.tooth15,
                    tooth16 = ticket.tooth16,
                    tooth17 = ticket.tooth17,
                    tooth18 = ticket.tooth18,

                    // Upper Left (Quadrant 2)
                    tooth21 = ticket.tooth21,
                    tooth22 = ticket.tooth22,
                    tooth23 = ticket.tooth23,
                    tooth24 = ticket.tooth24,
                    tooth25 = ticket.tooth25,
                    tooth26 = ticket.tooth26,
                    tooth27 = ticket.tooth27,
                    tooth28 = ticket.tooth28,

                    // Lower Left (Quadrant 3)
                    tooth31 = ticket.tooth31,
                    tooth32 = ticket.tooth32,
                    tooth33 = ticket.tooth33,
                    tooth34 = ticket.tooth34,
                    tooth35 = ticket.tooth35,
                    tooth36 = ticket.tooth36,
                    tooth37 = ticket.tooth37,
                    tooth38 = ticket.tooth38,

                    // Lower Right (Quadrant 4)
                    tooth41 = ticket.tooth41,
                    tooth42 = ticket.tooth42,
                    tooth43 = ticket.tooth43,
                    tooth44 = ticket.tooth44,
                    tooth45 = ticket.tooth45,
                    tooth46 = ticket.tooth46,
                    tooth47 = ticket.tooth47,
                    tooth48 = ticket.tooth48,
                };

                // ticketAccountacy properties

                var ticketAccountacy = new TicketAccountancy
                {
                    TicketId = newTicket.TicketId,
                    ReceptionEmpId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value

                };


                _context.AddRange(newTicket ,patient, referredTo, medicalHistory, asnan , ticketAccountacy);
                await _context.SaveChangesAsync();

                TempData["Success"] = "تم تسجيل بيانات المريض بنجاح و تحويل التذكرة لعيادة التشخيص";
                TempData["TicketId"] = newTicket.TicketId;

                return RedirectToAction(nameof(Index));
            }
            else
            {
                TempData["Error"] = "عذرا , حدث خطأ اثناء تسجيل البيانات";
                return View("ReceptionTicket", ticket);
            }
        }


        [HttpGet]
        public async Task<IActionResult> CreateTicketForExistingPatient(string id)
        {
            TempData["New"] = false;
            if (id == null)
            {
                return NotFound();
            }
            if (!PatientsIds.Contains(id))
            {
                TempData["Error"] = "عذرا , هذا المريض  غير موجود";
                return RedirectToAction(nameof(Index));
            }

            var patient = Patients.FirstOrDefault(p => p.PatientId == id);

            var ticket = new TicketVM();
            ticket.PatientId = patient.PatientId;
            ticket.Name = patient.Name;
            ticket.Address = patient.Address;
            ticket.profession = patient.profession;
            ticket.phoneNumber = patient.phoneNumber;
            ticket.Gender = patient.Gender;
            ticket.Age = patient.Age;

            return View("ReceptionTicket", ticket);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateTicketForExistingPatient(TicketVM ticket)
        {
            var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
            TempData["Errors"] = errors;


            if (ModelState.IsValid)
            {
                Ticket newTicket = new Ticket(_context);

                // Ticket properties
                {
                    newTicket.PatientId = ticket.PatientId;
                    newTicket.AppointmentDate = ticket.AppointmentDate;
                }

                // referredTo properties

                var referredTo = new ReferredTo
                {
                    Id = newTicket.TicketId,
                    Oral = ticket.Oral,
                    RemovableProsth = ticket.RemovableProsth,
                    Operative = ticket.Operative,
                    Endodontic = ticket.Endodontic,
                    Ortho = ticket.Ortho,
                    CrownAndBridge = ticket.CrownAndBridge,
                    Surgery = ticket.Surgery,
                    Pedo = ticket.Pedo,
                    XRay = ticket.XRay,
                };

                // medicalHistory properties

                var medicalHistory = new MedicalHistory
                {
                    Id = newTicket.TicketId,

                    HeartTrouble = ticket.HeartTrouble,
                    Hyperttention = ticket.Hyperttention,
                    Pregnancy = ticket.Pregnancy,
                    Diabetes = ticket.Diabetes,
                    Hepatitis = ticket.Hepatitis,
                    AIDs = ticket.AIDs,
                    Tuberculosis = ticket.Tuberculosis,
                    Allergies = ticket.Allergies,
                    Anemia = ticket.Anemia,
                    Rheumatism = ticket.Rheumatism,
                    RadTherapy = ticket.RadTherapy,
                    Haemophilia = ticket.Haemophilia,
                    AspirinIntake = ticket.AspirinIntake,
                    KidneyTroubles = ticket.KidneyTroubles,
                    Asthma = ticket.Asthma,
                    HayFever = ticket.HayFever,
                    MedicalHistoryText = ticket.MedicalHistoryText,
                };

                // asnan properties

                var asnan = new Asnan
                {
                    Id = newTicket.TicketId,

                    tooth11 = ticket.tooth11,
                    tooth12 = ticket.tooth12,
                    tooth13 = ticket.tooth13,
                    tooth14 = ticket.tooth14,
                    tooth15 = ticket.tooth15,
                    tooth16 = ticket.tooth16,
                    tooth17 = ticket.tooth17,
                    tooth18 = ticket.tooth18,

                    // Upper Left (Quadrant 2)
                    tooth21 = ticket.tooth21,
                    tooth22 = ticket.tooth22,
                    tooth23 = ticket.tooth23,
                    tooth24 = ticket.tooth24,
                    tooth25 = ticket.tooth25,
                    tooth26 = ticket.tooth26,
                    tooth27 = ticket.tooth27,
                    tooth28 = ticket.tooth28,

                    // Lower Left (Quadrant 3)
                    tooth31 = ticket.tooth31,
                    tooth32 = ticket.tooth32,
                    tooth33 = ticket.tooth33,
                    tooth34 = ticket.tooth34,
                    tooth35 = ticket.tooth35,
                    tooth36 = ticket.tooth36,
                    tooth37 = ticket.tooth37,
                    tooth38 = ticket.tooth38,

                    // Lower Right (Quadrant 4)
                    tooth41 = ticket.tooth41,
                    tooth42 = ticket.tooth42,
                    tooth43 = ticket.tooth43,
                    tooth44 = ticket.tooth44,
                    tooth45 = ticket.tooth45,
                    tooth46 = ticket.tooth46,
                    tooth47 = ticket.tooth47,
                    tooth48 = ticket.tooth48,
                };

                // ticketAccountacy properties

                var ticketAccountacy = new TicketAccountancy
                {
                    TicketId = newTicket.TicketId,
                    ReceptionEmpId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value

                };


                _context.AddRange(newTicket, referredTo, medicalHistory, asnan, ticketAccountacy);
                await _context.SaveChangesAsync();

                TempData["Success"] = "تم تسجيل بيانات المريض بنجاح و تحويل التذكرة لعيادة التشخيص";
                TempData["TicketId"] = newTicket.TicketId;

                return RedirectToAction(nameof(Index));
            }
            else
            {
                TempData["Error"] = "عذرا , حدث خطأ اثناء تسجيل البيانات";
                return View("ReceptionTicket", ticket);
            }
        }


        //public async Task<IActionResult> CreateTicketForNewPatient()
        //{
        //    return RedirectToAction("CreateTicketForNewPatient", "Reception");
        //}


        //public async Task<IActionResult> CreateTicketForExistingPatient(string id)
        //{
        //    return RedirectToAction("CreateTicketForExistingPatient", "Reception");


        //}
        //// Creation of tickets is of reception controller acrtions 

        //[HttpPost]
        //public async Task<IActionResult> ShowFullTicket(string id)
        //{
        //    return RedirectToAction("ShowFullTicket", "Reception" , new {id = id});

        //}




        [HttpGet]
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ticket = await _context.Tickets
                    .Include(t => t.MedicalHistory)
                    .Include(t => t.Patient)
                    .Include(t => t.ReferredTo)
                    .Include(t => t.Asnan)
                    .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            string pId = ticket?.PatientId; // Step 2: Now it's safe to access PatientId


            if (ticket == null)
            {
                TempData["Error"] = "عذرا ; هذه التذكره غير موجوده";
                return RedirectToAction("ShowPatientProfile", "Patient", new { id = pId });
            }
            // ✅ Null Safety Checks
            var ticketVm = new TicketVM
            {


                // Patient Properties (Null check added)
                PatientId = ticket.PatientId,

                Name = ticket.Patient?.Name ?? "N/A",
                Address = ticket.Patient?.Address ?? "N/A",
                profession = ticket.Patient?.profession ?? "N/A",
                phoneNumber = ticket.Patient?.phoneNumber ?? "N/A",
                Gender = ticket.Patient?.Gender ?? "N/A",
                Age = ticket.Patient?.Age ?? 0,

                // Ticket Properties

                TicketID = ticket.TicketId,
                AppointmentDate = ticket.AppointmentDate,
                ChiefComlant = ticket.ChiefComlant,
                PrevisionalDiagnosis = ticket.PrevisionalDiagnosis,
                NextDate = ticket.NextDate,
                Status = ticket.Status,
                IsValid = ticket.IsValid,





                // Medical History Properties (Null check added)
                HeartTrouble = ticket.MedicalHistory?.HeartTrouble ?? false,
                Hyperttention = ticket.MedicalHistory?.Hyperttention ?? false,
                Pregnancy = ticket.MedicalHistory?.Pregnancy ?? false,
                Diabetes = ticket.MedicalHistory?.Diabetes ?? false,
                Hepatitis = ticket.MedicalHistory.Hepatitis,
                AIDs = ticket.MedicalHistory?.AIDs ?? false,
                Tuberculosis = ticket.MedicalHistory?.Tuberculosis ?? false,
                Allergies = ticket.MedicalHistory?.Allergies ?? false,
                Anemia = ticket.MedicalHistory?.Anemia ?? false,
                Rheumatism = ticket.MedicalHistory?.Rheumatism ?? false,
                RadTherapy = ticket.MedicalHistory?.RadTherapy ?? false,
                Haemophilia = ticket.MedicalHistory?.Haemophilia ?? false,
                AspirinIntake = ticket.MedicalHistory?.AspirinIntake ?? false,
                KidneyTroubles = ticket.MedicalHistory?.KidneyTroubles ?? false,
                Asthma = ticket.MedicalHistory?.Asthma ?? false,
                HayFever = ticket.MedicalHistory?.HayFever ?? false,
                MedicalHistoryText = ticket.MedicalHistory?.MedicalHistoryText ?? "N/A",

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

            };


            return View(ticketVm);

        }

        [HttpPost]
        public async Task<IActionResult> Edit(string id, TicketVM newTicket)
        {




            //foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
            //{
            //    Console.WriteLine("Badrrrrrrrrr" + error.ErrorMessage);
            //    Console.WriteLine(error.ToString());
            //}


            var ticket = await _context.Tickets
               .Include(t => t.MedicalHistory)
               .Include(t => t.Patient)
               .Include(t => t.ReferredTo)
               .Include(t => t.Asnan)
               .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            string pId = ticket?.PatientId; // Step 2: Now it's safe to access PatientId

            if (ticket == null)
            {
                TempData["Error"] = "فشل التعديل, الرجاء مراجعه البيانات و المحاوله مره أخري";
                return View(newTicket);
                //  return NotFound();
            }

            if (ModelState.IsValid)
            {

                // ✅ Null Safety Checks

                // Editable patient properties
                ticket.PatientId = newTicket.PatientId;

                // Ticket Properties
                // ticket.PatientId = newTicket.PatientId;
                ticket.AppointmentDate = newTicket.AppointmentDate;
                ticket.ChiefComlant = newTicket.ChiefComlant;
                ticket.PrevisionalDiagnosis = newTicket.PrevisionalDiagnosis;
                ticket.NextDate = newTicket.NextDate;
                ticket.Status = newTicket.Status;
                ticket.IsValid = newTicket.IsValid;


                // Medical History Properties (Null check added)
                ticket.MedicalHistory.HeartTrouble = newTicket.HeartTrouble;
                ticket.MedicalHistory.Hyperttention = newTicket.Hyperttention;
                ticket.MedicalHistory.Pregnancy = newTicket.Pregnancy;
                ticket.MedicalHistory.Diabetes = newTicket.Diabetes;
                ticket.MedicalHistory.Hepatitis = newTicket.Hepatitis;
                ticket.MedicalHistory.AIDs = newTicket.AIDs;
                ticket.MedicalHistory.Tuberculosis = newTicket.Tuberculosis;
                ticket.MedicalHistory.Allergies = newTicket.Allergies;
                ticket.MedicalHistory.Anemia = newTicket.Anemia;
                ticket.MedicalHistory.Rheumatism = newTicket.Rheumatism;
                ticket.MedicalHistory.RadTherapy = newTicket.RadTherapy;
                ticket.MedicalHistory.Haemophilia = newTicket.Haemophilia;
                ticket.MedicalHistory.AspirinIntake = newTicket.AspirinIntake;
                ticket.MedicalHistory.KidneyTroubles = newTicket.KidneyTroubles;
                ticket.MedicalHistory.Asthma = newTicket.Asthma;
                ticket.MedicalHistory.HayFever = newTicket.HayFever;
                ticket.MedicalHistory.MedicalHistoryText = newTicket.MedicalHistoryText ?? "N/A";

                // Referred To Properties (Null check added)
                ticket.ReferredTo.Oral = newTicket.Oral;
                ticket.ReferredTo.RemovableProsth = newTicket.RemovableProsth;
                ticket.ReferredTo.Operative = newTicket.Operative;
                ticket.ReferredTo.Endodontic = newTicket.Endodontic;
                ticket.ReferredTo.Ortho = newTicket.Ortho;
                ticket.ReferredTo.CrownAndBridge = newTicket.CrownAndBridge;
                ticket.ReferredTo.Surgery = newTicket.Surgery;
                ticket.ReferredTo.Pedo = newTicket.Pedo;
                ticket.ReferredTo.XRay = newTicket.XRay;

                // Asnan Properties

                // Upper Right (Quadrant 1)
                ticket.Asnan.tooth11 = newTicket.tooth11;
                ticket.Asnan.tooth12 = newTicket.tooth12;
                ticket.Asnan.tooth13 = newTicket.tooth13;
                ticket.Asnan.tooth14 = newTicket.tooth14;
                ticket.Asnan.tooth15 = newTicket.tooth15;
                ticket.Asnan.tooth16 = newTicket.tooth16;
                ticket.Asnan.tooth17 = newTicket.tooth17;
                ticket.Asnan.tooth18 = newTicket.tooth18;
                // Upper Left (Quadrant 2)
                ticket.Asnan.tooth21 = newTicket.tooth21;
                ticket.Asnan.tooth22 = newTicket.tooth22;
                ticket.Asnan.tooth23 = newTicket.tooth23;
                ticket.Asnan.tooth24 = newTicket.tooth24;
                ticket.Asnan.tooth25 = newTicket.tooth25;
                ticket.Asnan.tooth26 = newTicket.tooth26;
                ticket.Asnan.tooth27 = newTicket.tooth27;
                ticket.Asnan.tooth28 = newTicket.tooth28;
                // Lower Left (Quadrant 3)
                ticket.Asnan.tooth31 = newTicket.tooth31;
                ticket.Asnan.tooth32 = newTicket.tooth32;
                ticket.Asnan.tooth33 = newTicket.tooth33;
                ticket.Asnan.tooth34 = newTicket.tooth34;
                ticket.Asnan.tooth35 = newTicket.tooth35;
                ticket.Asnan.tooth36 = newTicket.tooth36;
                ticket.Asnan.tooth37 = newTicket.tooth37;
                ticket.Asnan.tooth38 = newTicket.tooth38;
                // Lower Right (Quadrant 4)
                ticket.Asnan.tooth41 = newTicket.tooth41;
                ticket.Asnan.tooth42 = newTicket.tooth42;
                ticket.Asnan.tooth43 = newTicket.tooth43;
                ticket.Asnan.tooth44 = newTicket.tooth44;
                ticket.Asnan.tooth45 = newTicket.tooth45;
                ticket.Asnan.tooth46 = newTicket.tooth46;
                ticket.Asnan.tooth47 = newTicket.tooth47;
                ticket.Asnan.tooth48 = newTicket.tooth48;

                //  _context.Update(ticket);
                await _context.SaveChangesAsync();
                TempData["success"] = "تم تعديل التذكرة بنجاح";
                return RedirectToAction("ShowPatientProfile", "Patient", new { id = pId });
            }
            TempData["Error"] = "فشل التعديل,الرجاء مراجعه البيانات و المحاوله مره أخري";
            return View(newTicket);
        }






        [HttpPost]
        public async Task<IActionResult> Delete(string id)
        {

            var ticket = await _context.Tickets
        .Include(t => t.MedicalHistory)
        .Include(t => t.Patient)
        .Include(t => t.ReferredTo)
        .Include(t => t.Asnan)
        .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            string pId = ticket?.PatientId; // Step 2: Now it's safe to access PatientId


            if (!tickets.Select(t => t.TicketId).Contains(id))
            {

                TempData["success"] = "عذرا  هذه التذكره غير موجودة";
                return RedirectToAction("ShowPatientProfile", "Patient", new { id = pId });

                //  return RedirectToAction(nameof(Index));
            }



            if (ticket == null)
            {
                TempData["success"] = "فشل الحذف, الرجاء المحاوله مره أخري";
                return RedirectToAction("ShowPatientProfile", "Patient", new { id = pId });


                //  return NotFound();
            }

            _context.Tickets.Remove(ticket);
            _context.SaveChangesAsync();
            TempData["Success"] = "تم حذف التذكرة بنجاح";
            return RedirectToAction("ShowPatientProfile", "Patient", new { id = pId });



        }

    }
}
