<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Tenders.ascx.vb" Inherits="userControls_Tenders" %>


  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <div class="brad_crum">
                                            <a href="<%= App.Value("siteUrl") %>">Home</a> <span>
                                                <asp:Literal ID="ltrlTitle1" runat="server" Text="Tender"></asp:Literal>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h1 class="title_02">
                                            <asp:Literal ID="ltrlTitle2" runat="server" Visible="false"  Text="Tender" /></h1>
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
                                                                <b style="font-size: 14px;">Title</b>
                                                            </td>
                                                            <td style="border: solid 1px black; padding: 5px;">
                                                                <b style="font-size: 14px;">Last Date</b>
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
                                                            <%# Eval("strTenderName")%>
                                                        </td>
                                                        <td style="border: solid 1px black; padding: 5px;">
                                                            <%# app.getShortDate( Eval("dateLast"))%>
                                                        </td>
                                                        <td style="border: solid 1px black; padding: 5px;">
                                                            <a href='<%# app.Value("siteUrl") %>TenderDetail/<%# Eval("strTenderUrl")%>'>View</a>
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