<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InvoicePrint.aspx.vb" Inherits="Soft_InvoicePrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css" media="all">
        @import url("~/Admin/css/style.css");
        @import url("~/Admin/css/jquery.wysiwyg.css");
        @import url("~/Admin/css/facebox.css");
    </style>
    <style>
        label {
            font-weight: bold;
        }

        body {
            background: url("../images/bg.jpg") repeat scroll 0 0 #fbfbfb;
            color: #666;
            font-family: "Lucida Grande",Verdana,sans-serif;
            font-size: 12px;
            line-height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table cellspacing="0" border="1" style="width: 850px; border-collapse: separate;">
                <tr>
                    <td style="border-right: none;" colspan="2">
                        <img src="../images/rajkotsupermarketlogo.png" alt="" />

                    </td>
                    <td valign="top" aling="right" style="border-left: none;" colspan="2">
                        <p style="text-align: right;">
                            Order No :&nbsp; &nbsp; <asp:Label ID="lblorderno" Font-Bold="true" Text="2009" runat="server" />
                            <br />
                          <%--  Booking Date :&nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblbookD" Text="2009" runat="server" />--%>
                            Order Date :&nbsp; <asp:Label ID="lblorderdate" Font-Bold="true" Text="2009" 
                                runat="server" />
                            <br />
                          &nbsp;</p>
                    </td>
                    </tr> 
                      <tr>
                    <td style="border-top: none;background-color:#1061AF;" colspan="4">
                     
                    </td>
                   
                </tr>
                     <tr>
                    <td style="border-top: none;">
                        <label>Name</label>
                    </td>
                    <td colspan="3" style="border-top: none;">
                        <asp:Label Text="" ID="lblname" runat="server" />
                    </td>
                </tr>
              
                          <tr>
                    <td >
                        <label>Shipping Address</label>
                    </td>
                    <td colspan="3" >
                        <asp:Label Text="" ID="lbladdrss" runat="server" />
                    </td>
                </tr>
                <tr>
                  <td WIdth="25%">
                        <label>Landmark</label></td>
                   <td WIdth="25%"><asp:Label Text="" ID="lblpincode" runat="server" /></td>
                    <td WIdth="25%">
                        <label>City / Village</label></td>
                   <td WIdth="25%">  <asp:Label Text="" ID="lblcity" runat="server" /></td>
                   
                </tr>
                <tr>
                <td WIdth="25%">
                        <label>Mobile</label></td>
                   <td WIdth="25%"><asp:Label Text="" ID="lblmobile" runat="server" /></td>
                    
                    <td style="border-bottom:none;">
                        <label>SP. Note</label></td>
                    <td style="border-bottom:none;">  <asp:Label Text="" ID="lblnote" runat="server" />
                    </td>

                </tr>
                
                    <tr>
                    <td style="border-top: none;background-color:#1061AF;" colspan="4">
                     
                    </td>
                   
                </tr>
                </table>

            <asp:Repeater runat="server" ID="rptrMember" >
                <HeaderTemplate>
                    <table cellspacing="0" border="1" style="width: 850px; border-collapse: separate; text-align: center;">
                        <tr>

                            <td width="30px" style="border-top: none;">
                                <label>No.</label></td>
                            <td width="281px" style="border-top: none;">
                                <label>Name of Product</label></td>
                            <td width="42px" style="border-top: none;">
                                <label>Price</label></td>
                            <td width="60px" style="border-top: none;">
                                <label>Quantity</label></td>
                            <td width="70px" style="border-top: none;">
                                <label>Total Price</label></td>
                           
                            

                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>

                        <td><%#DataBinder.Eval(Container, "ItemIndex", "") +1%></td>
                        <td>
                            <%# Eval("strProductName")%> </td>
                        
                        <td>
                            <%# Eval("decPrice")%></td>
                        <td>
                            <%# Eval("intQty")%></td>
                        <td>
                            <%# Eval("decTotalPrice")%> </td>
                       
                        

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <tr>

                        <td style="border-bottom: none;">&nbsp;
                        </td>

                        <td style="border-bottom: none;">&nbsp;
                        </td>
                        <td style="border-bottom: none;">&nbsp;
                        </td>
                        <td style="border-bottom: none;">&nbsp;
                        </td>
                        <td style="border-bottom: none;">&nbsp;
                        </td>
                       

                    </tr>

                    </table>
                </FooterTemplate>
            </asp:Repeater>
                  <table cellspacing="0" border="1" style="width: 850px; border-collapse: separate;">
      
                <tr>
                   <%-- <td colspan="2" style="border-right: none;">
                        
                       

                    </td>--%>
                    <td colspan="4"   valign="top" style="border-top:none;">
                        <table cellspacing="0" border="1" style="width: 100%; border-collapse: separate;">
                            <tr>
                                <td rowspan="4" width="50%" style="border-left:none;" >
                                     <span>I have throughly read and fully understood the rules & Regulation. I agree to abide them in full. (on behalf of all named above-including minor if any.)

                        </span>
                        <br />
                           <br />
                        <br />
                        <center><label> Customer Signature</label></center>
                        <br />


                             <br />

                        <center><label> Authorised Signature</label></center>
                        <br />
                                </td>
                                <td width="16.5%" style="text-align: right; padding-right: 10px;">
                                    <strong> Total Item</strong> </td>
                                <td width="17%" style="text-align: right; padding-right: 10px; border-right:none;">
                                    <label>
                                        <asp:Label Text="" ID="lbltotalitem" runat="server" /></label></td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 10px;">
                                   <strong> Total Amount</strong></td>
                                <td style="text-align: right; padding-right: 10px;border-right:none;">
                                    <label>
                                        <asp:Label Text="" ID="lblTotalamount" runat="server" /></label></td>
                            </tr>
                             <tr>
                                <td style="text-align: right; padding-right: 10px;">
                                   <strong> Shipping Charge</strong></td>
                                <td style="text-align: right; padding-right: 10px;">
                                    <label>
                                        <asp:Label Text="" ID="lblshipping" runat="server" /></label></td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 10px;">
                                   <strong> Total Amount Paid</strong></td>

                                <td style="text-align: right; padding-right: 10px;">
                                    <label>
                                        <asp:Label Text="" ID="lblAmountpaid" runat="server" /></label></td>
                            </tr>
                            <%--<tr>
                                <td>&nbsp;</td>
                                <td>
                                    <label>Payble amount</label></td>

                                <td style="text-align: right; padding-right: 10px;">
                                    <label>
                                        <asp:Label Text="" ID="lblRound" runat="server" /></label></td>
                            </tr>--%>
                        </table>
                    </td>
                </tr>
                 <tr>
                    <td style="border-top: none;background-color:#1061AF;" colspan="4">
                     
                    </td>
                   
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
