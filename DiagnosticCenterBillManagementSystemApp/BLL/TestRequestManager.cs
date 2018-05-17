using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystemApp.DAL.Gateway;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.BLL
{
    public class TestRequestManager
    {
        TestRequestGateway aTestRequestGateway = new TestRequestGateway();

        public int Save(Patient aPatient)
        {
            if (aTestRequestGateway.IsMobileNoExists(aPatient))
            {
                return 0;
            }
            else
            {
                int rowAffected = aTestRequestGateway.Save(aPatient);
                if (rowAffected > 0)
                {
                    int id = aTestRequestGateway.GetLastId(aPatient);

                    return id;
                }
                else
                {
                    return 0;
                }
            }
        }

        public int Save2(PatientTestVM patientTestVm)
        {
            int rowAffected = aTestRequestGateway.Save2(patientTestVm);
            return rowAffected;
        }

        public Patient GetDueInformation(Patient aPatient)
        {
            return aTestRequestGateway.GetDueInformation(aPatient);
        }

        public string UpdateDueBill(Patient aPatient)
        {
            int rowAffected = aTestRequestGateway.UpdateDueBill(aPatient);
            if (rowAffected > 0)
            {

                return "Bill Updated";
            }
            else
            {
                return "Bill Updating failed";
            }
        }
    }
}