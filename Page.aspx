<%@ Page Title="" Language="VB" EnableSessionState="True" MasterPageFile="~/MainChild.master"
    AutoEventWireup="false" CodeFile="Page.aspx.vb" Inherits="About" %>

<%@ Register Src="userControls/HomeRightSide.ascx" TagName="HomeRightSide" TagPrefix="uc1" %>
<%@ Register Src="userControls/Downloads.ascx" TagName="Downloads" TagPrefix="ucDownloads" %>
<%@ Register Src="userControls/Html.ascx" TagName="Html" TagPrefix="ucHtml" %>
<%@ Register Src="userControls/ImageGallery.ascx" TagName="ImageGallery" TagPrefix="ucImgGallery" %>
<%@ Register Src="userControls/News.ascx" TagName="News" TagPrefix="ucNews" %>
<%@ Register Src="userControls/Pdf.ascx" TagName="Pdf" TagPrefix="ucPdf" %>
<%@ Register Src="userControls/Tenders.ascx" TagName="Tenders" TagPrefix="ucTender" %>
<%@ Register Src="userControls/VideoGallery.ascx" TagName="VideoGallery" TagPrefix="ucVideoGallery" %>
<%@ Register Src="userControls/Grievances.ascx" TagName="Grievances" TagPrefix="ucGrievances" %>
<%@ Register Src="userControls/Feedback.ascx" TagName="Feedback" TagPrefix="ucFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="ltrlMeta" runat="server" />
    <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
    <script type="text/javascript">        stLight.options({ publisher: "ad15b53a-6274-4062-a4c4-6f63a897fd15", doNotHash: false, doNotCopy: false, hashAddressBar: false });</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liCrumb" runat="server">Customer Registration</span></li>
    </ul>
    <br />
    <h1 id="h2Header" runat="server">Customer Registration</h1>
    <!-- Bread Crumb -->

    <div style="min-height:350px">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="productTable">
        <tr>
            <td>
                <ucDownloads:Downloads ID="ucDownload" runat="server" Visible="false" />
                <ucHtml:Html ID="ucHtml" runat="server" Visible="false" />
                <ucImgGallery:ImageGallery ID="ucImgGallery" runat="server" Visible="false" />
                <ucNews:News ID="ucNews" runat="server" Visible="false" />
                <ucPdf:Pdf ID="ucPdf" runat="server" Visible="false" />
                <ucTender:Tenders ID="ucTender" runat="server" Visible="false" />
                <ucVideoGallery:VideoGallery ID="ucVideoGallery" runat="server" Visible="false" />
                <ucGrievances:Grievances ID="ucGrievances" runat="server" Visible="false" />
                <ucFeedback:Feedback ID="ucFeedback" runat="server" Visible="false" />
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <uc1:HomeRightSide ID="HomeRightSide1" Visible="false" runat="server" />
            </td>
        </tr>
    </table>
    </div>

</asp:Content>
