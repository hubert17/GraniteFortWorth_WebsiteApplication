<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-notes.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_notes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
            <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />
</head>
<body style="margin-left:10px;">
    <form id="form1" runat="server">
    <div>
  <asp:FormView ID="FormView2" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource2" Width="350px" DefaultMode="Edit">
         <EditItemTemplate>
<table class="auto-style1">
                 <tr>
                     <td>Notes and Attachment:</td>
                 </tr>
                 <tr>
                     <td>
                         <asp:TextBox ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' Height="64px" TextMode="MultiLine" Width="292px" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                         <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                     </td>
                 </tr>
                 <tr>
                     <td><hr /><asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="False" />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:HyperLink ID="HyperLink1" runat="server" Text="Before:" />
                         <asp:HyperLink ID="BeforePicFilePathLabel" runat="server" NavigateUrl='<%# Eval("BeforePicFilePathEdit","/admin/Attachment/{0}") + Eval("OnlineQuoteID","?OnlineQuoteID={0}") %>' Target="_blank" Text='<%# Eval("BeforePicFilePathEdit") %>' />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:HyperLink ID="HyperLink2" runat="server" Text="Measure:" />
                         <asp:HyperLink ID="MeasurementPicFilePathLabel" runat="server" Text='<%# Eval("MeasurementPicFilePathEdit") %>' Target="_blank"   NavigateUrl='<%# Eval("MeasurementPicFilePathEdit","/admin/Attachment/{0}") + Eval("OnlineQuoteID","?OnlineQuoteID={0}") %>' />

                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:HyperLink ID="HyperLink3" runat="server" Text="After:"  />
                         <asp:HyperLink ID="AfterPicFilePathLabel" runat="server" Text='<%# Eval("AfterPicFilePathEdit") %>' Target="_blank"   NavigateUrl='<%# Eval("AfterPicFilePathEdit","/admin/Attachment/{0}") + Eval("OnlineQuoteID","?OnlineQuoteID={0}") %>'  />
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Button ID="AttachButton" runat="server" OnClick="AttachButton_Click" OnClientClick="OnClientClick=&quot;aspnetForm.target ='_parent';&quot;" Text="Attach File" />
                     </td>
                 </tr>
             </table>


         </EditItemTemplate>               
    </asp:FormView>  
    </div>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, Notes, iif(isnull(BeforePicFilePath), 'Attach', BeforePicFilePath) AS BeforePicFilePathEdit, iif(isnull(MeasurementPicFilePath), 'Attach', MeasurementPicFilePath) AS MeasurementPicFilePathEdit, iif(isnull(AfterPicFilePath), 'Attach', AfterPicFilePath) AS AfterPicFilePathEdit FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [Notes], [BeforePicFilePath], [MeasurementPicFilePath], [AfterPicFilePath]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE tblOnlineQuotes SET Notes = ? WHERE (OnlineQuoteID = ?)">
        <DeleteParameters>
            <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
        </DeleteParameters>       
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </form>
</body>
</html>
