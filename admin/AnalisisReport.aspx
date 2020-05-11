<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false" CodeFile="AnalisisReport.aspx.vb" Inherits="admin_AnalisisReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main" runat="server" id="dvlist">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>Analysis Report</h2>
                                        </td>

                                    </tr>
                                </table>


                                <asp:UpdatePanel runat="server" ID="updpnllistview">
                                    <ContentTemplate>

                                        <table width="100%" border="0">
                                            <tr>
                                                <td>Division:</td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="dpddivision1" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>Section:</td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="dpdSec1" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>Dept:</td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="dpdDept1" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Brand </td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="dpdbrand1" DataTextField="strName" DataValueField="brandId">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>Product </td>
                                                <td>
                                                    <asp:TextBox ID="txtprod" runat="server" Width="200px" class="text small"></asp:TextBox>
                                                </td>
                                                <td>Barcode </td>
                                                <td>
                                                    <asp:TextBox ID="txtbcode" runat="server" Width="200px" class="text small"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                                <td>
                                                    <asp:Button ID="btnSearch" runat="server" class="submit small" Text="Search" />

                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnreset" runat="server" class="submit small" Text="Reset" />

                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdateProgress ID="UpdateProgress2" DynamicLayout="true" AssociatedUpdatePanelID="updPnlListView"
                                                        runat="server">
                                                        <ProgressTemplate>
                                                            <img style="float: left;" src="images/loading.gif">
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                        </table>

                                        <table>
                                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintProductId" DataSourceID="SqlDataSource1">
                                                <EmptyDataTemplate>
                                                    <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td>
                                                                <center>
                                                                    No Product exists. .</center>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>
                                                <ItemTemplate>
                                                    <tr style="">

                                                        <td>
                                                            <%# Eval("Division")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Section")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Department")%>
                                                        </td>
                                                         <td>
                                                            <%# Eval("Brand")%>
                                                        </td>
                                                          <td>
                                                            <%# Eval("productname")%>
                                                        </td>
                                                         <td>
                                                            <%# Eval("weight")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Barcode")%>
                                                        </td>
                                                       

                                                        <td>
                                                            <%# Eval("StandardBarcode")%>
                                                        </td>

                                                       
                                                        <td>
                                                            <%# Eval("MRP_SPE")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("MRP_List")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("SaleQtySum") %>
                                                        </td>


                                                        <td>
                                                            <%# Eval("StockQtySum") %>      </td>


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
                                                                    <asp:LinkButton runat="server" ID="LinkButton4" CommandName="Sort" CommandArgument="Division">Division
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton7" CommandName="Sort" CommandArgument="Section">Section
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton5" CommandName="Sort" CommandArgument="Department">Department
                                                                    </asp:LinkButton>
                                                                </th>

                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="Brand">Brand
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton6" CommandName="Sort" CommandArgument="productname">Product
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="weight">weight
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="Barcode">Barcode
                                                                    </asp:LinkButton>
                                                                </th>
                                                                <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton3" CommandName="Sort" CommandArgument="StandardBarcode">Std. Barcode
                                                                    </asp:LinkButton>
                                                                </th>
                                                                 <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton8" CommandName="Sort" CommandArgument="Barcode">Barcode
                                                                    </asp:LinkButton>
                                                                </th>
                                                                 <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton9" CommandName="Sort" CommandArgument="Barcode">Barcode
                                                                    </asp:LinkButton>
                                                                </th>
                                                                 <th>
                                                                    <asp:LinkButton runat="server" ID="LinkButton10" CommandName="Sort" CommandArgument="Barcode">Barcode
                                                                    </asp:LinkButton>
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
                                                           <%-- <asp:ListItem Text="Make Active" Value="Active"></asp:ListItem>
                                                            <asp:ListItem Text="Make Inactive" Value="InActive"></asp:ListItem>--%>
                                                            <%-- <asp:ListItem Text="Delete" Value="Delete"></asp:ListItem>--%>
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
</asp:Content>

