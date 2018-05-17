using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnosticCenterBillManagementSystemApp.BLL;
using DiagnosticCenterBillManagementSystemApp.DAL.Model.View;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace DiagnosticCenterBillManagementSystemApp
{
    public partial class TypeWiseReport : System.Web.UI.Page
    {
        TestDateManager aTestDateManager = new TestDateManager();
        double total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            String fromDate = fromDateTextBox.Value;
            DateTime FromDate = new DateTime();
            FromDate = DateTime.ParseExact(fromDate, "dd-MM-yyyy", null);
            String fromDateNew = FromDate.ToString("yyyy-MM-dd");

            String toDate = toDateTextBox.Value;
            DateTime ToDate = new DateTime();
            ToDate = DateTime.ParseExact(toDate, "dd-MM-yyyy", null);
            String toDateNew = ToDate.ToString("yyyy-MM-dd");

            List<TestDateVM> AllTestDate = aTestDateManager.GetTestWithTypeName(fromDateNew, toDateNew);
            testTypeGridView.DataSource = AllTestDate;
            testTypeGridView.DataBind();

            foreach (TestDateVM testDateVm in AllTestDate)
            {
                total += testDateVm.Fee;
            }
            totalTextBox.Text = total.ToString();


        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Test Type Wise Result.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            testTypeGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 20f, 30f, 20f, 40f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.AddHeader("Header", "Diagnostic Center Bill Management");
            pdfDoc.Add(new Header("Header", "Diagnostic Center Bill Management"));

            pdfDoc.Add(new Paragraph("From : " + fromDateTextBox.Value));
            pdfDoc.Add(new Paragraph("To : " + toDateTextBox.Value));
            pdfDoc.Add(new Paragraph(""));

            htmlparser.Parse(sr);
            pdfDoc.Add(new Paragraph("Total Amount : " + totalTextBox.Text));

            pdfDoc.Close();
            Response.Write(pdfDoc);

            Response.Flush();
            Response.End();

        }
    }
}