<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master"
    AutoEventWireup="False" CodeFile="NotificationEmailTemplateList.aspx.vb" Inherits="adminpanel_Home" %>
 
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
                        Notification Correspondence Template List</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                                      </td>
                                    </tr>
                                </table> 
           
                    <asp:UpdatePanel runat="server" ID="updPnlListView">
                        <ContentTemplate>
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintNotificationEmailId" DataSourceID="SqlDataSource1"
                                EnableModelValidation="True">
                                <EmptyDataTemplate>
                                    <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <center>
                                                    No data was returned.</center>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <label><%# Eval("strName") %> </label> 
                                        </td>
                                         
                                        <td>
                                            <a href='NotificationEmailTemplateModify.aspx?id=<%# Eval("bintNotificationEmailId") %>'>Edit</a>
                                        </td>
                                        
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table id="Table2" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="strName"> Name</asp:LinkButton>
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
                                    <div class="pagination right">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="100">
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
                    SelectCommand="NotificationEmailTemplateList" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
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
        
</asp:Content>
