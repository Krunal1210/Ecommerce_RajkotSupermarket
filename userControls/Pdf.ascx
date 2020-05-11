<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Pdf.ascx.vb" Inherits="userControls_Html" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <div class="brad_crum">
                <a href="<%= App.Value("siteUrl") %>">Home</a> <span>
                    <asp:Literal ID="ltrlTitle1" runat="server"></asp:Literal>
                </span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:linkbutton id="lnkDownload" Visible="false" onClick="lnkDownload_Click"  runat="server">If trouble viewing file you can download from here</asp:linkbutton> 
        </td>
    </tr>
    <tr>
        <td>
            <h1 class="title_02">
                <asp:Literal ID="ltrlTitle2" runat="server" Visible="false"  Text="Page Not Found" /></h1>
        </td>
    </tr>
    <tr>
        <td style="padding-top: 10px;" class="gen_text">
            <div id="tdContent" runat="server"  style="width: 932px;  min-height: 312px; overflow: auto">
            </div>
        </td>
    </tr>
</table>
