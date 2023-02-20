using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CDR.Data.models
{
    public class CallerSpend
    {
        public DateTime Day { get; set; }
        public int NumberCalls { get; set; }
        public Double AverageCost { get; set; }
        public Double TotalCost { get; set; }
    }
}
