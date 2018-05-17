using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystemApp.BLL;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace DiagnosticCenterBillManagementSystemApp.UI
{
    public partial class TestSetup : System.Web.UI.Page
    {
        TestManager aTestManager = new TestManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TestType> testTypes = aTestManager.GetAllTypes();
                testTypeDropDownList.DataSource = testTypes;
                testTypeDropDownList.DataValueField = "Id";
                testTypeDropDownList.DataTextField = "TypeName";
                testTypeDropDownList.DataBind();
            }
            PopulateTestGridView();
        }

        private void PopulateTestGridView()
        {
            List<TestVM> Tests = aTestManager.GetAllTest();
            testGridView.DataSource = Tests;
            testGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestVM aTest = new TestVM();
            aTest.Name = testNameTextBox.Text;
            aTest.Fee = Convert.ToDouble(feeTextBox.Text);
            aTest.TypeName = testTypeDropDownList.SelectedItem.Text;
            aTest.TypeId = Convert.ToInt32(testTypeDropDownList.SelectedValue);

            messageLabel.Text = aTestManager.Save(aTest);
            
            ClearTextField();
            PopulateTestGridView();

        }
        public void ClearTextField()
        {
            testNameTextBox.Text = String.Empty;
            feeTextBox.Text = String.Empty;
        }

       

       
    }
}