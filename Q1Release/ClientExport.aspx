<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientExport.aspx.cs" Inherits="Q1Release.ClientExport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadClientExportManager ID="CertificateExportManager" runat="server" />

    <!-- certificate -->
    <asp:Panel ID="CertificatePanel" runat="server" CssClass="certificate" BackImageUrl="~/Images/cert-background.png" Height="500px" Width="762px">
        <h1>Certificate of Completeion</h1>
        <h2>This certifies that</h2>
        <p>
            <asp:Label ID="UserName" runat="server" Text="User Name"></asp:Label>
        </p>
        <p>Has completed the requirements for</p>
        <h3>
            <asp:Label ID="Requirements" runat="server">What's new in Q1 2015</asp:Label>
        </h3>
        <p>
            On this day <%= DateTime.Now.Day %>,
            of this month <%= DateTime.Now.Month %>,
            of this year <%= DateTime.Now.Year%>
        </p>
        <p class="signature">
            <asp:Label ID="ApprovedBy" runat="server" Text="Approved By"></asp:Label>
        </p>
        <asp:Image ID="CompanyLogo" runat="server" ImageUrl="~/Images/telerik.jpg" Width="150px" />
    </asp:Panel>

    <!-- export buttons -->
    <div class="button-panel">
        <!-- Export to PDF -->
        <telerik:RadButton ID="ExportPdfButton" runat="server"
            CssClass="rbPrimaryButton"
            OnClientClicked="onExportPdf"
            Text="Export to PDF"
            AutoPostBack="False">
        </telerik:RadButton>

        <!-- Export to Image -->
        <telerik:RadButton ID="ExportImageButton" runat="server"
            OnClientClicked="onExportImage"
            Text="Export to Image"
            AutoPostBack="False">
        </telerik:RadButton>
    </div>

    <script>
        var $ = $telerik.$;

        function onExportPdf(sender, args) {
            var exportManager = $find('<%= CertificateExportManager.ClientID %>')
            var htmlElement = $(".certificate");

            // Export
            exportManager.exportPDF(htmlElement);
        }

        function onExportImage(sender, args) {
            var exportManager = $find('<%= CertificateExportManager.ClientID %>')
            var htmlElement = $(".certificate");

            // Export
            exportManager.exportImage(htmlElement);
        }
    </script>
</asp:Content>






































<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        @font-face {
            font-family: 'Rochester';
            font-style: normal;
            font-weight: 400;
            src: local('Rochester'), local('Rochester-Regular'), url(/Fonts/Rochester-Regular.ttf) format('truetype');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215, U+E0FF, U+EFFD, U+F000;
        }

        .certificate h1, .certificate h2, .certificate h3 {
            font-family: 'Rochester', cursive;
        }

        .certificate {
            padding-top: 75px;
            text-align: center;
        }

        .signature {
            border-top: 2px solid black;
            padding-top: 10px;
            width: 300px;
            margin: 40px auto;
            text-align: center;
        }

        .button-panel {
            width: 762px;
            text-align: center;
            padding: 20px 0;
            background-color: #ededed;
        }
    </style>
</asp:Content>
