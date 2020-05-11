<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master"
    AutoEventWireup="false" CodeFile="MyOrder.aspx.vb" Inherits="MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
    
.shoppingcart ul.cartitems li.demo {
    padding: 3px 0 0;
    text-align: center;
    width: 137px;
}
.shoppingcart ul.head li.demo {
    text-align: center;
    width: 137px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liHome" runat="server"> My Order History</span></li>
    </ul>
    <br />
               <h1  id="h2Header" runat="server"> My Order History</h1>  
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 7px;" >
                            <tr>
                                <td>

                <div class="shoppingcart">
                    <ul  class="head">
                        <li class="demo">
                            <h5 class="colr">
                                Order No</h5>
                        </li>
                        <li class="demo">
                            <h5 class="colr">
                                Order Date</h5>
                        </li>
                        <li class="demo">
                            <h5 class="colr">
                                Payment Option</h5>
                        </li>
                        <li class="demo">
                            <h5 class="colr">
                                Net Amount</h5>
                        </li>
                        
                        <li class="demo">&nbsp;</li>
                    </ul>
                    <asp:Repeater runat="server" ID="rptrOrderlist">
                        <ItemTemplate>
                            <ul class="cartitems grey">
                                <li class="demo">
                                    <%# Eval("strSessionId")%></li>
                                <li class="demo">
                                    <%# Convert.ToDateTime(Eval("dateCreated")).ToString("dd/MM/yyyy")%></li>
                                <li class="demo">
                                    <%# Eval("PaymentOption")%></li>
                                <li class="demo">Rs.
                                    <%# Eval("decNetPrice")%></li>
                                <li class="demo"><a href="OrderDetails.aspx?id=<%# Eval("strSessionId") %>" style="color: #DB3039;">
                                    Details </a></li>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
          
                                </td>
                            </tr>
                            </table>
</asp:Content>
