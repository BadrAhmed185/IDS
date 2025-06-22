using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IDS.Models
{
    public class Clinic
    {
        [Key]
        public int Id { get; set;}
        public string Name { get; set;}
        public string ArabicName { get; set;}

        [ForeignKey("ClinicSupervisor")]
        public string Supervisor { get; set;}
        public int TicketsCount { get; set; } = 0;

        // Nav properties
        public IEnumerable <Doctor>? Doctors { get; set; }
        public ApplicationUser? ClinicSupervisor { get; set; }
          public IEnumerable<Ticket>? Tickets { get; set; } 
    }
}
