//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ApiParking.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Bike
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bike()
        {
            this.Archive = new HashSet<Archive>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public int IDClient { get; set; }
        public int IDStatus { get; set; }
        public int IDType { get; set; }
        public System.DateTime RecordingDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Archive> Archive { get; set; }
        public virtual Client Client { get; set; }
        public virtual Status Status { get; set; }
        public virtual Type Type { get; set; }
    }
}
