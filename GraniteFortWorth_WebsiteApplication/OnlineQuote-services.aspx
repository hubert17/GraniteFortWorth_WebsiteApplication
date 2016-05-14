<%@ Page Title="OPTIONAL SERVICES" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-services.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_services" %>
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



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
    <h2>Online Quote System </h2>
        <div class="wrapper">

<div class="wrapper">
    &nbsp;
<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">STEP 5: [Optional] Check the Services you wish to include in this quote.</div>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
DataKeyNames="ServicesID,ServiceType" EnablePersistedSelection="True" PagerSettings-Mode="Numeric" DataSourceID="SqlDataSource1" CssClass="one-column-emphasis">
<Columns>
    <asp:TemplateField>
<ItemTemplate>
<asp:CheckBox ID="chkSelect" runat="server" />
</ItemTemplate>
    <HeaderStyle Width="20%" />
    <ItemStyle HorizontalAlign="Center" />
</asp:TemplateField>
<asp:BoundField HeaderText="ServicesID" DataField="ServicesID" InsertVisible="False" ReadOnly="True" SortExpression="ServicesID" Visible="False" />
<asp:BoundField HeaderText="Service" DataField="ServiceName" SortExpression="ServiceName" >
    </asp:BoundField>
<asp:BoundField HeaderText="Price" DataField="ServicePrice" SortExpression="ServicePrice" DataFormatString="{0:C}" >
    </asp:BoundField>
    <asp:BoundField DataField="ServiceType" HeaderText="ServiceType" SortExpression="ServiceType" Visible="False" />
</Columns>
</asp:GridView>

    <div class="hcbuttons">
                             <asp:LinkButton ID="NextButton" runat="server" CausesValidation="True" Text="Next" CssClass="hcorangebutton" OnClick="NextButton_Click"  />&nbsp;<asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" Text="Back" CssClass="hcgreybutton"  OnClick="BackButton_Click" OnClientClick="JavaScript: window.history.back(1); return false;"  /></div>
</div>
</div>

       </div>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [ServicesID], [ServiceName], [ServicePrice], [ServiceType] FROM [tblServices] WHERE (([AdminOnly] = ?) AND ([Inactive] = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="AdminOnly" Type="Boolean" />
                <asp:Parameter DefaultValue="False" Name="Inactive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
<asp:Label ID="OnlineQuoteServicesIDLabel" runat="server" Text="Label" Visible="False"></asp:Label><asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</asp:Content>
