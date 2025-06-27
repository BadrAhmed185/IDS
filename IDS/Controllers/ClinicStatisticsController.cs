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

        public async Task<IActionResult> Details(int id, string statType = "month", DateTime? selectedDate = null, DateTime? fromDate = null, DateTime? toDate = null, int? month = null, int? year = null)
        {
            var clinic = await _context.Clinics.FirstOrDefaultAsync(c => c.Id == id);
            if (clinic == null) return NotFound();

            DateTime startDate, endDate;
            DateTime today = DateTime.Today;

            switch (statType)
            {
                case "day":
                    selectedDate ??= today;
                    startDate = endDate = selectedDate.Value.Date;
                    break;
                case "week":
                    if (fromDate == null || toDate == null)
                    {
                        int diff = (int)today.DayOfWeek;
                        startDate = today.AddDays(-diff);
                        endDate = startDate.AddDays(6);
                    }
                    else
                    {
                        startDate = fromDate.Value.Date;
                        endDate = toDate.Value.Date;
                    }
                    break;
                case "month":
                    month ??= today.Month;
                    year ??= today.Year;
                    startDate = new DateTime(year.Value, month.Value, 1);
                    endDate = startDate.AddMonths(1).AddDays(-1);
                    break;
                case "year":
                    year ??= today.Year;
                    startDate = new DateTime(year.Value, 1, 1);
                    endDate = new DateTime(year.Value, 12, 31);
                    break;
                case "custom":
                    if (fromDate == null || toDate == null)
                        return BadRequest("Invalid custom date range.");
                    startDate = fromDate.Value.Date;
                    endDate = toDate.Value.Date;
                    break;
                default:
                    startDate = new DateTime(today.Year, today.Month, 1);
                    endDate = startDate.AddMonths(1).AddDays(-1);
                    break;
            }

            // All-time tickets for this clinic
            string idString = id.ToString();
            var allTickets = await _context.Tickets
                .Include(t => t.ReferredTo)
                .Where(t => t.ReferredTo.Id == idString)
                .ToListAsync();

            var allTimePatientCount = allTickets.Select(t => t.PatientId).Distinct().Count();
            var allTimeVisitCount = allTickets.Count;

            // Filtered tickets
            var tickets = allTickets
                .Where(t => t.AppointmentDate >= startDate && t.AppointmentDate <= endDate)
                .ToList();

            var patientCount = tickets.Select(t => t.PatientId).Distinct().Count();
            var visitCount = tickets.Count;

            var topComplaints = tickets
                .GroupBy(t => t.ChiefComlant)
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
                TopDiagnoses = topDiagnoses,
                selectedRange = $"من {startDate:yyyy-MM-dd} إلى {endDate:yyyy-MM-dd}",
                allTimePatientCount,
                allTimeVisitCount
            };

            return View(model);
        }
    }
}
