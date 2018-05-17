using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;

namespace DiagnosticCenterBillManagementSystemApp.DAL.Gateway
{
    public class TypeGateway : Gateway
    {
        public int Save(TestType testType)
        {
            Query = "INSERT INTO TestType VALUES(@name)";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Command.Parameters.Clear();

            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = testType.TypeName;
            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();
            return rowAffected;
        }

        public bool IsTestTypeExists(TestType testType)
        {
            Query = "SELECT * FROM TestType WHERE TypeName = @name ";

            Command = new SqlCommand(Query, Connection);
            
            Connection.Open();
            Command.Parameters.Clear();

            Command.Parameters.Add("name", SqlDbType.VarChar);
            Command.Parameters["name"].Value = testType.TypeName;
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

        public List<TestType> GetAllTestType()
        {
            Query = "SELECT * FROM TestType ORDER BY TypeName";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            Reader = Command.ExecuteReader();

            List<TestType> testTypes = new List<TestType>();

            while (Reader.Read())
            {
                TestType aTestType = new TestType();
                aTestType.TypeName = Reader["TypeName"].ToString();

                testTypes.Add(aTestType);
            }
            Reader.Close();
            Connection.Close();
            return testTypes;
        } 
    }
}