<%@ Page Title="Order Details | Rajkot Supermarket" Language="VB" MasterPageFile="~/MainChild.master"
    AutoEventWireup="true" CodeFile="OrderDetails.aspx.vb" Inherits="OrderDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function ImgError(source) {
            source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=50X80";
            source.onerror = "";
            return true;
        }
    </script>
    <style type="text/css">
        .Payble1 {
            color: #F0781A;
            font-size: 13px;
            font-weight: bold;
        }

        .Payble {
            color: #F39952;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liHome" runat="server">Order Detail</span></li>
    </ul>
    <br />
    <h1 id="h2Header" runat="server">Order Detail</h1>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 7px;">
        <tr>
            <td>

                <div class="shoppingcart">
                    <table width="97%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="80%">
                                                        <tr>
                                                            <td width="30%" style="font-size: 15px; font-weight: bold;">
                                                                <h5>Shipping Address :</h5>
                                                            </td>
                                                            <td width="70%">
                                                                <asp:Label ID="lblName" Text="" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblAddress" Text="" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr id="idlandmark" runat="server">
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblLandmark" Text="" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblCity" runat="server" />
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblPincode" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblState" runat="server" />
                                                            </td>
                                                        </tr>
                                                       
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblCountry" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr id="idcontact" runat="server">
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblContact" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr id="idlandline" runat="server">
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblLandline" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                            <td>
                                                                <asp:Label Text="" ID="lblPaymentOption" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="80%">
                                                        <tr>
                                                            <td width="30%" style="font-size: 15px; font-weight: bold;">
                                                                <h5>Order No :</h5>
                                                            </td>
                                                            <td width="70%">
                                                                <b><span runat="server" id="spnOrderNo"></span></b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: 15px; font-weight: bold;">
                                                                <h5>Order Date :</h5>
                                                            </td>
                                                            <td>
                                                                <span runat="server" id="spnOrderDate"></span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 10px;"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="shoppingcart" id="Div1" runat="server">
                                                        <asp:Repeater runat="server" ID="grdCart">
                                                            <HeaderTemplate>
                                                                <ul class="head">
                                                                    <li class="items">
                                                                        <h5 class="colr">Item</h5>
                                                                    </li>
                                                                    <li class="desc">
                                                                        <h5 class="colr">Description</h5>
                                                                    </li>
                                                                    <li class="qty">
                                                                        <h5 class="colr">Quantity</h5>
                                                                    </li>
                                                                    <li class="itemprice">
                                                                        <h5 class="colr">Item Price</h5>
                                                                    </li>
                                                                    <li class="total">
                                                                        <h5 class="colr">Total</h5>
                                                                    </li>
                                                                </ul>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <ul class="cartitems grey">
                                                                    <li class="items"><a href="#">
                                                                        <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("MainImage") %>&D=70X50" onerror="ImgError(this);" />
                                                                    </a></li>
                                                                    <li class="desc"><a href="#" class="colr">
                                                                        <%# Eval("strproductname") %></a> </li>
                                                                    <li class="qty">
                                                                        <%# Eval("intQty")%></li>
                                                                    <li class="itemprice">Rs.<%# Eval("decPrice")%></li>
                                                                    <li class="total">Rs.<%# Eval("decTotalPrice")%></li>
                                                                </ul>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 10px; border-top: 1px solid rgb(165, 162, 150);" colspan="6"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0" style="float: right;" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td colspan="3">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr class="Payble">
                                                            <td style="float: left;">Total Item
                                                            </td>
                                                            <td style="width: 10px;">:
                                                            </td>
                                                            <td style="float: right;">
                                                                <span id="TotalQnty" runat="server"></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr id="Tr1" class="Payble">
                                                            <td style="float: left;">Total Amount
                                                            </td>
                                                            <td style="width: 10px;">:
                                                            </td>
                                                            <td style="float: right;">
                                                                <span id="TotalAmount" runat="server"></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr id="Tr2" class="Payble">
                                                            <td style="float: left;">Shipping Charge &nbsp;&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td style="width: 10px;">:
                                                            </td>
                                                            <td style="float: right;">
                                                                <span id="Shipping" runat="server"></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr class="Payble1">
                                                            <td style="float: left;">Total Payable &nbsp;&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td style="width: 10px;">:
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
                            <td align="right" valign="top" colspan="2">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnBack" Text="Back" CssClass="buttonew" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
