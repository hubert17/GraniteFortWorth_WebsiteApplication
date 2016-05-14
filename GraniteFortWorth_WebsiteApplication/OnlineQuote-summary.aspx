<%@ Page Title="QUOTE SUMMARY" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-summary.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_summary" MaintainScrollPositionOnPostback="true" ClientIDMode="AutoID"  %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta name="robots" content="noindex" />

    <style>
        .one-column-emphasis
        {
	        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	        font-size: 12px;
	        margin: 0px;
	        width: 600px;
	        text-align: left;
	        border-collapse: collapse;
            padding-left:20px;
        }
        .one-column-emphasis th
        {
	        font-size: 14px;
	        font-weight: normal;
	        padding: 15px 0px;
	        color: #039;
            text-align:left;
        }
        .one-column-emphasis td
        {
	        padding: 5px 0px;
	        color: #669;
	        border-top: 1px solid #e8edff;
        }
        .oce-first
        {
	        background: #d0dafd;
	        border-right: 10px solid transparent;
	        border-left: 10px solid transparent;
        }
        .one-column-emphasis tr:hover td
        {
	        color: #339;
	        background: #eff2ff;
        }


         .hor-minimalist-b
    {
	    font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	    font-size: 12px;
	    background: #fff;
	    margin: 10px;
	    width: 360px;
	    border-collapse: collapse;
	    text-align: left;
    }
    .hor-minimalist-b th
    {
	    font-size: 14px;
	    font-weight: normal;
	    color: #039;
	    padding: 0px 0px;
	    border-bottom: 2px solid #6678b1;
        text-align:left;
    }
    .hor-minimalist-b td
    {
	    border-bottom: 1px solid #ccc;
	    color: #669;
	    padding: 2px 0px;
        text-align:left;
    }
    .hor-minimalist-b tbody tr:hover td
    {
	    color: #009;
        background: #eff2ff;
    }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<h2>Quote Summary </h2>
    <p>Please review your inputs for this Quote. You can click the Back button if you wish to do corrections.</p>
<div class="wrapper">

<div class="wrapper">
    <div class="hcform1" style="width:348px;height:225px;">
<div class="hcformtitle" style="width:348px;">Customer Information</div>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="325px" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" CssClass="hor-minimalist-b">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <FieldHeaderStyle Width="160px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" InsertVisible="False" ReadOnly="True" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="CustomerName" HeaderText="NAME:" ReadOnly="True" SortExpression="CustomerName" >
            <HeaderStyle Width="70px" />
            <ItemStyle Width="290px" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="ADDRESS:" SortExpression="Address" />
            <asp:BoundField DataField="Address2" ReadOnly="True" SortExpression="Address2" />
            <asp:BoundField DataField="Phone" HeaderText="PHONE:" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="E-MAIL:" SortExpression="Email" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
</div>

    <div class="hcform1" style="width:248px;height:225px;">
<div class="hcformtitle" style="width:248px;">Edge Detail</div>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="225px" AutoGenerateRows="False" CssClass="hor-minimalist-b" DataSourceID="SqlDataSource3">
        <FieldHeaderStyle Width="160px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" InsertVisible="False" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="EdgeName" HeaderText="EDGE:" SortExpression="EdgeName" >
            <HeaderStyle Width="70px" />
            <ItemStyle Width="290px" />
            </asp:BoundField>
            <asp:BoundField DataField="WebPrice" HeaderText="PRICE:" ReadOnly="True" SortExpression="WebPrice" DataFormatString="{0:C}" />
            <asp:BoundField DataField="LinearFeet" HeaderText="LINEAR FEET:" SortExpression="LinearFeet" Visible="False" >
            <HeaderStyle Width="80px" />
            </asp:BoundField>
            <asp:TemplateField></asp:TemplateField>
            <asp:BoundField DataField="Backsplash" HeaderText="BACKSPLASH:" SortExpression="Backsplash" Visible="False" />
            <asp:TemplateField></asp:TemplateField>
            <asp:TemplateField></asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, EdgeName, WebPrice, LinearFeet, Backsplash FROM SummaryEdgeBacksplashQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
</div>


