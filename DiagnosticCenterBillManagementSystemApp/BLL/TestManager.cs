using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Gateway;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.BLL
{
    public class TestManager
    {
        TestGateway aTestGateway = new TestGateway();
        public List<TestType> GetAllTypes()
        {
            return aTestGateway.GetAllTypes();
        }

        public string Save(TestVM aTest)
        {
            if (aTestGateway.IsTestExists(aTest))
            {
                return "Test already exists...";
            }
            else
            {
                int rowAffected = aTestGateway.Save(aTest);
                if (rowAffected > 0)
                {
                    return "Saved successfully";
                }
                else
                {
                    return "Saving failed";
                }
            }
            
        }

        public List<TestVM> GetAllTest()
        {
            return aTestGateway.GetAllTest();
        }

        public List<TestVM> GetAllTestName()
        {
            return aTestGateway.GetAllTestName();
        }

        public double GetSelectedTestFee(TestVM test)
        {
            return aTestGateway.GetSelectedTestFee(test);
        }
    }
}