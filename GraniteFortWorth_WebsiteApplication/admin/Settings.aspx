<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Settings" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Webapp Default Settings</title>
    <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_acc.css" />
    <link rel="stylesheet" type="text/css" href="css/style_form.css" />
	<script type="text/javascript" src="js/modernizr.custom.29473.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="Default.aspx"><strong>Return to Admin Home</strong></a>
                <a href="/admin/Manage-granite.aspx">Granite</a>
                <a href="/admin/Manage-services.aspx">Services</a>
                <a href="/admin/Manage-sink.aspx">Sinks</a>
                <a href="/admin/Weekend-specials.aspx">Weekend Specials</a>
	            <a href="/admin/CalendarInstall.aspx">DFW Install Calendar</a>
                <a href="/admin/References.aspx?AdminView=true">References</a>
                <a href="/admin/Sales-report-monthly.aspx">Sales Report</a>
                <a href="/admin/StatusReport.aspx">Job Status Report <span style="color:red;">NEW!</span></a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>
				<h1>DFW <span>Wholesale Granite</span></h1>
				<h2>Webapp Settings</h2>
            </header>
           <section>
                <div id="form4" style="width:310px;margin-left:auto;margin-right:auto;">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="dfwDefaultID" DataSourceID="SqlDataSource1" Width="300px">
                        <EditItemTemplate>
                            Surcharge:
                            <asp:TextBox ID="SurchargeTextBox" runat="server" Text='<%# Bind("Surcharge") %>' />
                            <br />
                            State Tax:
                            <asp:TextBox ID="StateTaxTextBox" runat="server" Text='<%# Bind("StateTax") %>' />
                            <br />
                            <hr />
                            <br />
                            <strong>WORK ORDER</strong><br />Company Name:
                            <asp:TextBox ID="WOCompanyNameTextBox" runat="server" Text='<%# Bind("WOCompanyName") %>' />
                            <br />
                            Company Address & Contact:
                            <asp:TextBox ID="WOCompanyAddressTextBox" runat="server" Text='<%# Bind("WOCompanyAddress") %>' Rows="2" />
                            <br />
                            Recepient Email:
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="WORecepientEmailTextBox" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid Email</asp:RegularExpressionValidator>
                            &nbsp;<asp:TextBox ID="WORecepientEmailTextBox" runat="server" Text='<%# Bind("WORecepientEmail") %>' />
                                                        <hr />
                            <br />
                            <asp:Label ID="JobRefLabel" runat="server" Text="Upload Job Reference [PDF Only]:"></asp:Label>
