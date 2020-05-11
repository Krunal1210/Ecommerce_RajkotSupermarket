<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="NewsList.aspx.vb" Inherits="admin_SchoolList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="block">
        <div class="block_head">
            <div class="bheadl">
            </div>
            <div class="bheadr">
            </div>
            <h2>
                News List</h2>
            <ul>
                <%--<li> 
                    <asp:Button ID="btnGetLatNews" class="submit long" Text="Get Latest News From Google" runat="server" />  </li>--%>
                <li><a href="NewsModify.aspx">Add News</a></li>
            </ul>
            <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" AssociatedUpdatePanelID="updPnlListView"
                runat="server">
                <ProgressTemplate>
                    <img style="float: right; padding-top: 20px;" src="images/loading.gif">
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <!-- .block_head ends -->
        <div class="block_content">
            <asp:UpdatePanel runat="server" ID="updPnlListView">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintNewsId" DataSourceID="SqlDataSource1">
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <center>
                                            No News exists. Click <a href="NewsModify.aspx" >here</a> to add new News.</center>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <input type="checkbox" id="<%# Eval("bintNewsId") %>" class="chkCld" />
                                </td>
                                <td>
                                    <%# Eval("strNewsTitle")%>
                                </td>
                                 <td>
                                    <%# app.getShortDate(Eval("dateNews"))%>
                                </td>
                                 <td>
                                      <img src='images/<%#IIf(Convert.ToBoolean(Eval("bitIsOnHome")), "success.gif", "error.gif")%>'
                                            alt='<%#IIf(Convert.ToBoolean(Eval("bitIsOnHome")), "Active", "InActive")%>'
                                            title='<%#IIf(Convert.ToBoolean(Eval("bitIsOnHome")), "Active", "InActive")%>' />
                                </td>
                                  
                                <td>
                                    <img src='images/<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "success.gif", "error.gif")%>'
                                            alt='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>'
                                            title='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>' />
                                </td>
                                <td class="delete">
                                    <a href="NewsModify.aspx?id=<%# Eval("bintNewsId") %>">Edit</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table id="itemPlaceholderContainer" runat="server" cellpadding="0" cellspacing="0"
                                width="100%">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="check_all" />
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strNewsTitle">News Title</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="dateNews">News Date</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="bitIsOnHome">Is on Home</asp:LinkButton>
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </tbody>
                            </table>
                            <div class="tableactions">
                                <asp:HiddenField ID="hdnChk" runat="server" Value="" />
                                <asp:DropDownList ID="drpActions" runat="server"  style="width:110px;" >
                                    <asp:ListItem Text="Select Action" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Make Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Make Inactive" Value="Inactive"></asp:ListItem>
                                    <asp:ListItem Text="Delete" Value="Delete"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnAction" OnClick="btnAction_Click" ValidationGroup="valAction"
                                    class="submit tiny" Text="Apply to selected" runat="server" />
                                <asp:CompareValidator ID="CompareValidator1" class="note error" ValidationGroup="valAction"
                                    ErrorMessage="select any action !" ControlToValidate="drpActions" Display="Dynamic"
                                    ValueToCompare="0" Operator="NotEqual" runat="server" />
                            </div>
                            <div class="pagination right">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="active" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="False"
                                            ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- .block_content ends -->
        <div class="bendl">
        </div>
        <div class="bendr">
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
        SelectCommand="NewsListAdmin" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() == undefined) {
                bindCheckbox();
            }
        }
        bindCheckbox();    
    </script>
</asp:Content>
