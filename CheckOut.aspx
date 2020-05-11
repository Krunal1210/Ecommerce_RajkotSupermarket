<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master" AutoEventWireup="false"
    CodeFile="CheckOut.aspx.vb" Inherits="CheckOut" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Checkout, Rajkot Supermarket</title>
    <script type="text/javascript">

        function ImgError(source) {
            source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=55X70";
            source.onerror = "";
            return true;
        }

    </script>

    <style type="text/css">
        .Payble1 {
            color: #ed1c2a;
            font-weight: bold;
        }

        .Payble {
            color: #1061B1;
            font-weight: bold;
        }


        .shoppingcart {
            float: left;
            width: 788px;
        }

            .shoppingcart ul.head li.desc {
                padding-left: 11px;
                width: 290px;
            }

            .shoppingcart ul.cartitems li.desc {
                padding: 5px 0 0 11px;
                width: 290px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="index.html">Home</a></li>
        <li>CheckOut</li>
    </ul>
    <h1 id="h2Header" runat="server">CheckOut</h1>
    <div class="an"></div>
    <div class="sitebar" style="min-height: 350px;">
        <h4>Checkout help</h4>
        <ul class="filterList cf">
            <li><a href="#">Shipping & Payment</a></li>
            <li><a href="<%= App.Value("siteUrl") %>Pages/Term_And_Conditions">Terms & Conditions</a></li>
            <li><a href="<%= App.Value("siteUrl") %>Pages/Privacy_Policy">Privacy Policy</a></li>
        </ul>
        <!-- Left Categories -->

    </div>
    <div class="rightCon">

        <div class="leavecoments" style="padding: 0;">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="modalBackground1" style="position: fixed; z-index: 100010; left: 0px; top: 0px; width: 100%; height: 100%">
                        <center>
                            <img src="<%= app.Value("siteUrl") %>images/ajax-loader.gif" style="z-index: 102; padding-top: 200px;">
                        </center>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <asp:Literal Text="" ID="ltrlMenu" runat="server" />
                    <!-- Start Step 1 -->
                    <div class="checkoutCon  cf" id="divlogin" runat="server">
                        <div class="loginLeft">
                            <h3 class="colr left">I have Rajkot Supermarket Account</h3>
                            <br />
                            <ul class="form cf">
                                <li><span class="lableText">Email Address <span>*</span></span>
                                    <asp:TextBox runat="server" ID="txtLogEmail" CssClass="inputBox" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ErrorMessage="Email Address is required"
                                        Display="None" ValidationGroup="valLogin" ControlToValidate="txtLogEmail" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Invalid Email Address"
                                        ControlToValidate="txtLogEmail" ValidationGroup="valLogin" Text="*" Display="Dynamic"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" />
                                    <br />
                                    (Fields marked * are required) </li>
                                <li><span class="lableText">Password <span>*</span></span>
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="inputBox" TextMode="Password" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ErrorMessage="Password is required"
                                        ControlToValidate="txtPassword" Display="None" ValidationGroup="valLogin" runat="server" />
                                </li>
                                <li>
                                    <asp:ValidationSummary ID="valSumLogin" ValidationGroup="valLogin" ShowMessageBox="true"
                                        ShowSummary="false" runat="server" />
                                    <asp:Button Text="Login" ID="btnlogin" ValidationGroup="valLogin" CssClass="button"
                                        runat="server" />
                                </li>
                            </ul>
                        </div>
                        <div style="font-size: 40px; font-weight: bold; margin: 40px; float: left;">
                            OR
                        </div>
                        <div class="loginRight">
                            <h3 class="colr left">Continue Without Password
                            </h3>
                            <br />
                            <br />
                            <ul class="form cf">
                                <li>(You can save your details at the end) <span class="lableText">Email Address <span>*</span></span>
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="inputBox" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ErrorMessage="Email Address is required."
                                        ControlToValidate="txtEmail" ValidationGroup="ValCont" Display="Dynamic" runat="server" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Invalid Email Address"
                                        ControlToValidate="txtEmail" ValidationGroup="ValCont" Text="*" Display="Dynamic"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" />
                                </li>
                                <li>
                                    <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="ValCont" ShowMessageBox="true"
                                        ShowSummary="false" runat="server" />
                                    <asp:Button ID="btnContinue" Text="Continue" ValidationGroup="ValCont" CssClass="button"
                                        runat="server" />
                                    <br />
                                    <a href="facebookLogin.aspx">
                                        <img src="images/kymfacebook.jpg" /></a>
                                </li>
                            </ul>
                        </div>





                    </div>
                    <!-- End Step 1-->
                    <!-- Start Step 2 -->
                    <div class="checkoutCon  cf" id="divShipping" runat="server">
                        <h3 class="colr left">Shipping address
                        </h3>
                        <br />
                        <br />
                        <table class="form addressForm cf">
                            <tr>
                                <td><span class="lableText">First Name <span>*</span></span></td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtFirstname" CssClass="inputBox" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="First Name is required."
                                        ControlToValidate="txtFirstname" ValidationGroup="NextOrder" Text="*" Display="Dynamic"
                                        runat="server" />
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtFirstname"
                                        FilterType="UppercaseLetters,LowercaseLetters" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Last Name <span>*</span></span></td>
                                <td>
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="inputBox" />
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtLastName"
                                        FilterType="UppercaseLetters,LowercaseLetters" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Address <span>*</span></span></td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="300"
                                        class="inputBox" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ErrorMessage="Address Line  is required."
                                        ControlToValidate="txtAddress" ValidationGroup="NextOrder" Text="*" Display="Dynamic"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr runat="server" visible="false">
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr runat="server" visible="false">
                                <td><span class="lableText">LandMark </span></td>
                                <td>
                                    <asp:TextBox ID="txtLandMark" runat="server" CssClass="inputBox" />
                                    <cc1:TextBoxWatermarkExtender ID="ccwatermartkextender" runat="server" TargetControlID="txtLandMark"
                                        WatermarkText="Famous building nearby" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Sub Area <span>*</span></span></td>
                                <td>
                                    <asp:DropDownList ID="dpdCity" Enabled="false" DataTextField="cityname" CssClass="select"
                                        DataValueField="cityid" runat="server">
                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="txtTownCityShip" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ErrorMessage="Town/City is required."
                                                ControlToValidate="txtTownCityShip" ValidationGroup="NextOrder" Text="*" Display="Dynamic"
                                                runat="server" />
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtTownCityShip"
                                                FilterType="LowercaseLetters,UppercaseLetters">
                                            </cc1:FilteredTextBoxExtender>
                                        </li>--%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Area <span>*</span></span></td>
                                <td>
                                    <asp:DropDownList ID="dpdState" Enabled="false" DataTextField="Statename" CssClass="select"
                                        DataValueField="stateid" runat="server">
                                    </asp:DropDownList>

                                    <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Please Select Area" ControlToValidate="dpdstate"
                                        Text="*" ValueToCompare="0" ValidationGroup="NextOrder" Display="None" Operator="NotEqual" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">City <span>*</span></span></td>
                                <td>
                                    <asp:DropDownList ID="dpdPstate" Enabled="false" DataTextField="Statename" CssClass="select"
                                        DataValueField="pstateid" runat="server">
                                    </asp:DropDownList>

                                    <asp:CompareValidator ID="CompareValidator2" ErrorMessage="Please Select City" ControlToValidate="dpdstate"
                                        Text="*" ValueToCompare="0" ValidationGroup="NextOrder" Display="None" Operator="NotEqual" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Postcode/ZipCode <span>*</span></span></td>
                                <td>
                                    <asp:TextBox ID="txtPostcodeShip" runat="server" MaxLength="6" CssClass="inputBox" />
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPostcodeShip"
                                        FilterType="Numbers" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ErrorMessage="Postcode is required."
                                        ControlToValidate="txtPostcodeShip" ValidationGroup="NextOrder" Text="*" Display="None"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">State <span>*</span></span></td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdMainState" CssClass="select" class="infield" Enabled="false">
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Country <span>*</span></span></td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdContry" CssClass="select" class="infield" Enabled="false">
                                        <asp:ListItem Text="India" Value="India" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Contact No. </span></td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="inputBox" MaxLength="10" />
                                    <asp:RangeValidator ID="RangeValidator3" ErrorMessage="Please Enter Valid Contact"
                                        MinimumValue="1000000000" MaximumValue="99999999999999999" Type="Double" ValidationGroup="NextOrder"
                                        ControlToValidate="txtPhone" runat="server" />
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="txtPhone"
                                        FilterType="Numbers" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td><span class="lableText">Land Line No. </span></td>
                                <td>
                                    <asp:TextBox ID="txtLandline" CssClass="inputBox" runat="server" MaxLength="12" />
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" TargetControlID="txtLandline"
                                        FilterType="Numbers" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnBackCart" Text="Back To Cart" CssClass="button" Style="margin-top: 20px !important; float: left; width: 160px"
                                        runat="server" />
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" Text="Save & Continue" ValidationGroup="NextOrder" Style="margin-top: 20px !important; float: right; width: 160px"
                                        CssClass="button" runat="server" />
                                    <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="NextOrder" ShowMessageBox="true"
                                        ShowSummary="false" runat="server" />
                    </div>

                    </td>
                                </tr>
                            </table>
                           
                              
                              
                        </div>
                        <!-- End Step 2-->
                    <!-- Start Step 3 -->
                    <div class="checkoutCon  cf" id="divPayment" runat="server">
                        <div style="width: 550px; margin: 0 0 20px 50px;">
                            <div class="radioButBox cf">
                                <asp:RadioButtonList runat="server" ID="rdbtnPayment" Width="300px" CssClass="Payoption" AutoPostBack="true"
                                    RepeatDirection="Horizontal">
                                    <%--      <asp:ListItem Text="CCAVENUE" Value="CCAVENUE" Selected="True" />--%>
                                    <asp:ListItem Text="CASH ON DELIVERY" Value="CASH ON DELIVERY" />
                                    <%--           <asp:ListItem Text="CHEQUE/DD" Value="CHEQUE/DD" />--%>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ValidationGroup="vg11" ErrorMessage="Please Select Any Payment Option" ControlToValidate="rdbtnPayment"
                                    runat="server" />
                                <%-- <label>
                                                    <input name="" type="radio" value="">CCAVENUE</label>
                                                <label>
                                                    <input name="" type="radio" value="">CASH ON DELIVERY</label>--%>
                            </div>
                            <div id="divCCavenue" runat="server" visible="false">
                                <p>
                                    <strong>You have Selected to pay through CCAvenue</strong>
                                </p>
                                <p>
                                    This payment gateway is ideally suited for customers from India.
                                </p>
                                <p>
                                    The settlement currency is Indian Rupees (INR)
                                </p>
                                <p>
                                    You can pay using your Visa/Master Card Credit Card or Debit Card or you can use
                                                the Net Banking facility
                                </p>
                                <p>
                                    We also accept Cash Cards and Mobile payments
                                </p>

                            </div>
                            <div id="dvCashondiv" runat="server" style="width: 590px;">
                                <p>
                                    <b>You have Selected to pay by Cash On Delivery.</b>
                                    <br />
                                    <br />
                                    Please note the below points before proceeding.<br />
                                    <br />
                                </p>
                                <p>
                                    We do this in good faith-that when the goods arrive to your shipping address, you
                                                will take the delivery of the parcel against full payment (Cash Only).</li>
                                </p>
                                <p>
                                    In this case, you need not send the payment in advance. You have to make the full
                                                payment to the &lsquo;Postman&rsquo; or any representative from the postmaster of
                                                the delivering post office.
                                </p>
                                <p>
                                    <b>Please make ONLY Cash Payment at the time of delivery. Cheque or Demand Draft will
                                                    not be accepted.</b>
                                </p>
                                <p>
                                    <b>It usually takes 3 to 15 business days to deliver consignments across India depending
                                                    on the geographical location and the pin code of your shipping address. Kindly note
                                                    that delivery may take more time in case of remote areas.</b>
                                </p>
                                <p>
                                    Cash-on-Delivery is available for customers within <b>INDIA</b> only
                                </p>
                                <p>
                                    Please read our shipping policy carefully. In case you have any query, please send
                                                an e-mail to support@rajkotsupermarket.com for further clarification.
                                </p>
                            </div>
                            <div id="spCheck" runat="server" visible="false">
                                <p>
                                    <b>You have Selected to pay by Cheque/DD</b><br />
                                    <br />
                                    Rajkot Supermarket accepts the Cheque, Money Order or Bankers Draft from the consumer
                                                in<br />
                                    good faith and will dispatch the order subject to realization of Cheque/DD<br />
                                    <br />
                                    For any further clarifications please write in to us at info@rajkotsupermarket.com
                                </p>
                            </div>
                            <table width="100%">
                                <tr>
                                    <td width="40%">
                                        <asp:Button ID="btnBack" Text="Back" Style="float: left;" CssClass="button" runat="server" />
                                    </td>
                                    <td width="20%">&nbsp;</td>
                                    <td width="40%">
                                        <asp:Button ID="btnPlaceOrder" Text="Place Order" Style="float: right;" ValidationGroup="vg11"
                                            CssClass="button" runat="server" />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="vg11" />
                                    </td>
                                </tr>


                            </table>
                        </div>
                    </div>
                    <!-- End Step 3-->
                    <!-- Start Step 4 -->
                    <div class="checkoutCon  cf" id="dvOrderConformation" runat="server">
                        <h2 id="h2payment" runat="server"></h2>
                        <p>
                            <br />
                            Thanks for your order, Your order has been placed.
                        </p>
                        <p>
                            <b>Order No:</b> <span runat="server" id="spnOrderNo"></span>
                        </p>
                        <p>
                            <b>Order Date:</b> <span runat="server" id="spnOrderDate"></span>
                        </p>
                        <div class="shoppingcart" id="tbldata" runat="server">
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
                                            <img alt="<%# Eval("strproductname")%>" src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("MainImage") %>&D=70X50" onerror="ImgError(this);" />
                                        </a></li>
                                        <li class="desc"><a href="#" class="colr">
                                            <%# Eval("strproductname")%></a> </li>
                                        <li class="qty">
                                            <%# Eval("intQty")%></li>
                                        <li class="itemprice">Rs.<%# Eval("decPrice")%></li>
                                        <li class="total">Rs.<%# Eval("decTotalPrice")%></li>
                                    </ul>
                                </ItemTemplate>
                            </asp:Repeater>
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
                                <tr>
                                    <td colspan="3">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div class="clear">
                            </div>
                            <div class="">
                                <div class="left">
                                    <a href="<%= App.Value("siteUrl") %>" class="button">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


    </div>
    <div class="an"></div>

</asp:Content>
