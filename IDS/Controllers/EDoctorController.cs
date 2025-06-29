using IDS.Models;
using IDS.Models.ViewModels;
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

        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> ChangeNextDate(string id, DateTime date)
        {
            if (string.IsNullOrWhiteSpace(id))
                return BadRequest("Invalid Ticket ID.");

            // Try to get the ticket by ID
            var ticket = await _context.Tickets.FindAsync(id);

            if (ticket == null)
            {
                TempData["Error"] = "عذرآ حدث حطأ ما , التذكرة غير موجودة";
                return RedirectToAction(nameof(Index));
            }


            ticket.NextDate = date;

            await _context.SaveChangesAsync();

            TempData["Success"] = "تم تحديد موعد الزيارة القادم  ";
            return RedirectToAction(nameof(Index));
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<IActionResult> ChangeLevelOfCompletness(string id, string LevelOfCompletionParameter)
        {
            if (string.IsNullOrWhiteSpace(id))
                return BadRequest("Invalid Ticket ID.");

            var ticket = await _context.Tickets.FindAsync(id);

            if (ticket == null)
            {
                TempData["Error"] = "عذرًا، حدث خطأ ما. التذكرة غير موجودة.";
                return RedirectToAction(nameof(Index));
            }

            // Update the LevelOfCompletness
            ticket.LevelOfCompletness = LevelOfCompletionParameter;

            await _context.SaveChangesAsync();

            TempData["Success"] = "تم تحديث حالة التذكرة بنجاح.";
            return RedirectToAction(nameof(Index));
        }



        public async Task<IActionResult> Edit(string id)
        {
            ViewBag.controllerName = "EDoctor";

            if (id == null)
            {
                return NotFound();
            }

            var ticket = await _context.Tickets
                    .Where(t => t.Status == "5")
                    .Include(t => t.Patient)
                    .ThenInclude(t => t.MedicalHistory)
                    .Include(t => t.ReferredTo)
                    .Include(t => t.Asnan)
                    .Include(t => t.TicketAccountancy)
                    .FirstOrDefaultAsync(t => t.TicketId == id); // ✅ Use FirstOrDefaultAsync

            string pId = ticket?.PatientId; // Step 2: Now it's safe to access PatientId


            if (ticket == null)
            {
                TempData["Error"] = "عذرا ; هذه التذكره غير موجوده";
                return RedirectToAction("Index", "EDoctor");
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
                LevelOfCompletness = ticket.LevelOfCompletness,
                //Status = ticket.Status,
                //IsValid = ticket.IsValid,
                //ReceptionEmpName = await _userManager.Users.Where(u => u.Id == ticket.TicketAccountancy.ReceptionEmpId).Select(u => u.FullName).FirstOrDefaultAsync(),





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

            };


            return View(ticketVm);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(TicketVM newTicket)
        {
            ViewBag.controllerName = "EDoctor";


            //foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
            //{
            //    Console.WriteLine("Badrrrrrrrrr" + error.ErrorMessage);
            //    Console.WriteLine(error.ToString());
            //}


            var ticket = await _context.Tickets
               .Include(t => t.Patient)
               .ThenInclude(t => t.MedicalHistory)
               .Include(t => t.ReferredTo)
               .Include(t => t.Asnan)
               .FirstOrDefaultAsync(t => t.TicketId == newTicket.TicketID); // ✅ Use FirstOrDefaultAsync

            string pId = ticket?.PatientId; // Step 2: Now it's safe to access PatientId

            if (ticket == null)
            {
                TempData["Error"] = "عذرا ; هذه التذكره غير موجوده";

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
                ticket.LevelOfCompletness = newTicket.LevelOfCompletness;
                ticket.NextDate = newTicket.NextDate;
                //  ticket.NextDate = newTicket.NextDate;
                //ticket.Status = "3";
                // ticket.IsValid = newTicket.IsValid;


                // Medical History Properties (Null check added)
                ticket.Patient.MedicalHistory.HeartTrouble = newTicket.HeartTrouble;
                ticket.Patient.MedicalHistory.Hyperttention = newTicket.Hyperttention;
                ticket.Patient.MedicalHistory.Pregnancy = newTicket.Pregnancy;
                ticket.Patient.MedicalHistory.Diabetes = newTicket.Diabetes;
                ticket.Patient.MedicalHistory.Hepatitis = newTicket.Hepatitis;
                ticket.Patient.MedicalHistory.AIDs = newTicket.AIDs;
                ticket.Patient.MedicalHistory.Tuberculosis = newTicket.Tuberculosis;
                ticket.Patient.MedicalHistory.Allergies = newTicket.Allergies;
                ticket.Patient.MedicalHistory.Anemia = newTicket.Anemia;
                ticket.Patient.MedicalHistory.Rheumatism = newTicket.Rheumatism;
                ticket.Patient.MedicalHistory.RadTherapy = newTicket.RadTherapy;
                ticket.Patient.MedicalHistory.Haemophilia = newTicket.Haemophilia;
                ticket.Patient.MedicalHistory.AspirinIntake = newTicket.AspirinIntake;
                ticket.Patient.MedicalHistory.KidneyTroubles = newTicket.KidneyTroubles;
                ticket.Patient.MedicalHistory.Asthma = newTicket.Asthma;
                ticket.Patient.MedicalHistory.HayFever = newTicket.HayFever;
                ticket.Patient.MedicalHistory.MedicalHistoryText = newTicket.MedicalHistoryText ?? "N/A";


                //// Referred To Properties (Null check added)
               
                //ticket.ReferredTo.Oral = newTicket.Oral;
                //ticket.ReferredTo.RemovableProsth = newTicket.RemovableProsth;
                //ticket.ReferredTo.Operative = newTicket.Operative;
                //ticket.ReferredTo.Endodontic = newTicket.Endodontic;
                //ticket.ReferredTo.Ortho = newTicket.Ortho;
                //ticket.ReferredTo.CrownAndBridge = newTicket.CrownAndBridge;
                //ticket.ReferredTo.Surgery = newTicket.Surgery;
                //ticket.ReferredTo.Pedo = newTicket.Pedo;
                //ticket.ReferredTo.XRay = newTicket.XRay;

                //{
                //    if (ticket.ReferredTo.Endodontic)
                //    {
                //        ticket.ClinicId = _context.Clinics.Where(c => c.Name == "Endodont").FirstOrDefault().Id;
                //    }

                //    else if (ticket.ReferredTo.Surgery)
                //    {
                //        ticket.ClinicId = _context.Clinics.Where(c => c.Name == "Surgery").FirstOrDefault().Id;
                //    }
                //}

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
                // TempData["success"] = "تم حفظ البيانات بنجاح";
                TempData["success"] = "تم حفظ البيانات بنجاح.";

                //   var referer = Request.Headers["Referer"].ToString();

                //   if (!string.IsNullOrEmpty(referer))
                //  {
                //       return Redirect(referer);
                // }
                return RedirectToAction(nameof(Index));
            }
            var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);
            TempData["Errors"] = errors;
            TempData["Error"] = "فشل الحفظ,الرجاء مراجعه البيانات و المحاوله مره أخري";
            return View(newTicket);
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
