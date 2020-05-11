<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="true"
    CodeFile="OrderDetails.aspx.vb" Inherits="Admin_LotModify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        th
        {
            background: none repeat scroll 0 0 #F0F0F0;
            color: #212121;
            padding: 10px 0;
        }
        .tdrow td
        {
            color: white;
            text-align: center;
            vertical-align: middle;
        }
        .tdrow tr
        {
            background-color: #888888;
        }
    </style>
    <style>
        th
        {
            background: none repeat scroll 0 0 #F0F0F0;
            color: #212121;
            padding: 10px 0;
        }
        p td
        {
            color: White;
            text-align: center;
            vertical-align: middle;
        }
        p tr
        {
            background-color: #888888;
        }
        .Payble
        {
            color: Black;
            font-size: 14px;
            font-weight: bold;
        }
        .Payble1
        {
            color: #DB3039;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
       <script language="javascript" type="text/javascript">
<!--
           function popitup1(url) {
               newwindow = window.open(url, 'name', 'height=500,width=900,scrollbars=yes, addressbar=0,resizable=yes,location=no,status=1, toolbar=0, menubar=1');
               if (window.focus) { newwindow.focus() }
               return false;
           }


    // -->
    </script>
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
                                              <h2 id="h2Stone" runat="server">
                Order Details</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                               <input type="Button" name="name" value="Back" class="submit small" onclick="history.go(-1)" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button Text="Process" ID="btnProcess"  class="submit small" runat="server" />
<a class="submit small" data-toggle="tooltip" href="#" 
onclick="return popitup1('InvoicePrint.aspx?id=<%= Request("id")%>')" data-original-title="Click here to view & print Invoice">GENERATE INVOICE</a>
                                        </td>
                                    </tr>
                                </table>
            
             
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" cellspacing="0" width="500px">
                                                <tr>
                                                    <td width="180px" style="font-size: 15px; font-weight: bold;">
                                                        Shipping Address :
                                                    </td>
                                                    <td width="320px">
                                                        Name:
                                                        <asp:Label ID="lblName" Text="" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAddress" Text="" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr id="idlandmark" runat="server">
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblLandmark" Text="" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblCity" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblState" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblPincode" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblCountry" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr id="idcontact" runat="server">
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblContact" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr id="idlandline" runat="server">
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:Label Text="" ID="lblLandline" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table border="0" cellpadding="0" cellspacing="0" width="400px">
                                                <tr>
                                                    <td width="200px" style="font-size: 15px; font-weight: bold;">
                                                        Order No :
                                                    </td>
                                                    <td width="200px">
                                                        <span runat="server" id="spnOrderNo"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 15px; font-weight: bold;">
                                                        Order Date :
                                                    </td>
                                                    <td>
                                                        <span runat="server" id="spnOrderDate"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-size: 15px; font-weight: bold;">
                                                        Payment Option :
                                                    </td>
                                                    <td>
                                                        <span runat="server" id="spnPaymentOptino"></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="tdrow">
                                                <asp:GridView ID="grdCart" AutoGenerateColumns="False" Width="100%" runat="server"
                                                    CellPadding="4" EnableModelValidation="True" GridLines="None">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sr.No." HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50px"
                                                            ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex + 1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <img src="<%#  app.Value("siteUrl")  %>userFiles/ProductImage/<%# Eval("MainImage") %>"
                                                                    alt="" onerror="ImgError(this);" height="70" width="50" style="padding: 3px;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Item Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <strong class="book_t">
                                                                    <%# Eval("strProductName") %></strong>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
                                                            ItemStyle-CssClass="price">
                                                            <ItemTemplate>
                                                                <span class="redT">Rs.
                                                                    <%# Eval("decPrice")%>
                                                                </span>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Height="25px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="100px"
                                                            ItemStyle-CssClass="qtyBtn" HeaderText="Quantity">
                                                            <ItemTemplate>
                                                                <asp:Label ID="tBoxQty" Text='<%# Eval("intQty")%>' runat="server" Style="padding: 2px;
                                                                    width: 50px; height: 25px;" />
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Price" HeaderStyle-HorizontalAlign="Center"
                                                            HeaderStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <b>Rs.
                                                                    <%# Eval("decTotalPrice")%>
                                                                </b>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 10px; border-top: 1px solid rgb(165, 162, 150);" colspan="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <table border="0" style="float: right;" cellpadding="0" cellspacing="0">
                                                <tr class="Payble">
                                                    <td style="float: left;">
                                                        Total Item
                                                    </td>
                                                    <td style="width: 10px;">
                                                        :
                                                    </td>
                                                    <td style="float: right;">
                                                        <span id="TotalQnty" runat="server"></span>
                                                    </td>
                                                </tr>
                                                <tr class="Payble">
                                                    <td style="float: left;">
                                                        Total Amount
                                                    </td>
                                                    <td style="width: 10px;">
                                                        :
                                                    </td>
                                                    <td style="float: right;">
                                                        <span id="TotalAmount" runat="server"></span>
                                                    </td>
                                                </tr>
                                                <tr class="Payble">
                                                    <td style="float: left;">
                                                        Shipping Charge &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td style="width: 10px;">
                                                        :
                                                    </td>
                                                    <td style="float: right;">
                                                        <span id="Shipping" runat="server"></span>
                                                    </td>
                                                </tr>
                                                <tr class="Payble1">
                                                    <td style="float: left;">
                                                        Total Amount Paid &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td style="width: 10px;">
                                                        :
                                                    </td>
                                                    <td style="float: right;">
                                                        <span id="AmountPayble" runat="server"></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                       
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
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
