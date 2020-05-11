<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="true"
    CodeFile="BannerList.aspx.vb" Inherits="Admin_LotList" %>

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
                                                Banner List</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="BannerModify.aspx"> <img style="vertical-align: middle;" src="images/addIcon.gif">Add Banner</a></h3>
                                        </td>
                                    </tr>
                                </table> 
       
            <asp:UpdatePanel runat="server" ID="updPnlListView">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="intBannerId" DataSourceID="SqlDataSource1">
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <center>
                                            No Banner exists. Click <a href="BannerModify.aspx">here</a> to add new Banner.</center>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <input type="checkbox" id="<%# Eval("intBannerId") %>" class="chkCld" />
                                </td>
                                <td>
                                    <%# Eval("strBannerName")%>
                                </td>
                                 <td>
                                    <%# Eval("strurl")%>
                                </td>
                                <td>
                                    <img src="../userFiles/BannerImage/<%# Eval("strImage") %>" height="60" width="60" />
                                </td>
                                 <td>
                                    <%# Eval("intOrder")%>
                                </td>
                                 <td>
                                    <img src='images/<%#iif(convert.toBoolean(eval("bitIsHome")),"success.gif","error.gif")%>'
                                            alt='<%#iif(convert.toBoolean(eval("bitIsHome")), "Yes", "No")%>'
                                            title='<%#iif(convert.toBoolean(eval("bitIsHome")), "Yes", "No")%>' />
                                </td>
                                 <td>
                                    <img src='images/<%#iif(convert.toBoolean(eval("bitIsCart")),"success.gif","error.gif")%>'
                                            alt='<%#iif(convert.toBoolean(eval("bitIsCart")), "Yes", "No")%>'
                                            title='<%#iif(convert.toBoolean(eval("bitIsCart")), "Yes", "No")%>' />
                                </td>
                                <td>
                                    <img src='images/<%#iif(convert.toBoolean(eval("bitIsActive")),"success.gif","error.gif")%>'
                                            alt='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>'
                                            title='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>' />
                                </td>
                               
                                <td class="delete">
                                    <a href="BannerModify.aspx?id=<%# Eval("intBannerId") %>">Edit </a>
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
                                            <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strBannerName">Name</asp:LinkButton>
                                        </th>
                                         <th>
                                            <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="strurl">Url</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="strImage">Image</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton3" CommandName="Sort" CommandArgument="strImage">Display Order</asp:LinkButton>
                                        </th>
                                        <th>
                                            Display on Home
                                        </th>
                                        <th>
                                            Display on Cart
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
                                <asp:DropDownList ID="drpActions" runat="server" Style="width: 110px;">
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
                            <div style="float: left; padding-left: 200px;">
                                <label>
                                    Page Size</label>
                                <asp:DropDownList Style="width: 50px;" ID="drpPageSize" OnSelectedIndexChanged="changePageSize"
                                    AutoPostBack="true" runat="server">
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="50" Value="50" />
                                    <asp:ListItem Text="100" Value="100" />
                                    <asp:ListItem Text="500" Value="500" />
                                    <asp:ListItem Text="1000" Value="1000" />
                                    <asp:ListItem Text="All" Value="9999999" />
                                </asp:DropDownList>
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
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
            SelectCommand="[dbo].[BannerListAdmin]" DataSourceMode="DataSet" EnableCaching="false"
            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <!-- .block_content ends -->
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
