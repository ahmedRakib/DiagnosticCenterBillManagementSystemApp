<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestWiseReport.aspx.cs" Inherits="DiagnosticCenterBillManagementSystemApp.TestWiseReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../css/Style.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet"/>
    <%--<link href="../css/animate.min.css" rel="stylesheet"/>
    <link href="../css/prettyPhoto.css" rel="stylesheet"/>--%>
    <link href="../css/main.css" rel="stylesheet"/>
    <link href="../css/responsive.css" rel="stylesheet"/>

</head>
<body>
     <div class="homepage">
<header id="header">
        <nav class="navbar navbar-inverse" role="banner" style="background-color: #336699">
            <div class="container">

				
                <div class="collapse navbar-collapse navbar-left">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Index.aspx">Home</a></li> 
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Setup<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="TestTypeSetup.aspx">Test Type</a></li>                        
                                <li><a href="TestSetup.aspx">Test</a></li>                              
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Test Request<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="TestRequestEntry.aspx">Entry</a></li>                        
                                <li><a href="Payment.aspx">Payment</a></li>                              
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Report<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="TestWiseReport.aspx">Test Wise Report</a></li>                        
                                <li><a href="TypeWiseReport.aspx">Type Wise Report</a></li>                              
                                <li><a href="UnpaidBillReport.aspx">Unpaid Bill</a></li>                              
                            </ul>
                        </li>   
                                                                   
                                     
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
  
   
			
	  <div class="story-container">        
             
           <div class="story-content2"> 
            <h2 class="story-header">Test Wise Report</h2>
                <form id="form1" runat="server">
        
            <div>

                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="From Date"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>

                        <td>
                            <input type="text" id="fromDateTextBox" class="datepicker" runat="server" width="112px" /></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; To Date</td>
                        <td class="auto-style1">
                            <input type="text" id="toDateTextBox" class="datepicker" runat="server" width="113px" />
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="showButton" runat="server" Text="Show" Width="68px" OnClick="showButton_Click" />
                            &nbsp;&nbsp;</td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
                <br />
                <asp:GridView ID="testWiseReportGridView" runat="server" AutoGenerateColumns="False" Width="558px" Height="178px">
                    <RowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />
                            <ItemStyle ForeColor="Black" HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test Name">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Name") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />
                            <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Test">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("OrderCount") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />
                            <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Amount">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Fee") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />
                            <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="White" ForeColor="#003399" />
                </asp:GridView>

                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="pdfButton" runat="server" Text="PDF" Width="78px" OnClick="pdfButton_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>
                            <asp:TextBox ID="totalTextBox" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
            
            </div>
       
    </form>
           </div>
	  </div>
          
 <footer style="font-family: cursive;background-color: #004C99">Developed By Group ANONYMOUS </footer>
            </div>
    


    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>

    <script>
        $().ready(function () {


            // validate signup form on keyup and submit
            $("#form1").validate({
                rules: {
                    fromDateTextBox: "required",
                    toDateTextBox: "required",
                },
                messages: {
                    nameOfPatientTextBox: "Please select start date",
                    dateOfBirthTextBox: "Please select end date"
                }
            });

            $("#fromDateTextBox").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true
            });
            $("#toDateTextBox").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</body>
</html>