&nbsp;<br />&nbsp;<asp:FileUpload ID="FileUploadReferences" runat="server" />
                            &nbsp;<asp:Button ID="UploadButton" runat="server" OnClick="UploadButton_Click" Text="Upload" />
                            <hr />

                            <div style="display:none;">
                            <br />
                            Email Subject:
                            <asp:TextBox ID="WOEmailSubjectTextBox" runat="server" Text='<%# Bind("WOEmailSubject") %>' />
                            <br />
                            Email Message:
                            <asp:TextBox ID="WOEmailMessageTextBox" runat="server" Text='<%# Bind("WOEmailMessage") %>' Height="100px" TextMode="MultiLine" />
                            <br />
                            <hr />
                            <br />
                            <strong>QUOTE</strong><br />Email Subject:
                            <asp:TextBox ID="QuoteEmailSubjectTextBox" runat="server" Text='<%# Bind("QuoteEmailSubject") %>' />
                            <br />
                            Email Message:
                            <asp:TextBox ID="QuoteEmailMessageTextBox" runat="server" Text='<%# Bind("QuoteEmailMessage") %>' Height="100px" TextMode="MultiLine" />
                            <br />

                            <br />
                            <asp:TextBox ID="MeasureEmailSubjectTextBox" runat="server" Text='<%# Bind("MeasureEmailSubject") %>' />
                            <br />
                            <asp:TextBox ID="MeasureEmailMessageTextBox" runat="server" Text='<%# Bind("MeasureEmailMessage") %>' />
                            <br />
                            State:
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            Invoice No Init:
                            <asp:TextBox ID="InvoiceNoInitTextBox" runat="server" Text='<%# Bind("InvoiceNoInit") %>' />
                            <br />
                            Task Status:
                            <asp:TextBox ID="TaskStatusTextBox" runat="server" Text='<%# Bind("TaskStatus") %>' />
                            <br />
                                </div>
                            
                            <p class="codrops-demos">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </p>
                            <asp:Label ID="dfwDefaultIDLabel1" runat="server" Text='<%# Eval("dfwDefaultID") %>' Visible="False" />
                        </EditItemTemplate>
                        
                        <ItemTemplate>
                            Surcharge:
                            <asp:TextBox ReadOnly="true" ID="SurchargeTextBox" runat="server" Text='<%# Bind("Surcharge") %>' />
                            <br />
                            State Tax:
                            <asp:TextBox ReadOnly="true" ID="StateTaxTextBox" runat="server" Text='<%# Bind("StateTax") %>' />
                            <br />
                            <hr />
                            <br />
                            <strong>WORK ORDER</strong><br />Company Name:
                            <asp:TextBox ReadOnly="true" ID="WOCompanyNameTextBox" runat="server" Text='<%# Bind("WOCompanyName") %>' />
                            <br />
                            Company Address & Contact:
                            <asp:TextBox ReadOnly="true" ID="WOCompanyAddressTextBox" runat="server" Text='<%# Bind("WOCompanyAddress") %>' Rows="2" />
                            <br />
                            Recepient Email:
                            <asp:TextBox ReadOnly="true" ID="WORecepientEmailTextBox" runat="server" Text='<%# Bind("WORecepientEmail") %>' />
                                                        <hr />
                            <br />
                            Job Reference: <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Download/References.pdf" Target="_blank">References.pdf</asp:HyperLink>
                            <hr />

                            <div style="display:none;">
                            <br />
                            Email Subject:
                            <asp:TextBox ReadOnly="true" ID="WOEmailSubjectTextBox" runat="server" Text='<%# Bind("WOEmailSubject") %>' />
                            <br />
                            Email Message:
                            <asp:TextBox ReadOnly="true" ID="WOEmailMessageTextBox" runat="server" Text='<%# Bind("WOEmailMessage") %>' Height="100px" TextMode="MultiLine" />
                            <br />

                            <hr />
                            <br />
                            <strong>QUOTE</strong><br />Email Subject:
                            <asp:TextBox ReadOnly="true" ID="QuoteEmailSubjectTextBox" runat="server" Text='<%# Bind("QuoteEmailSubject") %>' />
                            <br />
                            Email Message:
                            <asp:TextBox ReadOnly="true" ID="QuoteEmailMessageTextBox" runat="server" Text='<%# Bind("QuoteEmailMessage") %>' Height="100px" TextMode="MultiLine" />
                            <br />

                            <br />
                            <asp:TextBox ReadOnly="true" ID="MeasureEmailSubjectTextBox" runat="server" Text='<%# Bind("MeasureEmailSubject") %>' />
                            <br />
                            <asp:TextBox ReadOnly="true" ID="MeasureEmailMessageTextBox" runat="server" Text='<%# Bind("MeasureEmailMessage") %>' />
                            <br />
                            State:
                            <asp:TextBox ReadOnly="true" ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            <br />
                            Invoice No Init:
                            <asp:TextBox ReadOnly="true" ID="InvoiceNoInitTextBox" runat="server" Text='<%# Bind("InvoiceNoInit") %>' />
                            <br />
                            Task Status:
                            <asp:TextBox ReadOnly="true" ID="TaskStatusTextBox" runat="server" Text='<%# Bind("TaskStatus") %>' />
                            <br />
                                </div>
                            
                            
                            <p class="codrops-demos">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </p>
                            <asp:Label ID="dfwDefaultIDLabel" runat="server" Text='<%# Eval("dfwDefaultID") %>' Visible="false" />

                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [dfwDefaults] WHERE [dfwDefaultID] = ?" InsertCommand="INSERT INTO [dfwDefaults] ([dfwDefaultID], [Surcharge], [StateTax], [WOCompanyName], [WOCompanyAddress], [WORecepientEmail], [WOEmailSubject], [WOEmailMessage], [QuoteEmailSubject], [QuoteEmailMessage], [MeasureEmailSubject], [MeasureEmailMessage], [State], [InvoiceNoInit], [TaskStatus]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [dfwDefaultID], [Surcharge], [StateTax], [WOCompanyName], [WOCompanyAddress], [WORecepientEmail], [WOEmailSubject], [WOEmailMessage], [QuoteEmailSubject], [QuoteEmailMessage], [MeasureEmailSubject], [MeasureEmailMessage], [State], [InvoiceNoInit], [TaskStatus] FROM [dfwDefaults]" UpdateCommand="UPDATE [dfwDefaults] SET [Surcharge] = ?, [StateTax] = ?, [WOCompanyName] = ?, [WOCompanyAddress] = ?, [WORecepientEmail] = ?, [WOEmailSubject] = ?, [WOEmailMessage] = ?, [QuoteEmailSubject] = ?, [QuoteEmailMessage] = ?, [MeasureEmailSubject] = ?, [MeasureEmailMessage] = ?, [State] = ?, [InvoiceNoInit] = ?, [TaskStatus] = ? WHERE [dfwDefaultID] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="dfwDefaultID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="dfwDefaultID" Type="Int32" />
                            <asp:Parameter Name="Surcharge" Type="Double" />
                            <asp:Parameter Name="StateTax" Type="Double" />
                            <asp:Parameter Name="WOCompanyName" Type="String" />
                            <asp:Parameter Name="WOCompanyAddress" Type="String" />
                            <asp:Parameter Name="WORecepientEmail" Type="String" />
                            <asp:Parameter Name="WOEmailSubject" Type="String" />
                            <asp:Parameter Name="WOEmailMessage" Type="String" />
                            <asp:Parameter Name="QuoteEmailSubject" Type="String" />
                            <asp:Parameter Name="QuoteEmailMessage" Type="String" />
                            <asp:Parameter Name="MeasureEmailSubject" Type="String" />
                            <asp:Parameter Name="MeasureEmailMessage" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="InvoiceNoInit" Type="Double" />
                            <asp:Parameter Name="TaskStatus" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Surcharge" Type="Double" />
                            <asp:Parameter Name="StateTax" Type="Double" />
                            <asp:Parameter Name="WOCompanyName" Type="String" />
                            <asp:Parameter Name="WOCompanyAddress" Type="String" />
                            <asp:Parameter Name="WORecepientEmail" Type="String" />
                            <asp:Parameter Name="WOEmailSubject" Type="String" />
                            <asp:Parameter Name="WOEmailMessage" Type="String" />
                            <asp:Parameter Name="QuoteEmailSubject" Type="String" />
                            <asp:Parameter Name="QuoteEmailMessage" Type="String" />
                            <asp:Parameter Name="MeasureEmailSubject" Type="String" />
                            <asp:Parameter Name="MeasureEmailMessage" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="InvoiceNoInit" Type="Double" />
                            <asp:Parameter Name="TaskStatus" Type="Int32" />
                            <asp:Parameter Name="dfwDefaultID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
 
                    
                    <div>
                        <hr />
                        <asp:Label ID="lbl1" runat="server" Text="Google Calendar ID:"></asp:Label>
                        <asp:TextBox ID="txtCalendarID" runat="server"></asp:TextBox><br />
                        <asp:Label ID="lbl2" runat="server" Text="Google Account Password:"></asp:Label>
                        <asp:TextBox ID="txtAcctPwd" runat="server"></asp:TextBox><br />
                        <asp:Button ID="btnSaveAppSettings" runat="server" Text="Save" OnClick="btnSaveAppSettings_Click" OnClientClick='return confirm(&apos;This will update Google Install Calendar settings. You may no longer be able to access Google Calendar from webapp if you supplied the wrong account information. Do you wish to continue?&apos;);' />

                     </div>

                </div>



           </section>

</div>
    </form>
</body>
</html>

