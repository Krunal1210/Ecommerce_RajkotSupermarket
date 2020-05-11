<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Grievances.ascx.vb" Inherits="userControls_Grievances" %>
<style type="text/css">
    .inputForm
    {
        border: 1px solid #BBBBBB;
        color: #444444;
        font-size: 13px;
        font-weight: bold;
        padding: 5px;
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
</style>
<asp:UpdatePanel ID="updPnlGriev" runat="server">
    <ContentTemplate>
        <asp:Panel ID="pnlData" runat="server">
            <table width="100%" border="0" cellspacing="10px" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <h1 class="title_02">
                            Post Your Complaints / Grievances
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <small>Fields mark with ( <b style="color: Red;">*</b> ) are mandatory </small>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label class="lblForm" id="lblMsg" runat="server" style="color: Green;">
                        </label>
                    </td>
                </tr>
                <tr>
                    <td  style="width:300px;" >
                        <label class="lblForm">
                            Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" class="inputForm" runat="server" />
                        <span style="color: Red;" class="spnForm">*</span>
                        <asp:RequiredFieldValidator ID="rfvName" ErrorMessage="Name is required" Display="None"
                            ControlToValidate="txtName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            E-mail id</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" class="inputForm" runat="server" /><span style="color: Red;"
                            class="spnForm">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Email ID is required"
                            Display="None" ControlToValidate="txtEmail" runat="server" />
                        <asp:RegularExpressionValidator ID="regEmailAddr" ErrorMessage="Invalid Email ID"
                            ControlToValidate="txtEmail" Display="None" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Mobile No
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobileNo" class="inputForm" runat="server" />
                        <span style="color: Red;" class="spnForm">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Mobile No is required"
                            Display="None" ControlToValidate="txtMobileNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Phone No
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhoneNo" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Status
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList class="inputForm" ID="drpStatus" Style="width: 170px;" 
                            runat="server" AutoPostBack="True">
                            <asp:ListItem Text="Employee" Value="Employee" />
                            <asp:ListItem Text="Employer" Value="Employer" />
                            <asp:ListItem Text="Trade Union" Value="Trade Union" />
                            <asp:ListItem Text="Others" Value="Others" />
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtOther" class="inputForm" Visible="false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Nature
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList class="inputForm" ID="drpNature" Style="width: 170px;" runat="server">
                            <asp:ListItem Text="Settlement Claim" Value="Settlement Claim" />
                            <asp:ListItem Text="Non Enrollnment as Member" Value="Non Enrollnment as Member" />
                            <asp:ListItem Text="Issuance of Code Nos" Value="Issuance of Code Nos" />
                            <asp:ListItem Text="Date of Submission of Application" Value="Date of Submission of Application" />
                            <asp:ListItem Text="Reducing Benefits" Value="Reducing Benefits" />
                            <asp:ListItem Text="Non Remittance of Contribution After Deduction" Value="Non Remittance of Contribution After Deduction" />
                            <asp:ListItem Text="Non Attestation of Claim Forms" Value="Non Attestation of Claim Forms" />
                            <asp:ListItem Text="PF Slip" Value="PF Slip" />
                            <asp:ListItem Text="Pension" Value="Pension" />
                            <asp:ListItem Text="Balance Inquiry" Value="Balance Inquiry" />
                            <asp:ListItem Text="Transfer" Value="Transfer" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            PF Account No</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPFAccNo" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            PPO No&nbsp;(if any)</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPPONo" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Date Of Submission</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDOS" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Office Where Submitted</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOfficeSub" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Reference No</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRefNo" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="lblForm">
                            Details (if Any)</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDetails" TextMode="MultiLine" class="inputForm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr style="border: #CCCCCC solid 1px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnPostGrievance" class="inputForm" Text="Post Grievance" runat="server" />
                        <asp:UpdateProgress ID="updPrgGrie" runat="server">
                            <ProgressTemplate>
                                <img style="margin-top: -33px; margin-left: 130px;" src="<%= App.value("siteUrl") %>images/spinner.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" ShowSummary="false"
                runat="server" />
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
