<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="PageList.aspx.vb" Inherits="admin_SchoolList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>
                Page List</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="PageModify.aspx"> <img style="vertical-align: middle;" src="images/addIcon.gif">Add Page</a></h3>
                                        </td>
                                    </tr>
                                </table> 
    
    
            <asp:UpdatePanel runat="server" ID="updPnlListView">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintPageId" DataSourceID="SqlDataSource1">
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <center>
                                            No Page exists. Click <a href="PageModify.aspx" >here</a> to add new Page.</center>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <input type="checkbox" id="<%# Eval("bintPageId") %>" class="chkCld" />
                                </td>
                                <td>
                                    <%# Eval("strPageName")%>
                                </td>
                                  <td>
                                    <%# Eval("strPageType") %>
                                </td>
                                <td>
                                    <img src='images/<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "success.gif", "error.gif")%>'
                                            alt='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>'
                                            title='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>' />
                                </td>
                                <td class="delete">
                                    <a href="PageModify.aspx?id=<%# Eval("bintPageId") %>">Edit</a>
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
                                            <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strPageName">Name</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="bitHasPdf">Page Type</asp:LinkButton>
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
                                    <asp:ListItem Text="Make Inactive" Value="InActive"></asp:ListItem>
                                    <asp:ListItem Text="Delete" Value="Delete"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnAction" OnClick="btnAction_Click" ValidationGroup="valAction"
                                    class="submit tiny" Text="Apply to selected" runat="server" />
                                <asp:CompareValidator ID="CompareValidator1" class="note error" ValidationGroup="valAction"
                                    ErrorMessage="select any action !" ControlToValidate="drpActions" Display="Dynamic"
                                    ValueToCompare="0" Operator="NotEqual" runat="server" />
                            </div>
                            <div class="pagination right">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="200">
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
                            <!-- /widget-content -->
                        </div>
                        <!-- /widget -->
                    </div>
                    <!-- .block_content ends -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /main-inner -->
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
        SelectCommand="PageListAdmin" SelectCommandType="StoredProcedure">
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
