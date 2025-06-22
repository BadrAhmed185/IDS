using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IDS.Models
{
    public class Doctor
    {

        [Key , ForeignKey("AppUser")]
        public string Id { get; set; }

        [ForeignKey("Clinic")]
        public int? ClinicId { get; set; }

        public int ActivePatientsUnderResposibility { get; set; } = 0 ;
        public int Successfulcases { get; set; } = 0 ;


        //Nav properties
        public Clinic Clinic { get; set; }
        public ApplicationUser AppUser { get; set; }


    }
}
