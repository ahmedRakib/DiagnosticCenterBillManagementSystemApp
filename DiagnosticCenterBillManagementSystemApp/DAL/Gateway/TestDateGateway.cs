using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Gateway
{
    public class TestDateGateway : Gateway
    {
        public List<TestDateVM> GetTestWithTestName(string fromDateNew, string toDateNew)
        {
           

            Query = "SELECT * FROM GetTestWiseResult WHERE (Date BETWEEN @from and @to) OR Date IS NULL";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("from", SqlDbType.Date);
            Command.Parameters["from"].Value = fromDateNew;
            Command.Parameters.Add("to", SqlDbType.Date);
            Command.Parameters["to"].Value = toDateNew;


            TestDateVM aTestDateVm = null;
            Reader = Command.ExecuteReader();
            List<TestDateVM> testDates = new List<TestDateVM>();
            while (Reader.Read())
            {
                aTestDateVm = new TestDateVM();
                aTestDateVm.Name = Reader["Name"].ToString();
                aTestDateVm.OrderCount = (int)Reader["TestCount"];
                aTestDateVm.Fee = Convert.ToDouble(Reader["TotalFee"]);              

                testDates.Add(aTestDateVm);
            }
            Reader.Close();
            Connection.Close();
            return testDates;
        }

        public List<TestDateVM> GetTestWithTypeName(string fromDateNew, string toDateNew)
        {
            Query = "SELECT * FROM GetTestTypeWiseResult WHERE (Date BETWEEN @from and @to) OR Date IS NULL";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("from", SqlDbType.Date);
            Command.Parameters["from"].Value = fromDateNew;
            Command.Parameters.Add("to", SqlDbType.Date);
            Command.Parameters["to"].Value = toDateNew;


            TestDateVM aTestDateVm = null;
            Reader = Command.ExecuteReader();
            List<TestDateVM> testDates = new List<TestDateVM>();
            while (Reader.Read())
            {
                aTestDateVm = new TestDateVM();
                aTestDateVm.Name = Reader["TypeName"].ToString();
                aTestDateVm.OrderCount = (int)Reader["Test"];
                aTestDateVm.Fee = Convert.ToDouble(Reader["Fee"]);

                testDates.Add(aTestDateVm);
            }
            Reader.Close();
            Connection.Close();
            return testDates;
        }
    }
}