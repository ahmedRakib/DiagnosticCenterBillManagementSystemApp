using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using DiagnosticCenterBillManagementSystemApp.BLL;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.Entity;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Control = System.Web.UI.Control;

namespace DiagnosticCenterBillManagementSystemApp.UI
{
    public partial class TestRequestEntry : System.Web.UI.Page
    {
        TestManager aTestManager = new TestManager();
        TestRequestManager aTestRequestManager = new TestRequestManager();
        private string billDate;
        private string billNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TestVM> Tests = aTestManager.GetAllTestName();
                selectTestDropDownList.DataSource = Tests;
                selectTestDropDownList.DataValueField = "Id";
                selectTestDropDownList.DataTextField = "Name";
                selectTestDropDownList.DataBind();

            }

            GetFee();
        }

        private void GetFee()
        {
            TestVM aTest = new TestVM();

            aTest.Name = selectTestDropDownList.SelectedItem.Text;
            double fee = aTestManager.GetSelectedTestFee(aTest);
            feeTextBox.Text = Convert.ToString(fee);
        }


        protected void addButton_Click(object sender, EventArgs e)
        {

            List<PatientTestVM> patientTests = AddTests();
            testEntryGridView.DataSource = patientTests;
            testEntryGridView.DataBind();
            double total = 0;
            foreach (PatientTestVM patientTestVm in patientTests)
            {
                total += patientTestVm.Fee;
            }

            totalTextBox.Text = total.ToString();
        }


        protected void selectTestDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetFee();
        }
        public List<PatientTestVM> AddTests()
        {

            PatientTestVM aPatientVm = new PatientTestVM();
            aPatientVm.TestName = selectTestDropDownList.SelectedItem.Text;
            aPatientVm.TestId = Convert.ToInt32(selectTestDropDownList.SelectedValue);
            aPatientVm.Fee = Convert.ToDouble(feeTextBox.Text);

            if (ViewState["name"] == null)
            {

                List<PatientTestVM> tests = new List<PatientTestVM>();
                tests.Add(aPatientVm);
                ViewState["name"] = tests;
            }
            else
            {
                List<PatientTestVM> tests = (List<PatientTestVM>)ViewState["name"];
                tests.Add(aPatientVm);
                ViewState["name"] = tests;

            }
            return (List<PatientTestVM>)ViewState["name"];
        }



        public string RandomDigits()
        {
            string formatted = DateTime.Now.ToString("yyyyMMddHHmmssfff");

            return formatted;
        }


        protected void saveButton_Click(object sender, EventArgs e)
        {
            Patient aPatientVm = new Patient();
            aPatientVm.Name = nameOfPatientTextBox.Text;

            String dob = dateOfBirthTextBox.Value;
            DateTime myDateTime = new DateTime();
            myDateTime = DateTime.ParseExact(dob, "dd-MM-yyyy", null);
            String dobNew = myDateTime.ToString("yyyy-MM-dd");
            aPatientVm.DataOfBirth = dobNew;
            aPatientVm.BillDate = DateTime.Now.ToString("yyyy-MM-dd");
            billDate = aPatientVm.BillDate;
            aPatientVm.BillNo = RandomDigits();
            billNo = aPatientVm.BillNo;
            aPatientVm.TotalBill = Convert.ToDouble(totalTextBox.Text);
            aPatientVm.Mobile = mobileNoTextBox.Text;

            int id = aTestRequestManager.Save(aPatientVm);
            if (id == 0)
            {
                messageLabel.Text = "Mobile number already exists";

            }
            else
            {
                List<PatientTestVM> patientTest = (List<PatientTestVM>)ViewState["name"];

                foreach (PatientTestVM patientTestVM in patientTest)
                {
                    patientTestVM.PatientId = Convert.ToInt32(id);
                    patientTestVM.EntryDate = DateTime.Now.ToString("yyyy-MM-dd");
                    int rowAffected = aTestRequestManager.Save2(patientTestVM);
                    /*if (rowAffected>0)
                    {
                        messageLabel.Text = "Saved successfully";

                        GeneratePdf();
                    }
                    else
                    {
                        messageLabel.Text = "Saving Failed";
                    }*/
                }
                messageLabel.Text = "Saved successfully";
                ClearAllTextBoxes();
                GeneratePdf();

            }




        }

        private void ClearAllTextBoxes()
        {
                nameOfPatientTextBox.Text =String.Empty;
                mobileNoTextBox.Text = String.Empty;
                dateOfBirthTextBox.Value = String.Empty;
                testEntryGridView.DataSource = "";
                testEntryGridView.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }


        public void GeneratePdf()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Bill.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            testEntryGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 20f, 30f, 20f, 40f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.AddHeader("Header", "Diagnostic Center Bill Management");
            pdfDoc.Add(new Header("Header", "Diagnostic Center Bill Management"));

            pdfDoc.Add(new Paragraph("Date: " + billDate));
            pdfDoc.Add(new Paragraph("Bill NO: " + billNo));
            pdfDoc.Add(new Paragraph("Name: " + nameOfPatientTextBox.Text));
            pdfDoc.Add(new Paragraph("Date of Birth: " + dateOfBirthTextBox.Value));
            pdfDoc.Add(new Paragraph("Mobile No: " + mobileNoTextBox.Text));
            htmlparser.Parse(sr);
            pdfDoc.Add(new Paragraph("Total Amount : " + totalTextBox.Text));

            pdfDoc.Close();
            Response.Write(pdfDoc);

            Response.Flush();
            Response.End();

        }

        protected void dateOfBirthTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}


