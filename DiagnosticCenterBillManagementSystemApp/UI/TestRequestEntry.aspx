<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestRequestEntry.aspx.cs" Inherits="DiagnosticCenterBillManagementSystemApp.UI.TestRequestEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="../css/ValidationEngine.css" rel="stylesheet" type="text/css" />

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
            <h2 class="story-header">Test Request Entry</h2>
    <form id="form1" runat="server">
       
            <div>

                <br />
               


                    &nbsp;&nbsp;&nbsp;
            <table>
                <tr>
                    <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Label ID="Label6" runat="server" Text="Name Of the Patient"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="nameOfPatientTextBox" name="name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label7" runat="server" Text="Date Of Birth"></asp:Label>
                    </td>

                    <td>
                        <input type="text" id="dateOfBirthTextBox" class="datepicker" runat="server" ontextchanged="dateOfBirthTextBox_TextChanged" /></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:Label ID="Label8" runat="server" Text="Mobile No"></asp:Label>
                    </td>
                    <td>

                        <asp:TextBox ID="mobileNoTextBox" name="mobile" runat="server" Width="118px" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:Label ID="Label9" runat="server" Text="Select Test"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList AutoPostBack="True" ID="selectTestDropDownList" runat="server" Height="25px" Width="130px" OnSelectedIndexChanged="selectTestDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:HiddenField ID="dateHiddenField" runat="server" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label10" runat="server" Text="Fee"></asp:Label>
                        &nbsp;&nbsp;<asp:TextBox ID="feeTextBox" runat="server" Enabled="False" Width="72px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="addButton" runat="server" Text="Add" Width="78px" OnClick="addButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="messageLabel" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

            
                &nbsp;&nbsp;&nbsp;
                
        <asp:GridView ID="testEntryGridView" runat="server" AutoGenerateColumns="False" Width="492px">
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5px">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>

                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#3366FF" HorizontalAlign="Center" VerticalAlign="Middle" Font-Italic="True"></HeaderStyle>
                    <ItemStyle Font-Bold="False" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <%--<asp:BoundField DataField="TestName" HeaderText="Test Name" SortExpression="TestName" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />--%>
                <asp:TemplateField HeaderText="Test Name">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("TestName")%></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#3366FF" HorizontalAlign="Center" VerticalAlign="Middle" Font-Italic="True" />
                    <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fee">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("Fee")%></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BackColor="White" ForeColor="#3366FF" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" Font-Italic="True" />
                    <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                </asp:TemplateField>
                <%--<asp:BoundField DataField="TestName" HeaderText="Test" SortExpression="TestName" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />--%>
            </Columns>
        </asp:GridView>
                <br />

                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Total"></asp:Label>
                            &nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td>
                            <asp:TextBox ID="totalTextBox" Enabled="False" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="saveButton" runat="server" Text="Save" Width="90px" OnClick="saveButton_Click" />
                            &nbsp;</td>
                    </tr>
                </table>
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
                    nameOfPatientTextBox: "required",
                    dateOfBirthTextBox: "required",

                    mobileNoTextBox: {
                        required: true,
                        minlength: 11
                    },
                },
                messages: {
                    nameOfPatientTextBox: "Please enter patient name",
                    dateOfBirthTextBox : "Please select date of birth",
                    mobileNoTextBox: {
                        required: "Please enter mobile number",
                        minlength: "Mobile no  must consist of 11 digits"
                    }
                }
            });

            $("#dateOfBirthTextBox").datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                yearRange: '1990:2030',
                changeYear: true

            });
        });
    </script>

</body>
</html>
