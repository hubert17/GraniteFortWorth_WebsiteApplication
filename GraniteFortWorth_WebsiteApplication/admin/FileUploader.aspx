<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUploader.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.FileUploader" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Granite Image Upload Utility - Online Quote Webapp</title>
    <link rel="stylesheet" href="css/hcforms.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo_acc.css" />
	<script type="text/javascript" src="js/modernizr.custom.29473.js"></script>


		<!--[if lt IE 9]>
			<style>
				.content{
					height: auto;
					margin: 0;
				}
				.content div {
					position: relative;
				}
			    </style>
		<![endif]-->


    <style>

         input[type=submit]{
            padding: 4px;
		}			

    </style>
</head>

<body>
  <form id="form1" runat="server">
       <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="Default.aspx"><strong>Return to Admin Home</strong></a>

                <span class="right">
                    <asp:LinkButton ID="LoggedInUserName" runat="server" Text="Hello, " /><strong><asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton></strong>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			<header>

                                    <asp:FormView ID="FormView1" runat="server" Width="800px" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" DefaultMode="Edit" HorizontalAlign="Center">
                        <EditItemTemplate>
                        <h1>Upload attachment for Job: 
                            <span><asp:Label ID="CustomerNameTextBox" runat="server" Text='<%# Eval("CustomerName") %>' /></span>
                        </h1>
				        <h2>File Uploading utility for Job Attachment</h2>
                           
                            
                        <div style="visibility:hidden;">
                                <asp:TextBox ID="BeforePicFilePathTextBox" runat="server" Text='<%# Bind("BeforePicFilePath") %>' />
                                  <asp:TextBox ID="MeasurementPicFilePathTextBox" runat="server" Text='<%# Bind("MeasurementPicFilePath") %>' />
                                <asp:TextBox ID="AfterPicFilePathTextBox" runat="server" Text='<%# Bind("AfterPicFilePath") %>' />
                         <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                                                       <asp:Label ID="OnlineQuoteIDTextBox" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />

                         </div>


                        </EditItemTemplate>
                       
                        
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID,  CustomerFirstName + ' ' + CustomerLastName AS CustomerName, BeforePicFilePath, MeasurementPicFilePath, AfterPicFilePath FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE tblOnlineQuotes SET BeforePicFilePath = ?, MeasurementPicFilePath = ?, AfterPicFilePath = ? WHERE (OnlineQuoteID = ?)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="OnlineQuoteID" QueryStringField="OnlineQuoteID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="BeforePicFilePath" Type="String" />
                                <asp:Parameter Name="MeasurementPicFilePath" Type="String" />
                                <asp:Parameter Name="AfterPicFilePath" Type="String" />
                                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			</header>
			<section style="width:800px;margin-left:auto;margin-right:auto;">
                <div>
                    <asp:Panel ID="pnlUploadBefore" runat="server">
                        Before: <asp:FileUpload ID="UploadBefore" runat="server" onchange="GetFileNameBefore(this.value)" Height="25px" Width="300px" />
                        &nbsp;<asp:Button ID="btnUploadBefore" runat="server" OnClick="btnUploadBefore_Click" Text="Upload" />
                        &nbsp;<asp:Button ID="LinkButton1Before" runat="server" Text="Cancel" OnClick="LinkButton1Before_Click" />
                        <br />
                        <asp:Label ID="lblErrorBefore" runat="server" Visible="false" />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCropBefore" runat="server" Visible="false">
                        <asp:HyperLink ID="linkCropBefore" runat="server" />
                      <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCroppedBefore" runat="server" Visible="false"></asp:Panel>
                    <br />
                  </div>

		        <div>
                    <asp:Panel ID="pnlUploadMeasure" runat="server">
                        Measure: <asp:FileUpload ID="UploadMeasure" runat="server" onchange="GetFileNameMeasure(this.value)" Height="25px" Width="300px" />
                        &nbsp;<asp:Button ID="btnUploadMeasure" runat="server" OnClick="btnUploadMeasure_Click" Text="Upload" />
                        &nbsp;<asp:Button ID="LinkButton1Measure" runat="server" Text="Cancel" OnClick="LinkButton1Measure_Click" />
                        <br />
                        <asp:Label ID="lblErrorMeasure" runat="server" Visible="false" />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCropMeasure" runat="server" Visible="false">
                        <asp:HyperLink ID="linkCropMeasure" runat="server" />
                      <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCroppedMeasure" runat="server" Visible="false"></asp:Panel>
                    <br />
                  </div>

		        <div>
                    <asp:Panel ID="pnlUploadAfter" runat="server">
                        After: <asp:FileUpload ID="UploadAfter" runat="server" onchange="GetFileNameAfter(this.value)" Height="25px" Width="300px" />
                        &nbsp;<asp:Button ID="btnUploadAfter" runat="server" OnClick="btnUploadAfter_Click" Text="Upload" />
                        &nbsp;<asp:Button ID="LinkButton1After" runat="server" Text="Cancel" OnClick="LinkButton1After_Click" />
                        <br />
                        <asp:Label ID="lblErrorAfter" runat="server" Visible="false" />
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCropAfter" runat="server" Visible="false">
                        <asp:HyperLink ID="linkCropAfter" runat="server" />
                      <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCroppedAfter" runat="server" Visible="false"></asp:Panel>
                    <br />
                  </div>
            </section>
        </div>
  </form>
</body>

</html>
