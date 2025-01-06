using System;
using System.Collections.Generic;

namespace WebKhachSan.Models
{
    public class RevenueViewModel
    {
        public decimal TotalRevenue { get; set; }
        public List<MonthlyRevenue> RevenueByMonth { get; set; }
        public List<Booking> ConfirmedBookings { get; set; }
    }

    public class MonthlyRevenue
    {
        public int Year { get; set; }
        public int Month { get; set; }
        public decimal Revenue { get; set; }
    }
}

