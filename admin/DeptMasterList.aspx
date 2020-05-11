﻿<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="DeptMasterList.aspx.vb" Inherits="admin_DeptMasterList" %>

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
                DeptMaster List</h2>
            <ul>
                <li><a href="DeptMasterModify.aspx">Add DeptMaster</a></li>
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
            <asp:UpdatePanel runat="server" ID="updpnllistview">
                <ContentTemplate>
                    <table>
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="DeptId" DataSourceID="SqlDataSource1">
                            <EmptyDataTemplate>
                                <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <center>
                                                No DeptMaster exists. Click <a href="DeptMasterModify.aspx">here</a> to add new
                                                DeptMaster.</center>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <input type="checkbox" id="<%# Eval("DeptId") %>" class="chkCld" />
                                    </td>
                                    <td>
                                        <%# Eval("strName")%>
                                    </td>
                                    <td>
                                        <img src="../userFiles/DeptImage/<%# Eval("strlogo")%>" height="50px" />
                                        
                                    </td>
                                    <td>
                                        <img src='images/<%#iif(convert.toBoolean(eval("bitIsActive")),"success.gif","error.gif")%>'
                                            alt='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>'
                                            title='<%#iif(convert.toBoolean(eval("bitIsActive")), "active", "inactive")%>' />
                                    </td>
                                    <td class="delete">
                                        <a href="DeptMasterModify.aspx?id=<%# Eval("DeptId") %>">Edit</a>
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
                                                <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strDeptMasterName">DeptMaster Name
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="orderId">Logo
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                            <th>
                                                &nbsp;
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
        <!-- .block_content ends -->
        <div class="bendl">
        </div>
        <div class="bendr">
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
        SelectCommand="[dbo].[DeptMasterListAdmin]" SelectCommandType="StoredProcedure">
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
