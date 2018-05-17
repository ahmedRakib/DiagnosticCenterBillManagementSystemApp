using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Gateway;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;

namespace DiagnosticCenterBillManagementSystemApp.BLL
{
    public class TypeManager
    {
        TypeGateway aTypeGateway = new TypeGateway();
        public string Save(TestType testType)
        {
            if (aTypeGateway.IsTestTypeExists(testType))
            {
                return "Test type already exists";

            }
            else
            {
                int rowAffected = aTypeGateway.Save(testType);

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

        public List<TestType> GetAllTestType()
        {
            return aTypeGateway.GetAllTestType();
        }
    }
}