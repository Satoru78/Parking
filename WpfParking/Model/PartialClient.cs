using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfParking.Model
{
    public partial class Client
    {
        public string GetName
        {
            get
            {
                return $"{FirstName} {LastName}";
            }
        }
    }
}
