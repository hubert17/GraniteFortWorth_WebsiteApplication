using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GraniteFortWorth_WebsiteApplication.App_Code
{
    public class QuoteModel
    {
        public int SlabColorID { get; set; }
        public double SF { get; set; }
        public string Edge { get; set; }
        public string Backsplash { get; set; }
        public double LinearFeet { get; set; }
        public List<QuoteSink> Sinks { get; set; }
        public List<QuoteService> Services { get; set; }

    }

    public class QuoteSink
    {
        public int SinkID { get; set; }
    }

    public class QuoteService
    {
        public int ServiceID { get; set; }
    }


}