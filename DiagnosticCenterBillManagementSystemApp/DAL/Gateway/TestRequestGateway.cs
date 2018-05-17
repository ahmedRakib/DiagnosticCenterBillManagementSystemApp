using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;
using DiagnosticCenterBillManagementSystemApp.UI;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Gateway
{
    public class TestRequestGateway : Gateway
    {
        public int Save(Patient aPatient)
        {
            Query = "INSERT into Patient VALUES(@name, @dob, @mobile, @billNo, @unpaid, @paid, @billDate)";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Command.Parameters.Clear();
            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = aPatient.Name;
            Command.Parameters.Add("dob", SqlDbType.Date);
            Command.Parameters["dob"].Value = aPatient.DataOfBirth;
            Command.Parameters.Add("mobile", SqlDbType.VarChar);
            Command.Parameters["mobile"].Value = aPatient.Mobile;
            Command.Parameters.Add("billNo", SqlDbType.VarChar);
            Command.Parameters["billNo"].Value = aPatient.BillNo;
            Command.Parameters.Add("unpaid", SqlDbType.Decimal);
            Command.Parameters["unpaid"].Value = aPatient.TotalBill;
            Command.Parameters.Add("paid", SqlDbType.Decimal);
            Command.Parameters["paid"].Value = aPatient.TotalBill;
            Command.Parameters.Add("billDate", SqlDbType.Date);
            Command.Parameters["billDate"].Value = aPatient.BillDate;


            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        public bool IsMobileNoExists(Patient aPatient)
        {

            Query = "SELECT Mobile FROM Patient WHERE Mobile = @mobile";
            Command = new SqlCommand(Query, Connection);
            

            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("mobile", SqlDbType.VarChar);
            Command.Parameters["mobile"].Value = aPatient.Mobile;
            Reader = Command.ExecuteReader();

            bool hasRow = false;
            if (Reader.HasRows)
            {
                hasRow = true;
            }
            Reader.Close();
            Connection.Close();
            return hasRow;
        }

        public int Save2(PatientTestVM patientTestVm)
        {
            Query = "Insert into PatientTest Values(@testId, @patientId, @entryDate)";

            Command = new SqlCommand(Query, Connection);
            
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("testId", SqlDbType.Int);
            Command.Parameters["testId"].Value = patientTestVm.TestId;


            Command.Parameters.Add("patientId", SqlDbType.Int);
            Command.Parameters["patientId"].Value = patientTestVm.PatientId;

            Command.Parameters.Add("entryDate", SqlDbType.Date);
            Command.Parameters["entryDate"].Value = patientTestVm.EntryDate;

            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        
        public int GetLastId(Patient aPatient)
        {
            Query = "SELECT * FROM Patient WHERE BillNo = @billNo";
            Command = new SqlCommand(Query, Connection);

            
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("billNo", SqlDbType.VarChar);
            Command.Parameters["billNo"].Value = aPatient.BillNo;
            int id = 0;
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                id = (int) Reader["Id"];
            }
            
            Reader.Close();
            Connection.Close();
            return id;
        }

        public Patient GetDueInformation(Patient aPatient)
        {
            Query = "SELECT * FROM Patient WHERE Mobile = @mobile OR BillNo = @billNo";

            Command = new SqlCommand(Query, Connection);
            Patient aPatients = null;
            

            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("mobile", SqlDbType.VarChar);
            Command.Parameters["mobile"].Value = aPatient.Mobile;
            Command.Parameters.Add("billNo", SqlDbType.VarChar);
            Command.Parameters["billNo"].Value = aPatient.BillNo;

            Reader = Command.ExecuteReader();
            bool a = Reader.HasRows;
            while (Reader.Read())
            {
                aPatients = new Patient();
                aPatients.BillDate = Reader["BillDate"].ToString();
                aPatients.DueBill = Convert.ToDouble(Reader["DueBill"]);
                aPatients.Id = (int) Reader["Id"];
            }
            
            Reader.Close();
            Connection.Close();
            return aPatients;
        }

        public int UpdateDueBill(Patient aPatient)
        {
            

            Query = "UPDATE Patient SET DueBill = '0.00' WHERE Id = @id ";

            Command = new SqlCommand(Query, Connection);
            

            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("id", SqlDbType.Int);
            Command.Parameters["id"].Value = aPatient.Id;

            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
    }

}