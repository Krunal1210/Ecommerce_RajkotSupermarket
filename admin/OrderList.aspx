<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="true"
    CodeFile="OrderList.aspx.vb" Inherits="Admin_LotList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">


        function bindCheckbox() {
            $(".check_all").bind("change", function () {
                if ($(this).is(':checked')) {
                    $(".chkCld").attr("checked", "checked");
                    setCheckboxVal();
                }
                else {
                    $(".chkCld").removeAttr("checked");
                    $("#ctl00_ContentPlaceHolder1_ListView1_hdnChk").val('');
                }
            });

            $(".chkCld").bind("change", function () {
                setCheckboxVal();
            });
        }

        function setCheckboxVal() {
            $("#ctl00_ContentPlaceHolder1_ListView1_hdnChk").val('');

            if ($(".chkCld:checked").length > 0) {
                $(".chkCld:checked").each(function () {
                    $("#ctl00_ContentPlaceHolder1_ListView1_hdnChk").val($("#ctl00_ContentPlaceHolder1_ListView1_hdnChk").val() + "," + $(this).attr("id"));
                });
            }

            if ($(".chkCld:checked").length == $(".chkCld").length) {
                $(".check_all").attr("checked", "checked");
            }
            else {
                $(".check_all").removeAttr("checked");
            }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="main" id="divList" runat="server" >
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2 id="lblTile" runat="server">
                Order List</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                           
                                        </td>
                                    </tr>
                                </table> 
    
    
        <!-- .block_head ends -->
        <asp:UpdatePanel ID="updPnlSrch" runat="server">
            <ContentTemplate>
                <div id="divSearch" runat="server" style=" border: 1px solid rgb(204, 204, 204);
                    padding: 10px; border-radius: 0px 0px 3px 3px;">
                    <table width="100%" cellspacing="0" cellpadding="0" class="form">
                        <tbody>
                            <tr>
                                <td colspan="4">
                                    <asp:Literal ID="ltrlSrchMsg" Text="" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Customer Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCust" runat="server" class="text small" />
                                </td>
                                 <td>
                                    <label>
                                        Order No:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrderNo" runat="server" class="text small" />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <label>
                                        City:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" class="text small" />
                                </td>
                                 <td>
                                    <label>
                                        Payment Option:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdPayment" CssClass="text small">
                                        <asp:ListItem Text="SELECT ALL" Value="0" />
                                        <asp:ListItem Text="CASH ON DELIVERY" Value="CASH ON DELIVERY" />
                                        <asp:ListItem Text="CCAVENUE" Value="CCAVENUE" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" colspan="2">
                                    <asp:Button ID="btnSearch" Text="Search" runat="server" class="submit small" ValidationGroup="vgsrch"
                                        />
                                </td>
                                <td style="text-align: left;" colspan="2">
                                    <asp:Button ID="btnReset" Text="Reset" runat="server" class="submit small" CausesValidation="false"
                                         />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
       
            <asp:UpdatePanel runat="server" ID="updPnlListView">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintOrderId">
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <center>
                                            No Order List exists.</center>
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <input type="checkbox" id="<%# Eval("bintOrderId") %>" class="chkCld" />
                                </td>
                                <td>
                                    <%# Eval("strSessionId")%>
                                </td>
                                <td>
                                    <%# Convert.ToDateTime(Eval("dateCreated")).ToString("dd/MM/yyyy")%>
                                </td>
                                <td>
                                    <%# Eval("strUserName")%>
                                </td>
                                <td>
                                    <%# Eval("City")%>
                                </td>
                                <td>
                                    <%# Eval("State")%>
                                </td>
                                <td>
                                    <%# Eval("PaymentOption")%>
                                </td>
                                <td>
                                    <%# Eval("decNetPrice")%>
                                </td>
                                <td>
                                    <img src='images/<%#IIf(Convert.ToBoolean(Eval("bitIsProceed")), "success.gif", "error.gif")%>'
                                        alt='<%#IIf(Convert.ToBoolean(Eval("bitIsProceed")), "Success", "Fail")%>' title='<%#IIf(Convert.ToBoolean(Eval("bitIsProceed")), "Success", "Fail")%>' />
                                </td>
                                <td class="delete">
                                    <a href="OrderDetails.aspx?id=<%# Eval("strSessionId") %>">Details </a>
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
                                            <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="strSessionId">Order No</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="SortByPhone" CommandName="Sort" CommandArgument="dateCreated">Order Date</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="SortByEmail" CommandName="Sort" CommandArgument="strUserName">Customer Name</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="City">City</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="State">State</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton3" CommandName="Sort" CommandArgument="PaymentOption">Payment Option</asp:LinkButton>
                                        </th>
                                        <th>
                                            <asp:LinkButton runat="server" ID="LinkButton4" CommandName="Sort" CommandArgument="decNetPrice">Net Amount</asp:LinkButton>
                                        </th>
                                        <td>
                                            Process
                                        </td>
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
            SelectCommand="[dbo].[SuccessOrderListAdmin]" DataSourceMode="DataSet" EnableCaching="false"
            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
            SelectCommand="[dbo].[FailOrderListAdmin]" DataSourceMode="DataSet" EnableCaching="false"
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
              
            }
        }
        bindCheckbox();
      
    </script>
</asp:Content>
