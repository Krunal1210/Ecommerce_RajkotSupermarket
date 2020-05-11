<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ucPaging.ascx.vb" Inherits="userControls_ucPaging" %>
 <asp:Repeater ID="rptPaging" runat="server">
                                    <HeaderTemplate>
                                        <div class="pagination">

                                        <label "<%#IIf(boolHasFirst, " style='display:none;'", " style='display:inline;'")%>" >&laquo; First</label>
                                        <a "<%#IIf(boolHasFirst, " style='display:inline;'", " style='display:none;'")%>" href="<%# strFirstUrl %>" title="First Page">&laquo; First</a>

                                        <label "<%#IIf(boolHasFirst, " style='display:none;'", " style='display:inline;'")%>" >&nbsp;&nbsp;&nbsp;&laquo; Previous&nbsp;&nbsp;&nbsp;</label>
                                        <a "<%#IIf(boolHasFirst, " style='display:inline;'", " style='display:none;'")%>" href="<%# strPrevUrl %>" title="Previous Page">&laquo; Previous</a> 

                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <a href="<%# Eval("pageUrl") %>" class="<%# Eval("pageClass") %>" title="<%# Eval("pageNo") %>"><%# Eval("pageNo") %></a> 
                                    </ItemTemplate>
                                    <FooterTemplate>
                                         
                                         <label "<%#IIf(boolHasLast, " style='display:none;'", " style='display:inline;'")%>" >&nbsp;&nbsp;Next &raquo;&nbsp;&nbsp;&nbsp;</label>
                                         <a "<%#IIf(boolHasLast, " style='display:inline;'", " style='display:none;'")%>" href="<%# strNextUrl %>" title="Next Page">Next &raquo;</a>
                                         
                                         <label "<%#IIf(boolHasLast, " style='display:none;'", " style='display:inline;'")%>" >Last &raquo;</label>
                                         <a "<%#IIf(boolHasLast, " style='display:inline;'", " style='display:none;'")%>" href="<%# strLastUrl %>" title="Last Page">Last &raquo;</a>
                                        
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>