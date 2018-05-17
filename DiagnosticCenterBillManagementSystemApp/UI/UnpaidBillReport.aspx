<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBillReport.aspx.cs" Inherits="DiagnosticCenterBillManagementSystemApp.UI.UnpaidBillReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../css/Style.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet"/>
    
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
            <h2 class="story-header">Unpaid Bill Report</h2>
               <form id="form1" runat="server">
       
            <div>

                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                        </td>
                        <td>

                            <input type="text" value="dd/mm/yyyy" id="fromDateTextBox" class="datepicker" runat="server" />

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>

                        </td>
                        <td>

                            <input type="text" value="dd/mm/yyyy" id="toDateTextBox" class="datepicker" runat="server" />

                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="showButton" runat="server" Text="Show" Width="60px" OnClick="showButton_Click" />
                            &nbsp; &nbsp;</td>
                    </tr>
                </table>

                <br />

                <asp:GridView ID="unpaidBillGridView" runat="server" AutoGenerateColumns="False" Width="692px" Height="150px">
                    <RowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>

                            <HeaderStyle Font-Bold="True" ForeColor="#0099FF" HorizontalAlign="Center" Font-Italic="True"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Bill Number">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("BillNo") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact No">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Mobile") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Patient Name">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Name") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Bill Amount">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("DueBill") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" ForeColor="#0099FF" HorizontalAlign="Center" />

                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

                <br />

                <table>
                    <tr>

                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label>
                            &nbsp;&nbsp; &nbsp;</td>
                        <td>
                            <asp:TextBox ID="totalTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="pdfButton" runat="server" Height="26px" OnClick="pdfButton_Click" Text="PDF" Width="65px" />
            </div>
     
    </form>
                
            </div>
    
        
           </div>
 <footer style="font-family: cursive;background-color: #004C99">Developed By Group ANONYMOUS </footer>
	  </div>
          
   
  

    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
    <script>
        $(document).on('ready', function () {
            $(".datepicker").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true
            });

        });
    </script>
</body>
</html>
