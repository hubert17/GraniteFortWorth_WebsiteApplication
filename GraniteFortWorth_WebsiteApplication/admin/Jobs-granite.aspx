<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jobs-granite.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.admin.Jobs_granite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style_iframe.css" />

<style>
    * {
        border: none;
    }
	.measure_left-rail {
		width:765px;
		float:left;
	}

    .measure-minimalist-b
    {
	    font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
	    font-size: 1em;
	    background: #fff;
	    margin: 10px;
	    width: 768px;
	    border-collapse: collapse;
	    text-align: left;        
    }
    .measure-minimalist-b th
    {
	    font-size: 13px;
	    font-weight: normal;
	    color: #039;
	    padding: 0px 7px;
	    border-bottom: 2px solid #6678b1;
        text-align:left;
        background: #eff2ff;
    }
    .measure-minimalist-b td
    {
	    border-bottom: 1px solid #ccc;
	    color: #669;
	    padding: 0px 7px;
        text-align:left;
        height: 25px;
    }
    .measure-minimalist-b tbody tr:hover td
    {
	    color: #009;
        background: #eff2ff;
    }

     td span {
        color: #009;
        color: #333;
    }

    .auto-style1 {
        height: 25px;
    }

    .pager-granite {
        margin-left:10px;
        padding-left:10px;
    }


</style>


</head>
<body style="margin:0px">
    <form id="form1" runat="server">
    <div style="border: 1px solid #ccc;width:99%;">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource0" Width="768px" AllowPaging="True" DataKeyNames="OnlineQuoteStoneID" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" OnItemDeleting="FormView1_ItemDeleting" OnItemInserting="FormView1_ItemInserting">
            <EditItemTemplate>
                <table class="measure-minimalist-b">
                    <thead>
                    <tr>
                        <th>Granite</th>
                        <th>&nbsp;</th>
                        <th>Length</th>
                        <th>Width</th>
                        <th>State Tax</th>
                        <th>Surcharge</th>
                        <th>NSlab</th>
                    </tr>
                    </thead>

                    <tr>
                        <td colspan="2">
                            <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SlabColorNamePrice" DataValueField="SlabColorID" SelectedValue='<%# Bind("SlabColorID") %>'  AutoPostBack="True" CausesValidation="True" Width="200px" OnSelectedIndexChanged="SlabColorIDDropDownList_SelectedIndexChanged">
                                       </asp:DropDownList></div><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SlabColorID], [SlabColorNamePrice] FROM [SlabColorNamePriceQry]"></asp:SqlDataSource>                         
				           
                        </td>
                        <td>
                            <asp:TextBox ID="SizeLengthTextBox" runat="server" Text='<%# Bind("SizeLength") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="SizeWidthTextBox" runat="server" Text='<%# Bind("SizeWidth") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="StateTaxTextBox" runat="server" Text='<%# Bind("StateTax") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="SurchargeTextBox" runat="server" Text='<%# Bind("Surcharge") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="NSlabTextBox" runat="server" Text='<%# Bind("NSlab") %>' Width="90px" ToolTip="Leave this blank to accept the default CEIL(SquareFeet) computation." />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">Published Price:</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="PublishedPriceTextBox" runat="server" Text='<%# Bind("PublishedPrice") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px" class="auto-style1">Price: </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">Square Feet:</td>
                        <td style="margin-left: 40px" class="auto-style1"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Ext. Amount: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">Total Price PSF: </td>
                        <td>&nbsp;</td>
                        <td>Slab Price: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Total Slabs: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">Total: </td>
                        <td>&nbsp;</td>
                        <td>Sub Total: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Fab. Price: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">
                            SF:
                        </td>
                        <td>
                            <asp:TextBox ID="SquareFeetQtyTextBox" runat="server" Text='<%# Bind("SquareFeetQty") %>' Width="100px" />
                        </td>
                        <td>SF+<asp:TextBox ID="SFplusTextBox" runat="server" Text='<%# Bind("SFplus") %>' Width="30px" />: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Subtotal Fab.: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">
                            Fab Price w/ Gr:
                        </td>
                        <td>
                            <asp:TextBox ID="FabPricePrintOverideTextBox" runat="server" Text='<%# Bind("FabPricePrintOveride") %>' Width="100px" />
                        </td>
                        <td>TotFabw/Gr:</td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                </table>
                                
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
                &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                &nbsp;
