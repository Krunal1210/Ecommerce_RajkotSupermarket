<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="SectionMaster.aspx.vb" Inherits="admin_SchoolList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <div id="divModify" visible="false" runat="server" class="main">
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
                Add Section</h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                            <h3>
                                                <a href="SectionMaster.aspx">
                                                    List Section</a></h3>
                                        </td>
                                    </tr>
                                </table>
          
           
            <asp:UpdatePanel ID="upPnlTaxAdd" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlData" runat="server">
                        <table width="100%" cellspacing="0" cellpadding="0" class="form">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <asp:Literal ID="ltrlMsg" Text="" runat="server" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Group Name:</label>
                                        </td>
                                    <td>
                                        <asp:DropDownList ID="dpdgroup" DataTextField="strGroupName" DataValueField="bintGroupId"
                                        runat="server">
                                    </asp:DropDownList>
                                    </td>
                                    </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Name:</label>
                                        </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" class="text small" />
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Name is required." ControlToValidate="txtName"
                                            ValidationGroup="vg" CssClass="note error" runat="server" />
                                    </td>
                                    </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSave" Text="Save" runat="server" class="submit small" ValidationGroup="vg" />
                                        <asp:ValidationSummary ID="valSum" ValidationGroup="vg" ShowMessageBox="true" ShowSummary="false"
                                            runat="server" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
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
     <div id="divList" runat="server" class="main">
 
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="Div2" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>Section List</h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                            <h3>
                                                <a href="SectionMaster.aspx?id=0">
                                                    Add Section</a></h3>
                                        </td>
                                    </tr>
                                </table>
                
       
        <asp:UpdatePanel ID="updPnlSrch" runat="server">
            <ContentTemplate>
                <div id="divSearch" runat="server" class="search" style="display: none; border: 1px solid rgb(204, 204, 204);
                    padding: 10px; border-radius: 0px 0px 3px 3px;">
                    <p class="breadcrumb">
                        <strong>Search Section</strong>
                    </p>
                    <table width="100%" cellspacing="0" cellpadding="0" class="form">
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <asp:Literal ID="ltrlSrchMsg" Text="" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <label>
                                            Name:</label><br>
                                        <asp:TextBox ID="txtSearchName" runat="server" class="text small" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" ErrorMessage="Name is required."
                                            ControlToValidate="txtSearchName" ValidationGroup="vgsrch" CssClass="note error"
                                            runat="server" />
                                    </p>
                                </td>
                                <td style="text-align: right;">
                                    <p>
                                        <asp:Button ID="btnSearch" Text="Search" runat="server" class="submit small" ValidationGroup="vgsrch" />
                                        <asp:Button ID="btnReset" Text="Reset" runat="server" class="submit small" CausesValidation="false" />
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
       
            <asp:UpdatePanel runat="server" ID="updPnlListView">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintSectionId" DataSourceID="SqlDataSource1">
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <center>
                                            No Section exists. Click <a href="SectionMaster.aspx?id=0">here</a> to add new
                                            Section.</center>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <input type="checkbox" id="<%# Eval("bintSectionId") %>" class="chkCld" />
                                </td>
                                <td>
                                    <%# Eval("strSectionName")%>
                                </td>
                                <td>
                                    <%# Eval("group")%>
                                </td>
                                <td>
                                    <img src='images/<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "success.gif", "error.gif")%>'
                                        alt='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>'
                                        title='<%#IIf(Convert.ToBoolean(Eval("bitIsActive")), "Active", "InActive")%>' />
                                </td>
                                <td class="delete">
                                    <a href="SectionMaster.aspx?id=<%# Eval("bintSectionId") %>">Edit </a>
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
                                            <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strSectionName">Name</asp:LinkButton>
                                        </th>
                                         <th>
                                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="group">group</asp:LinkButton>
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
            SelectCommand="SectionMstrList" DataSourceMode="DataSet" EnableCaching="false"
            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                bindMsgBox();
            }
        }
        bindCheckbox();
        bindMsgBox();
    </script>
</asp:Content>
