using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Model.View
{
    [Serializable]
    public class PatientTestVM
    {
        public int Id { get; set; }
        /*public string PatientName { get; set; }
        public string DataOfBirth { get; set; }
        public string Mobile { get; set; }
        public string BillNo { get; set; }
        public string TestName { get; set; }
        public double Fee { get; set; }*/
        public int TestId { get; set; }
        public string TestName { get; set; }

        public int PatientId { get; set; }
        public double Fee { get; set; }
        public string EntryDate { get; set; }

        /*public double TotalBill { get; set; }
        public double DueBill { get; set; }
        public string BillDate { get; set; }
*/
    }
}