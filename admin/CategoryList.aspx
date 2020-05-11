<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="CategoryList.aspx.vb" Inherits="admin_CategoryList" %>

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
                                            <h2>Category List</h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                            <h3>
                                                <a href="CategoryModify.aspx">
                                                    <img style="vertical-align: middle;" src="images/addIcon.gif">Add Category</a></h3>
                                        </td>
                                    </tr>
                                </table>
                                <asp:UpdatePanel runat="server" ID="updpnllistview">
                                    <ContentTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="border: none;" colspan="3">
                                                    <h2>Search</h2>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Name :</td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txtName" /></td>
                                                <td>
                                                    <asp:Button Text="Search" ID="btnSearch" runat="server" /></td>
                                            </tr>
                                        </table>


                                        <table>
                                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintCategoryId" DataSourceID="SqlDataSource1">
                                                <EmptyDataTemplate>
                                                    <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td>
                                                                <center>
                                                                    No Category exists. Click <a href="CategoryModify.aspx">here</a> to add new Category.</center>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>
                                                <ItemTemplate>
                                                    <tr style="">
                                                        <td>
                                                            <input type="checkbox" id="<%# Eval("bintCategoryId") %>" class="chkCld" />
                                                        </td>
                                                        <td>
                                                            <%# Eval("Cathirarchy")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("DisplayName")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("orderId")%>
                                                        </td>
                                                        <td>
                                                            <img src="../userFiles/CategoryImage/<%# Eval("strPhoto") %>" height="50px" />
                                                        </td>

                                                        <td>
                                                            <img src='images/<%#IIf(Convert.ToBoolean(Eval("IsDisplayOnHome")), "success.gif", "error.gif")%>'
                                                                alt='<%#IIf(Convert.ToBoolean(Eval("IsDisplayOnHome")), "active", "inactive")%>'
                                                                title='<%#iif(convert.toBoolean(eval("IsDisplayOnHome")), "active", "inactive")%>' />
                                                        </td>
                                                        <td>
                                                            <img src='images/<%#iif(convert.toBoolean(eval("bitIsActive")),"success.gif","error.gif")%>'
                                                                alt='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>'
                                                                title='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>' />
                                                        </td>
                                                        <td class="delete">
                                                            <a href="CategoryModify.aspx?id=<%# Eval("bintCategoryId") %>">Edit</a>
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
                                                                    <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="Cathirarchy">Category Name
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="DisplayName">Display Name
                                                                    </asp:LinkButton>
                                                                </th>

                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="orderId">Display Order
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>Picture
                                                                </th>
                                                                <th>IsDisplayOnHome
                                                                </th>
                                                                <th>Status
                                                                </th>
                                                                <th>&nbsp;
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div class="tableactions">
                                                        <asp:HiddenField ID="hdnChk" runat="server" Value="" />
                                                        <asp:DropDownList ID="drpActions" runat="server" Style="width: 110px;">
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
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
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
                                        </table>
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
        SelectCommand="[dbo].[CategoryListAdmin]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