<asp:Label ID="OnlineQuoteStoneIDLabel" runat="server" Text='<%# Eval("OnlineQuoteStoneID") %>' Visible="false" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="   Add New" />
            </EmptyDataTemplate>
            <InsertItemTemplate>
               <table class="measure-minimalist-b">
                    <thead>
                    <tr>
                        <th>Granite</th>
                        <th>&nbsp;</th>
                        <th>Length</th>
                        <th>Width</th>
                        <th>State Tax</th>
                        <th>Surcharge</th>
                        <th>NSlab</th>
                    </tr>
                    </thead>

                    <tr>
                        <td colspan="2">
                            <asp:DropDownList ID="SlabColorIDDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="SlabColorNamePrice" DataValueField="SlabColorID" SelectedValue='<%# Bind("SlabColorID") %>'  AppendDataBoundItems="true" AutoPostBack="True" CausesValidation="True" Width="200px" OnSelectedIndexChanged="SlabColorIDDropDownList_SelectedIndexChanged">
                                         <asp:ListItem Value="-1">
                                           -- Choose a Stone --
                                        </asp:ListItem></asp:DropDownList></div><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [SlabColorID], [SlabColorNamePrice] FROM [SlabColorNamePriceQry]"></asp:SqlDataSource>                         
				           
                        </td>
                        <td>
                            <asp:TextBox ID="SizeLengthTextBox" runat="server" Text='<%# Bind("SizeLength") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="SizeWidthTextBox" runat="server" Text='<%# Bind("SizeWidth") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="StateTaxTextBox" runat="server" Text='<%# Bind("StateTax") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:TextBox ID="SurchargeTextBox" runat="server" Text='<%# Bind("Surcharge") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:TextBox ID="NSlabTextBox" runat="server" Text='<%# Bind("NSlab") %>' Width="100px" ToolTip="Leave this blank to accept the default CEIL(SquareFeet) computation." />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Published Price:</td>
                        <td>
                            <asp:TextBox ID="PublishedPriceTextBox" runat="server" Text='<%# Bind("PublishedPrice") %>' Width="100px" />
                        </td>
                        <td style="margin-left: 40px">Price: </td>
                        <td>&nbsp;</td>
                        <td>Square Feet:</td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Ext. Amount: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">Total Price PSF: </td>
                        <td>&nbsp;</td>
                        <td>Slab Price: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Total Slabs: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">Total: </td>
                        <td>&nbsp;</td>
                        <td>Sub Total: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Fab. Price: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">
                            SF:
                        </td>
                        <td>
                            <asp:TextBox ID="SquareFeetQtyTextBox" runat="server" Text='<%# Bind("SquareFeetQty") %>' Width="100px" />
                        </td>
                        <td>SF+<asp:TextBox ID="SFplusTextBox" runat="server" Text='<%# Bind("SFplus") %>' Value="8" Width="30px" />: </td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Subtotal Fab.: </td>
                        <td>&nbsp;</td>
                        <td style="margin-left: 40px">
                            Fab Price w/ Gr:
                        </td>
                        <td>
                            <asp:TextBox ID="FabPricePrintOverideTextBox" runat="server" Text='<%# Bind("FabPricePrintOveride") %>' Width="100px" />
                        </td>
                        <td>TotFabw/Gr:</td>
                        <td style="margin-left: 40px">&nbsp;</td>
                    </tr>
                </table>

                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />


            </InsertItemTemplate>
            <ItemTemplate>
                <table class="measure-minimalist-b">
                    <thead>
                    <tr>
                        <th>Granite</th>
                        <th>&nbsp;</th>
                        <th>Length</th>
                        <th>Width</th>
                        <th>State Tax</th>
                        <th>Surcharge</th>
                        <th>NSlab</th>
                    </tr>
                    </thead>

                    <tr>
                        <td colspan="2">
                            </div>
                            <asp:Label ID="SlabColorNamePriceLabel" runat="server" Font-Bold="True" Text='<%# Bind("SlabColorNamePrice") %>' />
				           
                        </td>
                        <td>
                            <asp:Label ID="SizeLengthLabel" runat="server" Text='<%# Bind("SizeLength") %>' />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SizeWidthLabel" runat="server" Text='<%# Bind("SizeWidth") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StateTaxLabel" runat="server" Text='<%# Bind("StateTax", "{0:#0.##%}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SurchargeLabel" runat="server" Text='<%# Bind("Surcharge", "{0:#0.##%}") %>' />
                        </td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="NSlabLabel" runat="server" Text='<%# Bind("NSlabSF") %>' ToolTip="Leave this blank to accept the default CEIL(SquareFeet) computation."  />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Published Price:</td>
                        <td>
                            <asp:Label ID="PublishedPriceLabel" runat="server" Text='<%# Bind("PublishedPrice", "{0:C}") %>' />
                        </td>
                        <td style="margin-left: 40px">Price: </td>
                        <td>
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price", "{0:C}") %>' />
                        </td>
                        <td>Square Feet:</td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SquareFeetLabel" runat="server" Text='<%# Bind("SquareFeet", "{0:#0.0#}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Ext. Amount: </td>
                        <td>
                            <asp:Label ID="ExtAmtLabel" runat="server" Text='<%# Bind("ExtAmt", "{0:C}") %>' />
                        </td>
                        <td style="margin-left: 40px">Total Price PSF: </td>
                        <td>
                            <asp:Label ID="TotPricePSFLabel" runat="server" Text='<%# Bind("TotPricePSF", "{0:C}") %>' />
                        </td>
                        <td>Slab Price: </td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SlabPriceLabel" runat="server" Text='<%# Bind("SlabPrice", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Total Slabs: </td>
                        <td>
                            <asp:Label ID="TotSlabsLabel" runat="server" Text='<%# Bind("TotSlabs", "{0:C}") %>' />
                        </td>
                        <td style="margin-left: 40px">Total: </td>
                        <td>
                            <asp:Label ID="TotalLabel" runat="server" Text='<%# Bind("Total", "{0:C}") %>' />
                        </td>
                        <td>Sub Total: </td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SubtotLabel" runat="server" Text='<%# Bind("Subtot", "{0:C}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Fab. Price: </td>
                        <td>
                            <asp:Label ID="FabPriceLabel" runat="server" Text='<%# Bind("FabPrice", "{0:C}") %>' />
                        </td>
                        <td style="margin-left: 40px">
                            SF:
                        </td>
                        <td>
                            <asp:Label ID="SFLabel" runat="server" Text='<%# Bind("SF", "{0:#0.0#}") %>' />
                        </td>
                        <td>SF+<%# Eval("SFplus") %>: </td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SFplus10Label" runat="server" Text='<%# Bind("SFplus10", "{0:#0.0#}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>Subtotal Fab.: </td>
                        <td>
                            <asp:Label ID="SubtotFabLabel" runat="server" Text='<%# Bind("SubtotFab", "{0:C}") %>' />
                        </td>
                        <td style="margin-left: 40px">
                            Fab Price w/ Gr:
                        </td>
                        <td>
                            <asp:Label ID="FabPricePrintTextboxLabel" runat="server" Text='<%# Bind("FabPricePrintTextbox", "{0:#0.##}") %>' />
                            &nbsp; [ <asp:Label ID="FabPricePrintOverideLabel" runat="server" Text='<%# Bind("FabPricePrintOveride") %>' />
                            ]</td>
                        <td>TotFabw/Gr:</td>
                        <td style="margin-left: 40px">
                            <asp:Label ID="SubtotFabPrintLabel" runat="server" Text='<%# Bind("SubtotFabPrint", "{0:C}") %>' />
                        </td>
                    </tr>
                </table>
                <div style="float:left;margin-bottom:5px;margin-left:10px;">
                &nbsp;<asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp; <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm(&apos;About to delete. Are you sure?&apos;);' />
                &nbsp; <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" OnClick="NewButton_Click" />
                &nbsp;
                </div>

                <asp:Label ID="OnlineQuoteStoneIDLabel" runat="server" Text='<%# Eval("OnlineQuoteStoneID") %>' Visible="False" />
                <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text='<%# Bind("OnlineQuoteID") %>' Visible="False" />
                <asp:Label ID="SlabColorIDLabel" runat="server" Text='<%# Bind("SlabColorID") %>' Visible="False" />
                <asp:Label ID="SquareFeetQtyLabel" runat="server" Text='<%# Bind("SquareFeetQty") %>' Visible="False" />
                <asp:Label ID="FabPricePrintLabel" runat="server" Text='<%# Bind("FabPricePrint") %>' Visible="False" />

                &nbsp;&nbsp;
            </ItemTemplate>
            <PagerStyle CssClass="pager-granite" />            
        </asp:FormView>    
    </div>
                        
              
                        <asp:SqlDataSource ID="SqlDataSource0" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" DeleteCommand="DELETE FROM [tblOnlineQuoteStone] WHERE [OnlineQuoteStoneID] = ?" InsertCommand="INSERT INTO tblOnlineQuoteStone(OnlineQuoteStoneID, OnlineQuoteID, SlabColorID, SizeLength, SizeWidth, StateTax, Surcharge, NSlab, SquareFeetQty, FabPricePrintOveride, PublishedPrice, SFplus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?/100+1)" ProviderName="System.Data.OleDb" SelectCommand="SELECT GranitePurchasesQry.OnlineQuoteStoneID, GranitePurchasesQry.OnlineQuoteID, GranitePurchasesQry.SlabColorID, GranitePurchasesQry.PublishedPrice, GranitePurchasesQry.SizeLength, GranitePurchasesQry.SizeWidth, GranitePurchasesQry.SquareFeet, GranitePurchasesQry.StateTax, GranitePurchasesQry.Surcharge, GranitePurchasesQry.NSlab, GranitePurchasesQry.SquareFeetQty, GranitePurchasesQry.NSlabSF, GranitePurchasesQry.SF, GranitePurchasesQry.SFplus10, GranitePurchasesQry.Price, GranitePurchasesQry.TotPricePSF, GranitePurchasesQry.SlabPrice, GranitePurchasesQry.Subtot, GranitePurchasesQry.FabPrice, GranitePurchasesQry.FabPricePrintOveride, GranitePurchasesQry.FabPricePrintTextbox, GranitePurchasesQry.FabPricePrint, GranitePurchasesQry.TotSlabs, GranitePurchasesQry.Total, GranitePurchasesQry.SubtotFab, GranitePurchasesQry.SubtotFabPrint, GranitePurchasesQry.ExtAmt, Round((GranitePurchasesQry.SFplus-1)*100) AS SFplus, SlabColorNamePriceQry.SlabColorNamePrice FROM (GranitePurchasesQry INNER JOIN SlabColorNamePriceQry ON GranitePurchasesQry.SlabColorID = SlabColorNamePriceQry.SlabColorID) WHERE (GranitePurchasesQry.OnlineQuoteID = ?)" UpdateCommand="UPDATE tblOnlineQuoteStone SET SlabColorID = ?, PublishedPrice = ?, WOPrice = ?, SizeLength = ?, SizeWidth = ?, StateTax = ?, Surcharge = ?, NSlab = ?, SquareFeetQty = ?, FabPricePrintOveride = ? , SFplus = ?/100+1 WHERE (OnlineQuoteStoneID = ?)">
                            <DeleteParameters>
                    <asp:Parameter Name="OnlineQuoteStoneID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OnlineQuoteStoneID" Type="Int32" />
                    <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
                    <asp:Parameter Name="SlabColorID" Type="Int32" />
                    <asp:Parameter Name="SizeLength" Type="Single" />
                    <asp:Parameter Name="SizeWidth" Type="Single" />
                    <asp:Parameter Name="StateTax" Type="Single" />
                    <asp:Parameter Name="Surcharge" Type="Single" />
                    <asp:Parameter Name="NSlab" Type="Int16" />
                    <asp:Parameter Name="SquareFeetQty" Type="Single" />
                    <asp:Parameter Name="FabPricePrintOveride" Type="Decimal" />
                    <asp:Parameter Name="PublishedPrice" Type="Decimal" />
                    <asp:Parameter Name="SFplus" Type="Single" />
                </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
                            </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SlabColorID" Type="Int32" />
                    <asp:Parameter Name="PublishedPrice" Type="Decimal" />
                    <asp:Parameter Name="WOPrice" Type="Decimal" />
                    <asp:Parameter Name="SizeLength" Type="Single" />
                    <asp:Parameter Name="SizeWidth" Type="Single" />
                    <asp:Parameter Name="StateTax" Type="Single" />
                    <asp:Parameter Name="Surcharge" Type="Single" />
                    <asp:Parameter Name="NSlab" Type="Int16" />
                    <asp:Parameter Name="SquareFeetQty" Type="Single" />
                    <asp:Parameter Name="FabPricePrintOveride" Type="Decimal" />
                    <asp:Parameter Name="SFplus" Type="Single" />
                    <asp:ControlParameter ControlID="FormView1" Name="OnlineQuoteStoneID" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

<div style="float:left;margin-top:10px;font-size:1.1em;margin-left:10px;">
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="OnlineQuoteID" DefaultMode="Edit">
            <EditItemTemplate>
    <asp:CheckBox ID="QuoteWithGraniteCheckBox" runat="server" Checked='<%# Bind("QuoteWithGranite") %>' Text=" Quote Fabrication with Granite" AutoPostBack="True" OnCheckedChanged="QuoteWithGraniteCheckBox_CheckedChanged" />
                                <asp:Label ID="OnlineQuoteIDLabel1" runat="server" Text='<%# Eval("OnlineQuoteID") %>' Visible="false" />
            </EditItemTemplate>
        </asp:FormView>
</div>
                            <div style="text-align:right;padding-right:10px;width:500px;float:right;font-size:1.1em;margin-top:5px;">                                                
                <asp:Label ID="Label2" runat="server" Text="Subtotal: "></asp:Label><asp:TextBox ID="TotalGranite" runat="server" style="text-align:right" BorderColor="Black" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Subtotal Fab: "></asp:Label><asp:TextBox ID="TotalFab" runat="server" style="text-align:right" BorderColor="Black" Width="100px"></asp:TextBox>
            </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, QuoteWithGranite FROM tblOnlineQuotes WHERE (OnlineQuoteID = ?)" UpdateCommand="UPDATE [tblOnlineQuotes] SET [QuoteWithGranite] = ? WHERE [OnlineQuoteID] = ?">
            <SelectParameters>
                <asp:QueryStringParameter Name="?" QueryStringField="OnlineQuoteID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="QuoteWithGranite" Type="Boolean" />
                <asp:Parameter Name="OnlineQuoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="Label" Visible="False"></asp:Label>



        
        
        
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="1px" Visible="False" Width="1px">
            <Fields>
                <asp:BoundField DataField="Surcharge" HeaderText="Surcharge" SortExpression="Surcharge" />
                <asp:BoundField DataField="StateTax" HeaderText="StateTax" SortExpression="StateTax" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [Surcharge], [StateTax] FROM [dfwDefaults] WHERE ([dfwDefaultID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="dfwDefaultID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>



        
        
        
    </form>
</body>
</html>
