<%@ Page Title="" Language="VB" MasterPageFile="~/Main.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Rajkot Supermarket, Online Grocery Store and Mart in Rajkot.Buy Online Now.:</title>
    <asp:Literal Text="" ID="ltrlMeta" runat="server" />
    <style>
        .homeProList {
    padding: 80px 0 15px 200px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <ul class="homeProList cf">
        <asp:Repeater runat="server" ID="rptrbox">
            <ItemTemplate>
                <li><a href='<%# Eval("strurl")%>'>
                    <img src="http://rajkotsupermarket.com/userFiles/Addimage/<%# Eval("strImage") %>" alt="<%# Eval("strAdverstigeName")%>"></a></li>

            </ItemTemplate>
        </asp:Repeater>

    </ul>
    <br />
    <br />

    <table style="border-top:1px solid #CCCCCC;">
        <tr><td colspan="4">
            &nbsp;
            </td>

        </tr>
        <tr>
             <td>
                <img src="images/kymSafe.png" />
            </td>
            <td valign="top">
                <img src="images/kymOntime.png" />

            </td>

            <td valign="top">
                <img src="images/kymBestQlty.png" />

            </td>

            <td valign="top">
                <img src="images/kymSame.png" />

            </td>


           
        </tr>
    </table>
    <br />
    <br />

</asp:Content>
