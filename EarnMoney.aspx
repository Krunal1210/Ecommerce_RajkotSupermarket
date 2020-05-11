<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master" AutoEventWireup="false" CodeFile="EarnMoney.aspx.vb" Inherits="EarnMoney" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liHome" runat="server">Earn Money</span></li>
    </ul>
    <br />
    <h1 id="h2Header" runat="server">Earn Money</h1>



    <table>
        <tr>
            <td>
                <p style="line-height: 30px;">We will reward you when you introduce friends and family to Rajkot Supermarket. When your friends sign up for a new Rajkot Supermarket account with your referral code or referral link you will get Rs 50 Credit of your each friend purchase above Rs. 1000 once. </p>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <h3>Your Referral Link</h3>
            </td>
        </tr>
         
        <tr>
            <td>
                <h1 style="color:#1061AF">http://rajkotsupermarket.com/Registration.aspx?refcode=<asp:Label Text="" ForeColor="#1061AF" ID="lblCode" runat="server" /></h1>
            </td>
        </tr>
         <tr>
            <td>
                <h3>Your Referral Code</h3>
            </td>
        </tr>
         <tr>
            <td>
                <h1> <asp:Label Text=""   ID="lblCode2" runat="server" /></h1>
            </td>
        </tr>
         <tr>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <h1>Referral List</h1>
            </td>
        </tr>
    </table>


</asp:Content>

