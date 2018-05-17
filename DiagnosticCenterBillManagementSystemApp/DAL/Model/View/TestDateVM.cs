using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Model.View
{
    public class TestDateVM
    {
        public string Name { get; set; }
        public double Fee { get; set; }
        public int Id { get; set; }
        public int OrderCount { get; set; }
        public double Total { get; set; }
    }
}