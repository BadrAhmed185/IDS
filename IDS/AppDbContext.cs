
    namespace IDS
{

    using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
    using Microsoft.EntityFrameworkCore;
    using IDS.Models;
    using System.ComponentModel.DataAnnotations.Schema;
    public class AppDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
        public DbSet<Patient> patients { get; set; }    
        public DbSet<Ticket> Tickets { get; set; }
        

        public DbSet<ReferredTo> ReferredTo { get; set; }
        public DbSet<MedicalHistory> MedicalHistories { get; set; }
        public DbSet<Asnan> Asnans { get; set; }
        public DbSet<TicketAccountancy> ticketAccountancies { get; set; }

        //FifthUpdate
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Clinic> Clinics { get; set; }
        public DbSet<Developer> Developers { get; set; } //sixth



    }
}
