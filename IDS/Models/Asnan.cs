///////// Asnan Model //////////

using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IDS.Models
{
    public class Asnan
    {
        [Key , ForeignKey("Ticket")]
        public string Id { get; set; }

        // Upper Right (Quadrant 1)
        public bool tooth11 { get; set; } = false;
        public bool tooth12 { get; set; } = false;
        public bool tooth13 { get; set; } = false;
        public bool tooth14 { get; set; } = false;
        public bool tooth15 { get; set; } = false;
        public bool tooth16 { get; set; } = false;
        public bool tooth17 { get; set; } = false;
        public bool tooth18 { get; set; } = false;

        // Upper Left (Quadrant 2)

        public bool tooth21 { get; set; } = false;
        public bool tooth22 { get; set; } = false;
        public bool tooth23 { get; set; } = false;
        public bool tooth24 { get; set; } = false;
        public bool tooth25 { get; set; } = false;
        public bool tooth26 { get; set; } = false;
        public bool tooth27 { get; set; } = false;
        public bool tooth28 { get; set; } = false;

        // Lower Left (Quadrant 3)
        public bool tooth31 { get; set; } = false;
        public bool tooth32 { get; set; } = false;
        public bool tooth33 { get; set; } = false;
        public bool tooth34 { get; set; } = false;
        public bool tooth35 { get; set; } = false;
        public bool tooth36 { get; set; } = false;
        public bool tooth37 { get; set; } = false;
        public bool tooth38 { get; set; } = false;

        // Lower Right (Quadrant 4)
        public bool tooth41 { get; set; } = false;
        public bool tooth42 { get; set; } = false;
        public bool tooth43 { get; set; } = false;
        public bool tooth44 { get; set; } = false;
        public bool tooth45 { get; set; } = false;
        public bool tooth46 { get; set; } = false;
        public bool tooth47 { get; set; } = false;
        public bool tooth48 { get; set; } = false;



        /// Here the Nav properties to relate the asnan to the ticke ya Ahmed
         public Ticket Ticket { get; set; }

    }
}
