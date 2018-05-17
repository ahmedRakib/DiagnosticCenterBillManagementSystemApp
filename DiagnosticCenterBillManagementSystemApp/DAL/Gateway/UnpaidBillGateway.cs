using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Gateway
{
    public class UnpaidBillGateway : Gateway
    {
        public List<Patient> GetPatientWithUnpaidBill(string fromDate, string toDate)
        
        {
            Query = "SELECT * FROM Patient WHERE BillDate BETWEEN '" + fromDate + "' AND '" +
                    toDate + "' AND DueBill>0";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();
            List<Patient> patientTest = new List<Patient>();
            while (Reader.Read())
            {
                Patient aPatient = new Patient();
                aPatient.Name = Reader["Name"].ToString();
                aPatient.Mobile = Reader["Mobile"].ToString();
                aPatient.BillNo = Reader["BillNo"].ToString();
                aPatient.DueBill = Convert.ToDouble(Reader["DueBill"]);

                patientTest.Add(aPatient);
            }
            Reader.Close();
            Connection.Close();
            return patientTest;
        }
    }
}