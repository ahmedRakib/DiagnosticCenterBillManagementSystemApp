using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity
{
    public class Patient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DataOfBirth { get; set; }
        public string Mobile { get; set; }
        public string BillNo { get; set; }

        public double TotalBill { get; set; }
        public double DueBill { get; set; }
        public string BillDate { get; set; }

        public PatientTestVM PatientTestVm { get; set; }

        
    }
}