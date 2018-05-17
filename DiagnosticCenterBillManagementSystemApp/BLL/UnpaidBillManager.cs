using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Gateway;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.BLL
{
    public class UnpaidBillManager
    {
        UnpaidBillGateway aUnpaidBillGateway = new UnpaidBillGateway();

        public List<Patient> GetPatientWithUnpaidBill(string fromDate, string toDate)
        {
            return aUnpaidBillGateway.GetPatientWithUnpaidBill(fromDate, toDate);
        } 
    }
}