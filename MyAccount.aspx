<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master"
    AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="MyAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    </div>

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liHome" runat="server"> My Account Information</span></li>
    </ul>
    <br />
               <h1  id="h2Header" runat="server"> My Account Information</h1>  
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 7px;" >
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Company Name</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" CssClass="inputBox" Width="250px" ID="txtCompany" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>First Name</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" CssClass="inputBox" Width="250px" ID="txtFirst" />
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtFirst"
                                FilterType="UppercaseLetters,LowercaseLetters" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="First Name is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtFirst" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Last Name</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" CssClass="inputBox" Width="250px" ID="txtLast" />
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtLast"
                                FilterType="UppercaseLetters,LowercaseLetters" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Last Name is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtLast" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Address</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" CssClass="inputBox" TextMode="MultiLine" Width="250px" Height="70px" ID="txtAdd" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Address is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtAdd" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>City</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" CssClass="inputBox" Width="250px" ID="txtCity" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="City is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtCity" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>State</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:DropDownList runat="server" CssClass="selectBox" Width="250px" ID="dpdstate">
                                <asp:ListItem Value="0">Select State</asp:ListItem>
                                <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                <asp:ListItem>Assam</asp:ListItem>
                                <asp:ListItem>Bihar</asp:ListItem>
                                <asp:ListItem>Chandigarh</asp:ListItem>
                                <asp:ListItem>Chhattisgarh</asp:ListItem>
                                <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                <asp:ListItem>Daman and Diu</asp:ListItem>
                                <asp:ListItem>Delhi</asp:ListItem>
                                <asp:ListItem>Goa</asp:ListItem>
                                <asp:ListItem>Gujarat</asp:ListItem>
                                <asp:ListItem>Haryana</asp:ListItem>
                                <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                <asp:ListItem>Jharkhand</asp:ListItem>
                                <asp:ListItem>Karnataka</asp:ListItem>
                                <asp:ListItem>Kerala</asp:ListItem>
                                <asp:ListItem>Lakshadweep</asp:ListItem>
                                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                <asp:ListItem>Maharashtra</asp:ListItem>
                                <asp:ListItem>Manipur</asp:ListItem>
                                <asp:ListItem>Meghalaya</asp:ListItem>
                                <asp:ListItem>Mizoram</asp:ListItem>
                                <asp:ListItem>Nagaland</asp:ListItem>
                                <asp:ListItem>Orissa</asp:ListItem>
                                <asp:ListItem>Pondicherry</asp:ListItem>
                                <asp:ListItem>Punjab</asp:ListItem>
                                <asp:ListItem>Rajasthan</asp:ListItem>
                                <asp:ListItem>Sikkim</asp:ListItem>
                                <asp:ListItem>Tamil Nadu</asp:ListItem>
                                <asp:ListItem>Tripura</asp:ListItem>
                                <asp:ListItem>Uttarakhand</asp:ListItem>
                                <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                <asp:ListItem>West Bengal</asp:ListItem>
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Please Select State" ControlToValidate="dpdstate"
                                Text="*" ValueToCompare="0" ValidationGroup="vg" Operator="NotEqual" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Country</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" Width="250px" CssClass="inputBox" ID="txtContry" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Country is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtContry" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Phone</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" Width="250px" CssClass="inputBox" ID="txtPhone" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Phone is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtPhone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Zip Code</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" MaxLength="6" CssClass="inputBox" Width="250px" ID="txtZip" />
                            <asp:RangeValidator ID="RangeValidator1" ErrorMessage="Enter Valid ZipCode" MaximumValue="999999"
                                MinimumValue="100000" Type="Integer" ValidationGroup="vg" ControlToValidate="txtZip"
                                runat="server" Text="*" />
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtZip"
                                FilterType="Numbers" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Email Address</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" Width="250px" CssClass="inputBox" ID="txtEmail" ReadOnly="true" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Email is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtEmail" runat="server" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="vg"
                                runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Password</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" TextMode="Password" CssClass="inputBox" Width="250px" ID="txtPassword" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ErrorMessage="Password is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtPassword" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <label>Confirm Password</label>
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox runat="server" TextMode="Password" CssClass="inputBox" Width="250px" ID="txtConfirm" />
                            <asp:CompareValidator ID="CompareValidator111" ErrorMessage="Please Enter Both Password Same"
                                ControlToValidate="txtConfirm" ControlToCompare="txtPassword" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ErrorMessage="Confirm Password is Required"
                                ValidationGroup="vg" Text="*" ControlToValidate="txtConfirm" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title2" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="title2">
                            &nbsp;
                        </td>
                        <td align="left" valign="top" class="bg2">
                            <asp:Button Text="Update Account" CssClass="buttonShort" ID="btnSignUp" ValidationGroup="vg"
                                runat="server"></asp:Button>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                                ShowSummary="false" ValidationGroup="vg" DisplayMode="List" />
                        </td>
                    </tr>
                </table>
           
</asp:Content>
