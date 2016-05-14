<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QUOTE_DFW-Wholesale-Granite.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.QUOTE_DFW_Wholesale_Granite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DFW JOB QUOTE ESTIMATE</title>

    <meta name="robots" content="noindex" />
    <link rel="stylesheet" href="css/printstyle.css" type="text/css" media="print" />
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />

    <style media="screen">
           html {color: #777 !important;}

           .centerHeader {
               width:600px;
               margin-left:auto;
               margin-right:auto;
               text-align:center;
           }

          .hcform1 {
	        width: 450px;
	        overflow: hidden;
            margin-bottom:30px;
            margin-left:auto;
            margin-right:auto;
            text-align:left;
        }

          .hcformtitle {
              padding-left:10px;
	        line-height: 16px;
	        font-size: 13px;
	        font-weight: bold;
	        width: 430px;
            font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
            text-align:left;
        }


        .one-column-emphasis
        {
            font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
	        font-size: 12px;
	        margin-left: 0px;
	        width: 600px;
	        border-collapse: collapse;
        }
        .one-column-emphasis th
        {
	        font-size: 14px;
	        font-weight:bold;
	        padding-left:5px;
            padding-right:5px;
        }
        .one-column-emphasis td
        {
	        padding-left:5px;
            padding-right:5px;
	        border-top: 1px solid #696969;
        }
        .oce-first
        {
	        border-right: 1px solid transparent;
	        border-left: 1px solid transparent;
        }



         .hor-minimalist-b
    {
            font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;
	    font-size: 12px;
	    margin-left: 10px;
	    width: 360px;
        border-collapse: collapse;
        border-bottom: 1px solid ;
        border-top: 1px solid #696969;
        border-right: 1px solid #696969;
        border-left:1px solid #696969;
    }

    .hor-minimalist-b th
    {
	    font-size: 14px;
	    font-weight: normal;
	    color: #039;
	    padding-left:5px;
        padding-right:5px;
    }
    .hor-minimalist-b td
    {
	    border-bottom: 1px solid #696969;
	    padding-left:5px;
        padding-right:5px;
    }

             .onlyinprint {
            display:none;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">

<div class="centerHeader">

<div class="onlyinscreen">
    <button type="button" id="print-quote">Print Quote</button>
    &nbsp;&nbsp;<asp:Button ID="btnEmail" runat="server" Visible="false" Text="Email Quote" OnClick="btnEmail_Click" OnClientClick='alert(&apos;This may take a few seconds. Please bear with us.&apos;);' />
    <button type="button" id="email-quote">Email Quote</button>
    &nbsp;&nbsp;<asp:Button ID="btnHome" runat="server" Text="Homepage" PostBackUrl="~/Default.aspx" />
    &nbsp;&nbsp;
    <input id="btnRef" type="button" style="display:none;" onclick="window.location.href = '/admin/References.aspx'" value="References" />

</div>

<div class="onlyinprint">
<h2 style="margin-bottom:0px;">WHOLESALE GRANITE DFW</h2>
        <p style="margin-top:0px;"><em>10011 Harmon Road, Unit 101, Fort Worth Texas 76177
            <br />
            (817) 300-3298</em></p>
   </div> 

    <h2 style="margin-bottom:0px;font-family:Impact,  Haettenschweiler,  'Arial Narrow Bold',  sans-serif;font-weight:normal;">Online Job Quote</h2><br />



<div class="wrapper">


<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Customer Information</div>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="580px" AutoGenerateRows="False" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource1" CssClass="hor-minimalist-b" GridLines="None">
        <FieldHeaderStyle Width="160px" />
        <Fields>
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="ONLINE QUOTE#" InsertVisible="False" ReadOnly="True" SortExpression="OnlineQuoteID" />
            <asp:BoundField DataField="CustomerName" HeaderText="NAME:" ReadOnly="True" SortExpression="CustomerName" />
            <asp:BoundField DataField="Address" HeaderText="ADDRESS:" SortExpression="Address" />
            <asp:BoundField DataField="Address2" ReadOnly="True" SortExpression="Address2" />
            <asp:BoundField DataField="Phone" HeaderText="PHONE:" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="E-MAIL:" SortExpression="Email" />
        </Fields>
    </asp:DetailsView>
</div>

    <div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Stone Slab </div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource2" Width="580px" OnRowDataBound="GridView4_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="OnlineQuoteStoneID" HeaderText="OnlineQuoteStoneID" InsertVisible="False" SortExpression="OnlineQuoteStoneID" Visible="False" />
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="SlabColorName" HeaderText="STONE" ReadOnly="True" SortExpression="SlabColorName">
            <HeaderStyle HorizontalAlign="Left" Width="280px" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="QTY" ReadOnly="True" SortExpression="Quantity" DataFormatString="{0:0.#}">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="SlabPrice" DataFormatString="{0:C}" FooterText="SUBTOTAL:" HeaderText="PRICE" ReadOnly="True" SortExpression="SlabPrice">
            <FooterStyle HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total">
            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [OnlineQuoteStoneID], [OnlineQuoteID], [SlabColorName], [SlabPrice], [Quantity], [Total] FROM [SummarySlabQry] WHERE ([OnlineQuoteID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>

<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Install and Fabrication </div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource3" Width="580px" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="OnlineQuoteStoneID" HeaderText="OnlineQuoteStoneID" InsertVisible="False" SortExpression="OnlineQuoteStoneID" Visible="False" />
            <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
            <asp:BoundField DataField="SlabColorName" HeaderText="STONE" ReadOnly="True" SortExpression="SlabColorName" >
            <HeaderStyle HorizontalAlign="Left" Width="280px" />
            <ItemStyle HorizontalAlign="Left" Width="280px" />
            </asp:BoundField>
            <asp:BoundField DataField="SF" HeaderText="QTY" SortExpression="SF" DataFormatString="{0:0.#}" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="SFplus10" HeaderText="QTY_old" ReadOnly="True" SortExpression="SFplus10" DataFormatString="{0:0.#}" Visible="False" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="WebsiteFabPrice" HeaderText="PRICE" ReadOnly="True" SortExpression="WebsiteFabPrice" DataFormatString="{0:C}" FooterText="SUBTOTAL:" >
            <FooterStyle HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total">
            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
            <HeaderStyle HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteStoneID, OnlineQuoteID, SlabColorName, SF, CCur(WebsiteFabPrice) AS WebsiteFabPrice, SFplus10, TotalG AS TOTAL FROM SummaryStoneQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>




<div class="hcform1" style="width:600px;">
<div class="hcformtitle" style="width:600px;">Sinks </div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource4" Width="580px" OnRowDataBound="GridView2_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteSinkID" HeaderText="OnlineQuoteSinkID" InsertVisible="False" SortExpression="OnlineQuoteSinkID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="CatalogID" HeaderText="CATALOG" SortExpression="CatalogID" >
                <HeaderStyle Width="80px" HorizontalAlign="Left" />
                <ItemStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SinkName" HeaderText="SINK" SortExpression="SinkName" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="300px" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" DataFormatString="{0:C}" FooterText="SUBTOTAL:" >
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total" DataFormatString="{0:C}" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
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
<div class="hcformtitle" style="width:600px;">Services </div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="one-column-emphasis" DataSourceID="SqlDataSource5" Width="580px" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="OnlineQuoteServiceID" HeaderText="OnlineQuoteServiceID" InsertVisible="False" SortExpression="OnlineQuoteServiceID" Visible="False" />
                <asp:BoundField DataField="OnlineQuoteID" HeaderText="OnlineQuoteID" SortExpression="OnlineQuoteID" Visible="False" />
                <asp:BoundField DataField="ServiceName" HeaderText="SERVICE" SortExpression="ServiceName">
                <HeaderStyle HorizontalAlign="Left" Width="280px" />
                <ItemStyle HorizontalAlign="Left" Width="280px" />
                </asp:BoundField>
                <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" ReadOnly="True" DataFormatString="{0:0.#}" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ServicePrice" DataFormatString="{0:C}" HeaderText="PRICE" SortExpression="ServicePrice" FooterText="SUBTOTAL:">
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="TOTAL" ReadOnly="True" SortExpression="Total">
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                No services availed.
            </EmptyDataTemplate>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteServiceID, OnlineQuoteID, ServiceName, ServicePrice, IIF(ISNULL(Quantity), 1, Quantity) AS QTY, ServicePrice * QTY AS Total FROM SummaryServicesQry WHERE (OnlineQuoteID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="OnlineQuoteID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>        
</div>
</div>

<div class="hcform1" style="width:600px;margin-top:10px;">
<div class="hcformtitle" style="width:600px;">Notes:</div>
    <div style="margin-right:auto;margin-left:auto; margin-bottom:5px; width:580px;">


 <asp:FormView ID="FormView1" runat="server" DataKeyNames="OnlineQuoteID" DataSourceID="SqlDataSource6" Width="580px" Font-Names="'Droid Sans','Lucida Sans Unicode','Lucida Grande',Sans-Serif" Font-Size="Small">
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
                <div style="float:left;width:300px;">
                <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' Width="300px" />
                <br />
                &nbsp;&nbsp;</div>

                <div style="float:right;font-family: 'Droid Sans', 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;font-size:medium;text-align:right;width:250px;">
                    <% DisplayTotalCost(); %>
                </div>
            </ItemTemplate>
        </asp:FormView>

<div>

</div>
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


</div>
        
</div>
</div>





    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DFWwebsiteDB.accdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT OnlineQuoteID, CustomerName, Address, Address2, Phone, Email FROM SummaryInfoQry WHERE (OnlineQuoteID = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OnlineQuoteIDLabel" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


        <div class="onlyinprint" style="text-align:left;font-family:Arial, 'DejaVu Sans', 'Liberation Sans', Freesans, sans-serif;font-size:x-small;margin-left:10px;">
            <p><em>Granite is a natural product and varies in color and patterns. We do not do plumbing, electrical or carpentry work. This quote  includes cost of stone. If you elect to keep existing tile we are not responsible for damage to existing tile or fit to finished granite countertops.</em></p>
        </div>


</div>



<asp:Label ID="OnlineQuoteIDLabel" runat="server" Text="2" Visible="False"></asp:Label>


    </form>

    <script>
        var ROOT = '<%= Request.Url.Scheme + System.Uri.SchemeDelimiter + Request.Url.Host + (Request.Url.IsDefaultPort ? "" : ":" + Request.Url.Port) %>' + '/mobile';
    </script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

    <script>
        $("#print-quote").click(function () {
            $("#print-quote").html('Loading printable PDF...');
            window.location.href = ROOT + '/OnlineQuote/print/<%= Request.QueryString["OnlineQuoteID"] %>'
        });

        $("#email-quote").click(function () {
            $("#email-quote").html('Sending quote...');

            $.ajax({
                url: ROOT + "/OnlineQuote/EmailQuote",
                type: "GET",
                data: "id=" + '<%= Request.QueryString["OnlineQuoteID"] %>'
            })
            .done(function (data) {
                if (data == 'err') {
                    alert('Oops! We encountered a problem sending your quote. Please refresh this page and try again.');
                    $('#email-quote').prop('disabled', false);
                }
                else {
                    $("#email-quote").html('Email Quote');
                    alert("Quote successfully sent. Kindly check your e-mail. If you don't see DFW Quote message in your inbox, consider checking you spam folder and mark us NOT SPAM.")
                    $('#email-quote').prop('disabled', true);
                }
            })
            .fail(function (xhr, ajaxOptions, thrownError) {
                console && console.log("request failed");
            });
        });

    </script>


</body>
</html>
