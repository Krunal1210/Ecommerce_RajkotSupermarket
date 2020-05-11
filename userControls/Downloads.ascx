<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Downloads.ascx.vb" Inherits="userControls_Downloads" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <div class="brad_crum">
                <a href="<%= App.Value("siteUrl") %>">Home</a> <span>
                    <asp:Literal ID="ltrlTitle1" runat="server" Text="Downloads"></asp:Literal>
                </span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <h1 class="title_02">
                <asp:Literal ID="ltrlTitle2" Visible="false" runat="server" Text="Downloads" /></h1>
        </td>
    </tr>
    <tr>
        <td style="padding-top: 10px;" class="gen_text">
            <div id="tdContent" runat="server"  style="width: 932px;  min-height: 312px; overflow: auto">
                <asp:Repeater ID="rptTender" runat="server">
                    <HeaderTemplate>
                        <table style="width: 100%; border: solid 1px black; margin-top: 20px;">
                            <tr>
                                <td style="border: solid 1px black; padding: 5px;">
                                    <b style="font-size: 14px;">SR No.</b>
                                </td>
                                <td style="border: solid 1px black; padding: 5px;">
                                    <b style="font-size: 14px;">Form Name</b>
                                </td>
                                <td style="border: solid 1px black; padding: 5px;">
                                    <b style="font-size: 14px;">Form No</b>
                                </td>
                                <td style="border: solid 1px black; padding: 5px;">
                                    <b style="font-size: 14px;">View</b>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="border: solid 1px black; padding: 5px;">
                                <%#  Container.ItemIndex+ 1 %>
                            </td>
                            <td style="border: solid 1px black; padding: 5px;">
                                <%# Eval("strFormName")%>
                            </td>
                            <td style="border: solid 1px black; padding: 5px;">
                                <%# Eval("strFormNo")%>
                            </td>
                            <td style="border: solid 1px black; padding: 5px;">
                                <a href='<%# app.Value("siteUrl") %>DownloadDetail/<%# Eval("strFormUrl")%>'>View</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </td>
    </tr>
</table>
