<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestSetup.aspx.cs" Inherits="DiagnosticCenterBillManagementSystemApp.UI.TestSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/ValidationEngine.css" rel="stylesheet" type="text/css" />
    <title></title>
    <link href="../css/Style.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet"/>
    
    <link href="../css/main.css" rel="stylesheet"/>
    <link href="../css/responsive.css" rel="stylesheet"/>
</head>
<body>
    <div class="homepage">
    <<div class="wrapper">
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
            <h2 class="story-header">Test Setup</h2>
                <form id="form1" runat="server">
        
            <div>

                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
   
        <br />
        <table>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Test Name"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>
                    <asp:TextBox type="text" CssClass="validate[required]" ID="testNameTextBox" runat="server" Width="176px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="Fee"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="feeTextBox" runat="server" Width="175px" TextMode="Number" CssClass="validate[required,custom[integer],maxSize[5],minSize[1]]"></asp:TextBox>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="BDT"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label3" runat="server" Text="Test Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="testTypeDropDownList" runat="server" Height="19px" Width="185px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="saveButton" runat="server" Text="Save" Width="86px" OnClick="saveButton_Click" />

                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>

            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    
                <br />
                <br />
                <asp:GridView ID="testGridView" runat="server" Width="584px" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <RowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="SL" HeaderStyle-Width="5px">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Test Name">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Name")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fee">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("Fee")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:Label runat="server"><%#Eval("TypeName")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>


                <br />


            </div>
     
    </form>
           </div>
	  </div>
          
 <footer style="font-family: cursive;background-color: #004C99">Developed By Group ANONYMOUS </footer>
            </div>
    

    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery.validationEngine-en.js"></script>
    <script src="../Scripts/jquery.validationEngine.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#form1").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>


    <%--<script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>
    <script src="../Scripts/jquery-ui-1.12.1.js"></script>
    <script>
        $("#form1").validate({
            rules: {
                name: "required",
                fee: "required"
            },
            messages: {
                name: "Please provide test name",
                fee: "Please provide fee"
            }
        });
    </script>--%>
</body>
</html>
