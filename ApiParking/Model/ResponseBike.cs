using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Buffers;
using System.Text.Json;

namespace ApiParking.Model
{
   public class ResponseBike
    {
        public ResponseBike (Bike bike)
        {
            this.ID = bike.ID;
            this.Title = bike.Title;
            this.IDClient = bike.IDClient;
            this.IDStatus = bike.IDStatus;
            this.IDType = bike.IDType;
            this.RecordingDate = bike.RecordingDate;
        }
        public ResponseBike () { }
        public int ID { get; set; }
        public string Title { get; set; }
        public int IDClient { get; set; }
        public int IDStatus { get; set; }
        public int IDType { get; set; }
        public System.DateTime RecordingDate { get; set; }
    }

}
