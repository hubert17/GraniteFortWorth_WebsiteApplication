<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinkImageUploader.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.SinkImageUploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sink Image Upload Utility - Online Quote Webapp</title>
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

                                    <asp:FormView ID="FormView1" runat="server" Width="800px" DataKeyNames="SlabColorID" DataSourceID="SqlDataSource1" DefaultMode="Edit" HorizontalAlign="Center">
                        <EditItemTemplate>
                        <h1>Upload image for 
                            <span><asp:Label ID="SlabColorTextBox" runat="server" Text='<%# Eval("SlabColorName") %>' /></span>
                        </h1>
				        <h2>Image Uploading utility for Sinks</h2>
                           
                            
                        <div style="visibility:hidden;">
                                <asp:TextBox ID="ImageFilenameTextBox" runat="server" Text='<%# Bind("ImageFilename") %>' />
                         </div>
                            <asp:Label ID="SlabColorIDLabel1" runat="server" Visible="false" Text='<%# Eval("SlabColorID") %>' />

                        </EditItemTemplate>
                       
                        
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" DeleteCommand="DELETE FROM [tblSlabColors] WHERE [SlabColorID] = ?" InsertCommand="INSERT INTO [tblSlabColors] ([SlabColorID], [SlabColor], [ImageFilename], [ImageFilenameOld]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT SinkID AS SlabColorID, CatalogID AS SlabColorName, ImageFilename FROM tblSinks WHERE (SinkID = ?)" UpdateCommand="UPDATE tblSinks SET ImageFilename = ? WHERE (SinkID = ?)">
                            <DeleteParameters>
                                <asp:Parameter Name="SlabColorID" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="" Name="SlabColorID" QueryStringField="SinkID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ImageFilename" Type="String" />
                                <asp:Parameter Name="SlabColorID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			</header>
			<section style="width:800px;margin-left:auto;margin-right:auto;">
                <div>
                    <asp:Panel ID="pnlUpload" runat="server">
                        <asp:FileUpload ID="Upload" runat="server" onchange="GetFileName(this.value)" Height="25px" Width="300px" />
                        &nbsp;<asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" />
                        &nbsp;<asp:Button ID="LinkButton1" runat="server" Text="Cancel" OnClick="LinkButton1_Click" />
                        <br />
                        <asp:Label ID="lblError" runat="server" Visible="false" />
                        <br />
                    </asp:Panel>

                    <asp:Panel ID="pnlCrop" runat="server" Visible="false">
                      <asp:Image ID="imgCrop" runat="server" />
                      <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlCropped" runat="server" Visible="false">
                    </asp:Panel>
                  </div>

            </section>
        </div>
  </form>
</body>

</html>
