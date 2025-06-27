// ✅ Updated StatisticsController.cs with dynamic filtering
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using IDS.Controllers;

namespace IDS.Controllers
{
    public class StatisticsController : Controller
    {
        private readonly AppDbContext _context;

        public StatisticsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> General(
             string statType = "month",
             DateTime? selectedDate = null,
             DateTime? fromDate = null,
             DateTime? toDate = null,
             int? month = null,
             int? year = null)
        {
            DateTime startDate, endDate;
            DateTime today = DateTime.Today;

            switch (statType)
            {
                case "day":
                    if (selectedDate == null) selectedDate = today;
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
                    if (month == null) month = today.Month;
                    if (year == null) year = today.Year;
                    startDate = new DateTime(year.Value, month.Value, 1);
                    endDate = startDate.AddMonths(1).AddDays(-1);
                    break;

                case "year":
                    if (year == null) year = today.Year;
                    startDate = new DateTime(year.Value, 1, 1);
                    endDate = new DateTime(year.Value, 12, 31);
                    break;

                case "custom":
                    if (fromDate == null || toDate == null)
                        return BadRequest("Please select valid custom date range.");
                    startDate = fromDate.Value.Date;
                    endDate = toDate.Value.Date;
                    break;

                default:
                    startDate = new DateTime(today.Year, today.Month, 1);
                    endDate = startDate.AddMonths(1).AddDays(-1);
                    break;
            }

            if (startDate > endDate)
            {
                var emptyModel = new
                {
                    totalPatients = 0,
                    totalTickets = 0,
                    newPatientsThisMonth = 0,
                    visitsThisMonth = 0,
                    avgVisitsPerPatient = 0,
                    patientsPerClinic = new List<object>(),
                    selectedRange = "فترة غير صالحة",
                    allTimePatients = 0,
                    allTimeTickets = 0
                };
                return View(emptyModel);
            }

            // ✅ إجماليات بدون فلترة
            var allTimePatients = await _context.patients.CountAsync();
            var allTimeTickets = await _context.Tickets.CountAsync();

            // ✅ حسابات مفلترة
            var totalPatients = await _context.patients
                .Where(p => p.CreatedAt >= startDate && p.CreatedAt <= endDate)
                .CountAsync();

            var totalTickets = await _context.Tickets
                .Where(t => t.AppointmentDate >= startDate && t.AppointmentDate <= endDate)
                .CountAsync();

            var avgVisitsPerPatient = totalPatients == 0 ? 0 : (float)totalTickets / totalPatients;

            var patientsPerClinic = await _context.Tickets
                .Where(t => t.AppointmentDate >= startDate && t.AppointmentDate <= endDate && t.ReferredTo != null)
                .GroupBy(t => t.ReferredTo.Oral)
                .Select(g => new
                {
                    ClinicName = g.Key,
                    PatientCount = g.Select(t => t.PatientId).Distinct().Count()
                })
                .ToListAsync();

            var model = new
            {
                totalPatients,
                totalTickets,
                newPatientsThisMonth = totalPatients,
                visitsThisMonth = totalTickets,
                avgVisitsPerPatient,
                patientsPerClinic,
                selectedRange = $"من {startDate:yyyy-MM-dd} إلى {endDate:yyyy-MM-dd}",
                allTimePatients,
                allTimeTickets
            };

            return View(model);
        }
    }
    }
