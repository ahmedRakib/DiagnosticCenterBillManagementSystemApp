using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticCenterBillManagementSystemApp.DAL.Gateway;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp.BLL
{
    public class TestDateManager
    {
        TestDateGateway aTestDateGateway = new TestDateGateway();
        public List<TestDateVM> GetTestWithTestName(string fromDateNew, string toDateNew)
        {
            return aTestDateGateway.GetTestWithTestName(fromDateNew, toDateNew);
        }

        public List<TestDateVM> GetTestWithTypeName(string fromDateNew, string toDateNew)
        {
            return aTestDateGateway.GetTestWithTypeName(fromDateNew, toDateNew);
        }
    }
}