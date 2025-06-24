using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using IDS.Controllers;
using IDS.Models;

namespace IDS.Controllers
{
    public class ClinicStatisticsController : Controller
    {
        private readonly AppDbContext _context;

        public ClinicStatisticsController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var clinics = await _context.Clinics.ToListAsync();
            return View(clinics);
        }

        public async Task<IActionResult> Details(int id)
        {
            var clinic = await _context.Clinics.FirstOrDefaultAsync(c => c.Id == id);

            string idString = id.ToString();

            var tickets = await _context.Tickets
                .Include(t => t.ReferredTo)
                .Where(t => t.ReferredTo.Id == idString)
                .ToListAsync();


            var patientCount = tickets.Select(t => t.PatientId).Distinct().Count();
            var visitCount = tickets.Count;

            var topComplaints = tickets
                .GroupBy(t => t.ChiefComlant) // watch for spelling!
                .Select(g => new { Complaint = g.Key, Count = g.Count() })
                .OrderByDescending(g => g.Count)
                .Take(5)
                .ToList();

            var topDiagnoses = tickets
    .GroupBy(t => t.PrevisionalDiagnosis)
    .Select(g => new { Diagnosis = g.Key, Count = g.Count() })
    .OrderByDescending(g => g.Count)
    .Take(5)
    .ToList();

            var model = new
            {
                ClinicName = clinic.Name,
                ClinicId = id,
                PatientCount = patientCount,
                VisitCount = visitCount,
                TopComplaints = topComplaints,
                TopDiagnoses = topDiagnoses
            };

            return View(model);
        }

    }
}