<div class="hcform1" style="width:600px; float:left;">
<div class="hcformtitle" style="width:600px;">Fabrication and Install Detail</div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" Width="580px" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="OnlineQuoteStoneID" HeaderText="OnlineQuoteStoneID" InsertVisible="False" SortExpression="OnlineQuoteStoneID" Visible="False" />
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="SlabColorName" HeaderText="STONE" ReadOnly="True" SortExpression="SlabColorName" />
            <asp:BoundField DataField="SF" HeaderText="SF" ReadOnly="True" SortExpression="SF" DataFormatString="{0:0.##}" />
            <asp:BoundField DataField="SFplus10" HeaderText="SF + 10%" ReadOnly="True" SortExpression="SFplus10" DataFormatString="{0:0.##}" />
            <asp:BoundField DataField="WebsiteFabPrice" HeaderText="PRICE" ReadOnly="True" SortExpression="PublishedPrice" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteStoneID, OnlineQuoteID, SlabColorName, SF, SFplus10, Total, ccur(iif(isnull(FabPricePrintOveride), WebsiteFabPrice, FabPricePrintOveride)) AS WebsiteFabPrice FROM SummaryStoneQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>




<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Sink Detail</div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource4" Width="580px">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteSinkID" HeaderText="OnlineQuoteSinkID" InsertVisible="False" SortExpression="OnlineQuoteSinkID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="CatalogID" HeaderText="CATALOG" SortExpression="CatalogID" >
                <HeaderStyle Width="80px" />
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="SinkName" HeaderText="SINK" SortExpression="SinkName" >
                <ItemStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity"  />
                <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" DataFormatString="{0:C}" />
            </Columns>
                        <EmptyDataTemplate>
                No sinks availed.
            </EmptyDataTemplate>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteSinkID], [OnlineQuoteID], [CatalogID], [SinkName], [Quantity], [Price], [Total] FROM [SummarySinksQry] WHERE ([OnlineQuoteID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>

<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Service Detail</div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource5" Width="580px">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteServiceID" HeaderText="OnlineQuoteServiceID" InsertVisible="False" SortExpression="OnlineQuoteServiceID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="ServiceName" HeaderText="SERVICES" SortExpression="ServiceName" />
                <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" ReadOnly="True" DataFormatString="{0:0.##}" />
                <asp:BoundField DataField="ServicePrice" HeaderText="Price" SortExpression="ServicePrice" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" DataFormatString="{0:C}" />
            </Columns>
            <EmptyDataTemplate>
                No services availed.
            </EmptyDataTemplate>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteServiceID, OnlineQuoteID, ServiceName, ServicePrice, IIF(ISNULL(Quantity), 1, Quantity) AS QTY, QTY * ServicePrice AS Total FROM SummaryServicesQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>        
</div>
</div>

<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Note</div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px;">
 <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource6" DefaultMode="Edit" Width="580px">
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
                OnlineQuoteID:
                <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                <br />
                Notes:
                <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
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

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <div style="width:600px;">
            <div style="float:right; margin-right:10px;">  
                <asp:Label Visible="true" ID="lblResult" runat="server" Text="" />        
          <recaptcha:RecaptchaControl
              ID="recaptcha"
              runat="server"
              Theme="red"
              PublicKey="6Leqsd4SAAAAAFMddfWi-4VhYRg_mQLw3f6aYkkv"
              PrivateKey="6Leqsd4SAAAAAO4thq8Tm1kWYXBzuJky5Fp40Z2T"
              />                
                </div>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
</div>
    </div>

    <div class="hcform1" style="width:600px;">

<div class="hcbuttons">
                             <asp:LinkButton ID="NextButton" runat="server" CausesValidation="True" Text="CREATE QUOTE" CssClass="hcorangebutton" OnClick="NextButton_Click"  />&nbsp;<asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" Text="Back" CssClass="hcgreybutton"  OnClick="BackButton_Click" OnClientClick="JavaScript: window.history.back(1); return false;"  /></div>
</div>
        
</div>
</div>










    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerName, Address, Address2, Phone, Email FROM SummaryInfoQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>



<asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="2" Visible="False"></asp:Label>



    </form>
</asp:Content>
