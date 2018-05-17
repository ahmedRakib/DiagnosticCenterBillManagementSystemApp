<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DiagnosticCenterBillManagementSystemApp.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <h2 class="story-header">Payment</h2>
                <form id="form1" runat="server">
        
            <div>
                   
            <table>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Text="Bill No"></asp:Label>
                        &nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:TextBox ID="billlNoTextBox" runat="server" Width="165px"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label6" runat="server" Text="Or"></asp:Label>
                        &nbsp;&nbsp; &nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="Mobile No"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </td>
                    <td>
                        <asp:TextBox ID="mobileNoTextBox" runat="server" Width="166px"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="msgLabel" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
                    &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HiddenField ID="idHiddenField" runat="server" />
                    &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />

               

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="Label8" runat="server" Text="Amount"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>
                    <asp:TextBox Enabled="False" ID="amountTextBox" runat="server" Width="164px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label9" runat="server" Text="Due Date"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="dueDateTextBox" Enabled="False" runat="server" Width="163px"></asp:TextBox>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="payButton" runat="server" Text="Pay" Width="70px" OnClick="payButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
        </table>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />

             
            </div>
        
    </form>
           </div>
	  </div>
          
 <footer style="font-family: cursive;background-color: #004C99">Developed By Group ANONYMOUS </footer>
            </div>
</body>
</html>
