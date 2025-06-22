using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using System.ComponentModel.DataAnnotations;

namespace IDS.Models
{
    public class Developer
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }

        public string Phone { get; set; }
        public string Role { get; set; }
        public byte[] Photo { get; set; }

        public IEnumerable<string> Links { get; set; }
    }
}
