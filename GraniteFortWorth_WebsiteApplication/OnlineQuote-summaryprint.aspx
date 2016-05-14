<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuote-summaryprint.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_summaryprint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DFW JOB QUOTE</title>

    <meta name="robots" content="noindex" />

    
</head>
<body style="margin:0px;">
    <form id="form1" runat="server">
    

<h2>DFW Wholesale Granite</h2>
        <p><em>10011 Harmon Road, Unit 101, Fort Worth Texas 76177
            <br />
            (817) 300-3298</em></p>


<h3>Customer Information <em>Quote #<asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="2" Visible="True"></asp:Label>
</em></h3>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="490px" AutoGenerateRows="False" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" Font-Names="Times New Roman" Font-Size="Small">
        <FieldHeaderStyle Width="80px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" InsertVisible="False" ReadOnly="True" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="CustomerName" HeaderText="NAME:" ReadOnly="True" SortExpression="CustomerName" />
            <asp:BoundField DataField="Address" HeaderText="ADDRESS:" SortExpression="Address" />
            <asp:BoundField DataField="Address2" ReadOnly="True" SortExpression="Address2" />
            <asp:BoundField DataField="Phone" HeaderText="PHONE:" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="E-MAIL:" SortExpression="Email" />
        </Fields>
    </asp:DetailsView>
<br />

<h3>Stone Detail</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="490px" Font-Names="Times New Roman" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="OnlineQuoteStoneID" HeaderText="OnlineQuoteStoneID" InsertVisible="False" SortExpression="OnlineQuoteStoneID" Visible="False" />
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="SlabColorName" HeaderText="STONE" ReadOnly="True" SortExpression="SlabColorName" >
            </asp:BoundField>
            <asp:BoundField DataField="SF" HeaderText="SF" ReadOnly="True" SortExpression="SF" >
            </asp:BoundField>
            <asp:BoundField DataField="PublishedPrice" HeaderText="PRICE" ReadOnly="True" SortExpression="PublishedPrice" DataFormatString="{0:C}" >
            </asp:BoundField>
            <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" >
            </asp:BoundField>
        </Columns>
    </asp:GridView>
<br />


<h3>Edge and Backsplash Detail</h3>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="490px" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Font-Names="Times New Roman" Font-Size="Small">
        <FieldHeaderStyle Width="80px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" InsertVisible="False" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="EdgeName" HeaderText="EDGE:" SortExpression="EdgeName" />
            <asp:BoundField DataField="WebPrice" HeaderText="EDGE PRICE:" ReadOnly="True" SortExpression="WebPrice" DataFormatString="{0:C}" />
            <asp:BoundField DataField="LinearFeet" HeaderText="LINEAR FEET OF EDGE:" SortExpression="LinearFeet" />
            <asp:BoundField DataField="Backsplash" HeaderText="BACKSPLASH:" SortExpression="Backsplash" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, EdgeName, WebPrice, LinearFeet, Backsplash FROM SummaryEdgeBacksplashQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />

<h3>Sink Detail</h3>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="490px" Font-Names="Times New Roman" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteSinkID" HeaderText="OnlineQuoteSinkID" InsertVisible="False" SortExpression="OnlineQuoteSinkID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="CatalogID" HeaderText="CATALOG" SortExpression="CatalogID" >
                <HeaderStyle  HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SinkName" HeaderText="SINK" SortExpression="SinkName" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" >
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" DataFormatString="{0:C}" >
                </asp:BoundField>
                <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" DataFormatString="{0:C}" >
                </asp:BoundField>
            </Columns>
        </asp:GridView>
<br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteSinkID], [OnlineQuoteID], [CatalogID], [SinkName], [Quantity], [Price], [Total] FROM [SummarySinksQry] WHERE ([OnlineQuoteID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


<h3>Service Detail</h3>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" Width="490px" Font-Names="Times New Roman" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteServiceID" HeaderText="OnlineQuoteServiceID" InsertVisible="False" SortExpression="OnlineQuoteServiceID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="ServiceName" HeaderText="SERVICE" SortExpression="ServiceName">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ServicePrice" HeaderText="PRICE" SortExpression="ServicePrice" DataFormatString="{0:C}">
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                No services availed.
            </EmptyDataTemplate>
        </asp:GridView>
<br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteServiceID], [OnlineQuoteID], [ServiceName], [ServicePrice] FROM [SummaryServicesQry] WHERE ([OnlineQuoteID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>        


<h3>Notes:</h3>
 <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource6" Width="490px" Font-Names="Times New Roman" Font-Size="Small">
            <EditItemTemplate>
                You may tell us additional detail/specs for this project:
                <asp:TextBox ID="NotesTextBox" runat="server" Height="100px" Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="570px" BorderColor="Maroon" BorderStyle="Solid" BorderWidth="1px" CssClass="textarea_box" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save Notes" />
&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Notes:
                <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
                <br />
                &nbsp;&nbsp;
            </ItemTemplate>
        </asp:FormView>
<br />


        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [Notes]) VALUES (?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteID], [Notes] FROM [tblOnlineQuotes] WHERE ([OnlineQuoteID] = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [Notes] = ? WHERE [OnlineQuoteID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>       





    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteStoneID], [OnlineQuoteID], [SlabColorName], [SF], [PublishedPrice], [Total] FROM [SummaryStoneQry] WHERE ([OnlineQuoteID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerName, Address, Address2, Phone, Email FROM SummaryInfoQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


    </form>
</body>
</html>
