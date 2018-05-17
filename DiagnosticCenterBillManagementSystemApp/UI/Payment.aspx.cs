using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystemApp.BLL;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;

namespace DiagnosticCenterBillManagementSystemApp
{
    public partial class Payment : System.Web.UI.Page
    {
        TestRequestManager aTestRequestManager = new TestRequestManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            Patient aPatient = new Patient();

            aPatient.Mobile = mobileNoTextBox.Text;
            aPatient.BillNo = billlNoTextBox.Text;
            if (aPatient.BillNo.Equals("")&&aPatient.Mobile.Equals(""))
            {
                msgLabel.Text = "Please give mobile number or bill No to search";

            }
            else
            {
                Patient bPatient = aTestRequestManager.GetDueInformation(aPatient);
                if (bPatient==null)
                {
                    msgLabel.Text = "no due bill found";
                    payButton.Enabled = false;
                    amountTextBox.Text = String.Empty;
                    dueDateTextBox.Text = String.Empty;
                }
                else
                {
                    msgLabel.Text = "Your due bill is";
                    payButton.Enabled = true;
                    amountTextBox.Text = bPatient.DueBill.ToString();
                    dueDateTextBox.Text = bPatient.BillDate;
                    idHiddenField.Value = bPatient.Id.ToString();
                }
            }
            
            
        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            Patient aPatient = new Patient();
            aPatient.Id = Convert.ToInt32(idHiddenField.Value);
            billlNoTextBox.Text = String.Empty;
            mobileNoTextBox.Text = String.Empty;
            msgLabel.Text = aTestRequestManager.UpdateDueBill(aPatient);
        }
    }
}