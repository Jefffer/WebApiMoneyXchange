//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Conversion
    {
        public int idConversion { get; set; }
        public int fromConversion { get; set; }
        public int toConversion { get; set; }
        public decimal fromValue { get; set; }
        public decimal toValue { get; set; }
        public System.DateTime conversionDate { get; set; }
        public int conversionUser { get; set; }
    
        public virtual Currency Currency { get; set; }
        public virtual Currency Currency1 { get; set; }
        public virtual User User { get; set; }
    }
}
