<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GabsHTML2PDF.aspx.cs" Inherits="GraniteFortWorth_WebsiteApplication.GabsHTML2PDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Installing Aspose.Pdf for .NET</h1>
        
        <h4><a name="Installation-UsingMSIInstaller"></a>Using MSI Installer</h4>

<ol>
	<li>If you have a previous version of Aspose.Pdf for .NET installed, please <a href="/docs/display/pdfnet/Uninstalling+Aspose.Pdf+for+.NET" title="Uninstalling Aspose.Pdf for .NET">uninstall it</a>.</li>
	<li>Visit <a href="http://www.aspose.com/community/files/51/.net-components/aspose.pdf-for-.net/default.aspx" class="external-link" rel="nofollow">Aspose.Pdf for .NET download page</a> and download the latest Aspose.Pdf.msi installer.</li>
	<li>Run the downloaded file and follow the installer instructions.</li>
	<li>To use Aspose.Pdf for .NET in your project, <a href="/docs/display/pdfnet/Reference+Aspose.Pdf+from+a+.NET+project" title="Reference Aspose.Pdf from a .NET project">provide a reference to it</a>.</li>
</ol>


<h4><a name="Installation-UsingDLLOnly"></a>Using DLL Only</h4>

<p>The installer (Aspose.Pdf.msi) includes a default start condition (MsiNetAssemblySupport), namely .NET Framework version 1.1.4322. This start condition verifies that the .NET Framework is installed on the destination computer. If the .NET Framework is not found on the destination computer, the installation is stopped and you receive an error message: </p>

<p>"This setup requires the .NET framework version 1.1.4322. Please install the .NET Framework and run this setup again. The .NET Framework can be obtained from the web. Would you like to do this now ?"</p>

<p>For this reason, we provide another way to use Aspose.Pdf for .NET. </p>

<ol>
	<li>Visit the <a href="http://www.aspose.com/community/files/51/.net-components/aspose.pdf-for-.net/default.aspx" class="external-link" rel="nofollow">Aspose.Pdf .NET download page</a> and download the latest Aspose.Pdf.zip archive.</li>
	<li>Unpack the archive onto your hard drive.</li>
	<li>To use Aspose.Pdf for .NET in your project, <a href="/docs/display/pdfnet/Reference+Aspose.Pdf+from+a+.NET+project" title="Reference Aspose.Pdf from a .NET project">provide a reference to it</a>.</li>
</ol>
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Convert2PDF" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cache This Page" />
    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="QUOTE_DFW-Wholesale-Granite.aspx?OnlineQuoteID=290">HyperLink</asp:HyperLink>
    </form>
</body>
</html>
