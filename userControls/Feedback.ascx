<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Feedback.ascx.vb" Inherits="userControls_Feedback" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<style type="text/css">
    .select
    {
        background: none repeat scroll 0 0 #FFFFFF;
        border: 0 none;
        border-radius: 3px 3px 3px 3px;
        display: block;
        height: 24px;
        line-height: 18px;
        margin-bottom: 3px;
        padding: 3px;
        width: 240px;
    }
    .inputText
    {
        float: left;
        background: none repeat scroll 0 0 #FFFFFF;
        border: 0 none;
        border-radius: 3px 3px 3px 3px;
        display: block;
        height: 27px;
        line-height: 18px;
        margin-bottom: 3px;
        padding: 3px 5px;
        width: 280px;
    }
    .textarea
    {
        background: none repeat scroll 0 0 #F5F5F5;
        border: medium none;
        border-radius: 3px 3px 3px 3px;
        font-family: Arial;
        font-size: 12px;
        box-shadow: none;
        color: #000000;
        height: 65px;
        line-height: 18px;
        padding: 3px 5px;
        width: 230px;
    }
    .inputButton
    {
        background: none repeat scroll 0 0 #D21A1A;
        border: 0 none;
        border-radius: 5px 5px 5px 5px;
        color: #FFFFFF;
        cursor: pointer;
        font-size: 12px;
        font-weight: bold;
        padding: 4px 13px 6px;
    }
    .ar
    {
        float: left;
    }
    .lblForm
    {
        color: #666666;
        display: block;
        font-size: 12px;
        font-weight: bold;
        line-height: 1.4em;
        margin-bottom: 2px;
    }
    .lblForm1
    {
        background: none repeat scroll 0 0 #BEBEBE;
        color: #2078BF;
        display: block;
        font-size: 15px;
        font-weight: bold;
        height: 30px;
        line-height: 1.4em;
        margin-bottom: 3px;
        margin-top: 10px;
        width: 200px;
    }
    .spnForm
    {
        color: #666666;
        display: inline;
        font-size: 12px;
        font-weight: bold;
        line-height: 1.4em;
        margin-bottom: 2px;
        padding-left: 13px;
        vertical-align: top;
    }
    .title2
    {
        color: #C8C8C8;
        font-size: 15px;
        font-weight: bold;
        text-transform: none !important;
    }
</style>
<asp:Panel ID="pnlData" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" width="30%">
                <span class="lableText">Dozo Services Pvt Limited</span> <span class="lableText">D203,
                    Crystal Plaza,<br />
                    Link Road, Opp Infiniti Mall,<br />
                    Andheri W - 400053</span> <span class="lableText">Info@nirbhayproducts.com</span>
                <p style="margin-top: 50px;">
                    <a href="https://www.facebook.com/NirbhaySpray" target="_blank">
                        <img src="../images/Facebook.png" width="200px" height="50px" /></a>
                </p>
            </td>
            <td valign="top" width="70%">
                <table width="100%" border="0" cellspacing="10px" cellpadding="0" style="margin: 0 10px 0 50px;
                    color: #FFFFFF;">
                    <%-- <tr>
                        <td colspan="2">
                           
                        </td>
                    </tr>--%>
                    <%-- <tr>
                        <td colspan="2">
                           
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="2">
                            <span class="lableText">( <span>*</span> ) are mandatory </span>
                            <label class="lblForm" id="lblMsg" runat="server" style="color: Green;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span class="lableText">First Name <span>*</span></span>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtFirstName" class="inputText" runat="server" MaxLength="30" />
                            <cc1:FilteredTextBoxExtender ID="txtFirstName_FilteredTextBoxExtender" runat="server"
                                Enabled="True" TargetControlID="txtFirstName" FilterType="UppercaseLetters,LowercaseLetters">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="rfvFname" ErrorMessage="First Name is required" Text="*"
                                Display="Dynamic" ValidationGroup="Feedback" ControlToValidate="txtFirstName"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="lableText">Last Name <span>*</span></span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLaseName" class="inputText" runat="server" MaxLength="30" />
                            <cc1:FilteredTextBoxExtender ID="txtLaseName_FilteredTextBoxExtender" runat="server"
                                Enabled="True" TargetControlID="txtLaseName" FilterType="UppercaseLetters,LowercaseLetters">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="rfvLname" ErrorMessage="Last Name is required" Display="Dynamic"
                                Text="*" ControlToValidate="txtLaseName" ValidationGroup="Feedback" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="lableText">Email <span>*</span></span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" class="inputText" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvEmail" ErrorMessage="Email ID is required" Display="Dynamic"
                                Text="*" ControlToValidate="txtEmail" runat="server" ValidationGroup="Feedback" />
                            <asp:RegularExpressionValidator ID="regEmailAddr" ErrorMessage="Invalid Email ID"
                                ControlToValidate="txtEmail" Display="Dynamic" Text="*" ValidationGroup="Feedback"
                                runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="lableText">Phone </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" class="inputText" runat="server" MaxLength="12" />
                            <cc1:FilteredTextBoxExtender ID="txtPhone_FilteredTextBoxExtender" runat="server"
                                Enabled="True" TargetControlID="txtPhone" FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <span class="lableText">Purpose <span>*</span></span>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="dpdPurpose" runat="server" AutoPostBack="true" Width="280px"
                                        class="select">
                                        <asp:ListItem Value="0">Select Purpose</asp:ListItem>
                                        <asp:ListItem Value="1">Request for distribution</asp:ListItem>
                                        <asp:ListItem Value="2">Corporate gift</asp:ListItem>
                                        <asp:ListItem Value="3">Product query</asp:ListItem>
                                        <asp:ListItem Value="4">Testimony</asp:ListItem>
                                        <asp:ListItem Value="5">Product complaint</asp:ListItem>
                                        <asp:ListItem Value="6">Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Please Select Purpose"
                                        ControlToValidate="dpdPurpose" Text="*" ValidationGroup="Feedback" ValueToCompare="0"
                                        Operator="NotEqual" runat="server" />
                                    <asp:TextBox ID="txtOtherPurpose" Visible="false" style="margin-top:5px;" class="inputText" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Other Purpose is required"
                                        Display="Dynamic" Text="*" ControlToValidate="txtOtherPurpose" ValidationGroup="Feedback"
                                        runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <td>
                                <span class="lableText">Description <span>*</span></span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" Width="270px" TextMode="MultiLine"
                                    MaxLength="1200" class="textarea" />
                                <asp:RequiredFieldValidator ID="rfvDesc" ErrorMessage="Description is required" Display="Dynamic"
                                    Text="*" ControlToValidate="txtDescription" runat="server" ValidationGroup="Feedback" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" Text="Submit" ValidationGroup="Feedback" CssClass="inputButton ar"
                                    runat="server" />
                                <asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="Feedback" ShowMessageBox="true"
                                    ShowSummary="false" runat="server" />
                            </td>
                        </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>
