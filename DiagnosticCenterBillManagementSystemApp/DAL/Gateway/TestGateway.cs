using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;
using iTextSharp.text;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Gateway
{
    public class TestGateway : Gateway
    {
        public List<TestType> GetAllTypes()
        {
            Query = "SELECT * FROM TestType";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();

            List<TestType> Types = new List<TestType>();
            while (Reader.Read())
            {
                TestType aType = new TestType();
                aType.Id = (int)Reader["Id"];
                aType.TypeName = Reader["TypeName"].ToString();

                Types.Add(aType);
            }
            Reader.Close();
            Connection.Close();
            return Types;
        }

        public int Save(TestVM test)
        {
            Query = "INSERT INTO Test VALUES(@name, @fee, @typeId)";

            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = test.Name;

            Command.Parameters.Add("fee", SqlDbType.Decimal);
            Command.Parameters["fee"].Value = test.Fee;

            Command.Parameters.Add("typeId", SqlDbType.Int);
            Command.Parameters["typeId"].Value = test.TypeId;
            
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsTestExists(TestVM test)
        {
            Query = "SELECT Name FROM Test WHERE Name = @name";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = test.Name;
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

        public List<TestVM> GetAllTest()
        {
            Query = "SELECT t.Name,Fee,TypeName FROM Test t INNER JOIN TestType tt ON t.TypeId = tt.Id ORDER BY t.Name";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();
            List<TestVM> tests = new List<TestVM>();

            while (Reader.Read())
            {
                TestVM aTest = new TestVM();
                aTest.Name = Reader["Name"].ToString();
                aTest.Fee = Convert.ToDouble(Reader["Fee"]);
                aTest.TypeName = Reader["TypeName"].ToString();

                tests.Add(aTest);
            }
            Reader.Close();
            Connection.Close();
            return tests;
        }

        public List<TestVM> GetAllTestName()
        {
            Query = "SELECT Id,Name,Fee FROM Test ORDER BY Name";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();
            List<TestVM> Tests = new List<TestVM>();
            while (Reader.Read())
            {
                TestVM aTest = new TestVM();
                aTest.Id = (int)Reader["Id"];
                aTest.Name = Reader["Name"].ToString();
                aTest.Fee = Convert.ToDouble(Reader["Fee"]);

                Tests.Add(aTest);
            }
            Reader.Close();
            Connection.Close();
            return Tests;

        }

        public double GetSelectedTestFee(TestVM test)
        {
            Query = "SELECT Fee FROM Test WHERE Name = @name";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = test.Name;

            Reader = Command.ExecuteReader();
            TestVM aTest = null;

            while (Reader.Read())
            {
                aTest = new TestVM();

                aTest.Fee = Convert.ToDouble(Reader["Fee"]);


            }

            Reader.Close();
            Connection.Close();
            return aTest.Fee;

        }
    }
}