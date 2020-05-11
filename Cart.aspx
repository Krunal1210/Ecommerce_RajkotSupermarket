<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master"
    AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <style>
        input, select, textarea
        {
            background-image: url("images/input_bg1.gif");
            background-repeat: no-repeat;
            border: 1px solid #D0D0D0;
            color: #434343;
            height: 24px;
            line-height: 24px;
        }
        
        .lableText
        {
            line-height: 26px;
        }
    </style>--%>
    <script type="text/javascript">

        function ImgError(source) {
            source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=55X70";
            source.onerror = "";
            return true;
        }
        function onlyNumbers(evt, obj) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            //alert(charCode);
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            if (charCode != "8") {
                //alert(obj.value);
                if (obj.value == "") {
                    if (charCode == 48) {
                        //alert('Please enter Quantity greater then 0');

                        return false;

                    }
                }
            }

            return true;

        }
    </script>
    <style type="text/css">
        .modalBackground1 {
            background-color: gray;
            filter: alpha(opacity=1);
            opacity: 0.5;
        }
    </style>
    <style type="text/css">
        .Payble1 {
            color: #ed1c2a;
            font-weight: bold;
        }

        .Payble {
            color: #1061B1;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

       
    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liHome" runat="server">My Shopping Bag</span></li>
    </ul>
    <br />
    <h1 id="h2Header" runat="server">My Shopping Bag</h1>



    <!-- Shopping Cart -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="shoppingcart" id="tbldata" runat="server">
                <asp:Repeater runat="server" ID="grdCart">
                    <HeaderTemplate>
                        <ul class="head">
                            <li class="remove"><span style="color: #F0781A;">Remove</span> </li>
                            <li class="items">
                                <h5 class="colr">Picture</h5>
                            </li>
                            <li class="desc">
                                <h5 class="colr">Item Description</h5>
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
                            <li class="remove">
                                <asp:LinkButton ID="lnkQntyRemove" CommandName="RemoveItem" CommandArgument='<%# Eval("bintShopCartDtlId") %>'
                                    CausesValidation="false" runat="server"> <img src="images/kymdelete.png" /></asp:LinkButton></li>
                            <li class="items"><a href="#">
                                <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("MainImage") %>&D=70X50" onerror="ImgError(this);" />
                            </a></li>
                            <li class="desc"><a href="#" class="colr">
                                <%# Eval("strproductname") %></a> </li>
                            <li class="qty">
                                <asp:TextBox ID="tBoxQty" Text='<%# Eval("intQty")%>' runat="server" AutoPostBack="true"
                                    onkeypress="return onlyNumbers(event,this);" OnTextChanged="txtqty_textChanged" />
                                <cc1:FilteredTextBoxExtender runat="server" ID="filterText" TargetControlID="tBoxQty"
                                    FilterType="Numbers" InvalidChars="0">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RangeValidator ID="RangeValidator1" ErrorMessage="" ControlToValidate="tBoxQty"
                                    MinimumValue="0" MaximumValue="1" runat="server" />
                                <asp:Label Text='<%# Eval("bintProductId") %>' ID="lblTest" Visible="false" runat="server" /></li>
                            <li class="itemprice">Rs.<%# Eval("decPrice")%></li>
                            <li class="total">Rs.<%# Eval("decTotalPrice")%></li>

                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="title2" colspan="11">&nbsp;
                        </td>
                    </tr>
                    <tr>
                         
                        <td align="left" valign="top">
                            <strong>Shipping City</strong>
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:DropDownList ID="dpdPState" AutoPostBack="true" CssClass="select" DataTextField="statename"
                                Width="200px" DataValueField="pstateid" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td align="left" valign="top">
                            <strong>Area</strong>
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:DropDownList ID="dpdState" AutoPostBack="true" CssClass="select" DataTextField="Statename"
                                Width="200px" DataValueField="stateid" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <strong>Sub Area</strong>
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:DropDownList ID="dpdCity" AutoPostBack="true" CssClass="select" DataTextField="cityname"
                                Width="200px" DataValueField="cityid" runat="server">
                            </asp:DropDownList>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="left" valign="top">&nbsp;
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:CompareValidator ErrorMessage="Select Shipping State" Style="color: Red;" ValidationGroup="vgcart" ValueToCompare="0" Operator="NotEqual" ControlToValidate="dpdState"
                                runat="server" />
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">&nbsp;
                        </td>
                        <td width="10px">&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:CompareValidator ID="CompareValidator1" ValidationGroup="vgcart" ErrorMessage="Select Shipping City" ValueToCompare="0" Operator="NotEqual" ControlToValidate="dpdCity"
                                runat="server" />
                        </td>
                    </tr>

                </table>
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
                <div class="clear">
                </div>
                <br />
                <div class="thisDeta cf">
                    <table width="100%">
                        <tr>
                            <td width="45%">
                                <a href="<%= App.Value("siteUrl") %>" class="buttonContinue">Continue Shopping</a>

                            </td>
                            <td width="10%">&nbsp;
                            </td>
                            <td width="45%">
                                <asp:Button Text="Checkout" CssClass="button" ID="btnSignUp" ValidationGroup="vgcart"
                                    runat="server"></asp:Button></td>
                        </tr>
                    </table>




                </div>

                <div class="clear">
                </div>

            </div>
            <div class="shoppingcart" id="tblNodata" style="text-align: center;" runat="server">
                <img src="<%= App.Value("siteUrl") %>images/emptyCart.jpg" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clear">
    </div>
    <div>

        <marquee><a class="title colr" style="font-size: 14px; font-weight:bold;" href="#">Free shipping in India only on orders on or above Rs. 1000/-.</a></marquee>

    </div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div class="modalBackground1" style="position: fixed; z-index: 100010; left: 0px; top: 0px; width: 100%; height: 100%">
                <center>
                    <img src="<%= app.Value("siteUrl") %>images/ajax-loader.gif" style="z-index: 102; padding-top: 200px;">
                </center>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
