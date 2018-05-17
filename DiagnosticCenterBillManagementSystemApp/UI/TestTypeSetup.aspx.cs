using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystemApp.BLL;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace DiagnosticCenterBillManagementSystemApp.UI
{
    public partial class TestTypeSetup : System.Web.UI.Page
    {
        TypeManager aTypeManager = new TypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateTypeGridView();
        }

        private void PopulateTypeGridView()
        {
            List<TestType> testTypes = aTypeManager.GetAllTestType();
            typeNameGridView.DataSource = testTypes;
            typeNameGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestType aTestType = new TestType();
            aTestType.TypeName = typeNameTextBox.Text;

            messageLabel.Text = aTypeManager.Save(aTestType);

            PopulateTypeGridView();
            typeNameTextBox.Text = String.Empty;
        }

       

       

    }
}