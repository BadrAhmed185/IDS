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

        public async Task<IActionResult> General()
        {
            var totalPatients = await _context.patients.CountAsync();
            var totalTickets = await _context.Tickets.CountAsync();

            var thisMonth = DateTime.Now.Month;
            var thisYear = DateTime.Now.Year;

            var newPatientsThisMonth = await _context.patients
                .CountAsync(p => p.CreatedAt.Month == thisMonth && p.CreatedAt.Year == thisYear); // لو CreatedAt مش موجود نضيفه لاحقًا

            var visitsThisMonth = await _context.Tickets
                .CountAsync(t => t.AppointmentDate.Month == thisMonth && t.AppointmentDate.Year == thisYear);

            var avgVisitsPerPatient = totalPatients == 0 ? 0 : (float)totalTickets / totalPatients;

            var patientsPerClinic = await _context.Tickets
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
                newPatientsThisMonth,
                visitsThisMonth,
                avgVisitsPerPatient,
                patientsPerClinic
            };

            return View(model);
        }
    }
}