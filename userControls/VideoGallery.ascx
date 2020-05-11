<%@ Control Language="VB" AutoEventWireup="false" CodeFile="VideoGallery.ascx.vb" Inherits="userControls_VideoGallery" %>

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <div class="brad_crum">
                                            <a href="<%= App.Value("siteUrl") %>">Home</a> <span>
                                                <asp:Literal ID="ltrlTitle1" Visible="false"  runat="server" Text="Video Gallery"></asp:Literal>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <asp:Repeater ID="rptVideoGallery" runat="server">
                                <HeaderTemplate>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <h1 class="title_02">
                                                <%# Eval("strTitle")%>
                                            </h1>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top:30px; padding-left:256px; " >
                                            <%# Eval("strEmbed")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top:30px; text-align:center; " >
                                            <%# Eval("strDesc")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                           <hr style="border:solid 1px #E3E1E2;; margin-bottom:30px;" >
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>