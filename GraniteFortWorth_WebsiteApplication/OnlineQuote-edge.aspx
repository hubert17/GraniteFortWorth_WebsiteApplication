<%@ Page Title="Select Edge and Backsplash" Language="C#" MasterPageFile="~/SiteClassic.Master" AutoEventWireup="true" CodeBehind="OnlineQuote-edge.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.OnlineQuote_edge" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="robots" content="noindex" />

    <style type="text/css">  
        .styled-select select {
           background: transparent;
           width: 268px;
           padding: 5px;
           font-size: 14px;
           line-height: 1;
           border: 0;
           border-radius: 0;
           height: 34px;
           -webkit-appearance: none;
         } 
        .styled-select {
           width: 240px;
           height: 34px;
           overflow: hidden;
           background: url(Images/down_arrow_select.jpg) no-repeat right #ddd;
           border: 1px solid #ccc;
         }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
    <h2>Online Quote System </h2>
        <div class="wrapper">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="100%" OnItemUpdated="FormView1_ItemUpdated" OnItemUpdating="FormView1_ItemUpdating" >
                <EditItemTemplate>
                    <div class="hcform1" style="width:100%;">

			            <div class="hcformtitle" style="width:100%;">STEP 2: Edges & Backsplashes <asp:Label ID="OnlineQuoteIDLabel1" runat="server" Visible="false" Text='<%# Eval("OnlineQuoteID") %>' /></div>

			            <div class="hcinput" style="width:95%;height:auto;">
				            <div class="hcinputtext">Edge: </div>
                                <div style="width:800px;padding-left:50px;"><asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("Edge") %>' RepeatDirection="Horizontal" RepeatColumns="4" OnDataBound="RadioButtonList1_DataBound" >
                                    <asp:ListItem Value="-1" >     Select an Edge</asp:ListItem>
                                    </asp:RadioButtonList>
                                     
                                     <asp:Literal ID="SelectStoneRequiredLiteral" runat="server" Visible="false"><span style="color:red;">Please select a countertop edge.<span></asp:Literal>
                                </div>
			            </div>

			            <div class="hcinput" style="visibility:hidden;">
				            <div class="hcinputtext">Linear Feet of Edge: </div>
				            <div class="hcinputcontent">
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LinearFeet") %>' />
				            </div>
			            </div>

			            <div class="hcinput" style="visibility:hidden;">
				            <div class="hcinputtext">Backsplash: </div>
				            <div class="hcinputcontent">
                                <div class="styled-select">
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Backsplash") %>' >
                                     <asp:ListItem Value="-1">-- Choose a Backsplash --</asp:ListItem>  
                                    <asp:ListItem>Owner Provide Tile</asp:ListItem>
                                    <asp:ListItem>Standard 4&quot;</asp:ListItem>
                                    <asp:ListItem>Tile backsplash</asp:ListItem>
                                    <asp:ListItem>Full Height (aprox. 18&quot;)</asp:ListItem>
                                    <asp:ListItem>None</asp:ListItem>
                                </asp:DropDownList>
                                </div>
				            </div>
			            </div>



 

			            <div class="hcbuttons">
                             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Next" CssClass="hcorangebutton" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Update" Text="Back" CssClass="hcgreybutton" OnCommand="UpdateCancelButton_Command" />
			            </div>

		            </div>

                </EditItemTemplate>
                <ItemTemplate>
                    OnlineQuoteID:
                    <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Eval("OnlineQuoteID") %>' />
                    <br />
                    Edge:
                    <asp:Label ID="EdgeLabel" runat="server" Text='<%# Bind("Edge") %>' />
                    <br />
                    LinearFeet:
                    <asp:Label ID="LinearFeetLabel" runat="server" Text='<%# Bind("LinearFeet") %>' />
                    <br />
                    Backsplash:
                    <asp:Label ID="BacksplashLabel" runat="server" Text='<%# Bind("Backsplash") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuotes] WHERE [OnlineQuoteID] = ?" InsertCommand="INSERT INTO [tblOnlineQuotes] ([OnlineQuoteID], [Edge], [LinearFeet], [Backsplash]) VALUES (?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, Edge, LinearFeet, Backsplash FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [Edge] = ?, [LinearFeet] = ?, [Backsplash] = ? WHERE [OnlineQuoteID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
                    <asp:Parameter Name="Edge" Type="String" />
                    <asp:Parameter Name="LinearFeet" Type="Int32" />
                    <asp:Parameter Name="Backsplash" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="OnlineQuoteIDLabel" DefaultValue="" Name="?" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Edge" Type="String" />
                    <asp:Parameter Name="LinearFeet" Type="Int32" />
                    <asp:Parameter Name="Backsplash" Type="String" />
                    <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
       </div>

<asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="2" Visible="False"></asp:Label>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT EdgeID, EdgeName + ' - ' + WebPrice AS EdgeNamePrice FROM EdgesQry"></asp:SqlDataSource>
    </form>
</asp:Content>


