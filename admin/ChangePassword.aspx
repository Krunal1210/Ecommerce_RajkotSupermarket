<%@ Page Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="ChangePassword.aspx.vb" Inherits="User_home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                              <h2 id="h2Title" runat="server">
                change password</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                          
                                        </td>
                                    </tr>
                                </table>
      
                <asp:Panel ID="pnlData" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">
                                <div id="divMsg" runat="server">
                                </div>
                            </td>
                        </tr>
                         
                        <tr>
                            <td style="vertical-align: top; color: green;">
                                <label>
                                    Current Password</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurPassword" runat="server" TextMode="Password" class="text small"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="input-notification error png_bg"
                                    Display="Dynamic" Style="font-weight: bold;" ControlToValidate="txtCurPassword"
                                    runat="server" ErrorMessage="Enter Current Password"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; color: green;">
                                <label>
                                    New Password</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPassword" runat="server"  TextMode="Password" class="text small"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="input-notification error png_bg"
                                    Display="Dynamic" Style="font-weight: bold;" ControlToValidate="txtNewPassword"
                                    runat="server" ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; color: green;">
                                <label>
                                    Re-Enter New Password</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfNewPassword" runat="server"  TextMode="Password" class="text small"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="input-notification error png_bg"
                                    Display="Dynamic" Style="font-weight: bold;" ControlToValidate="txtConfNewPassword"
                                    runat="server" ErrorMessage="Re-Enter New Password"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtConfNewPassword"
                                    ControlToCompare="txtNewPassword" Type="String" Display="Dynamic" Operator="Equal" 
                                    ErrorMessage="Both Passwords Must be same" Style="font-weight: bold;" CssClass="input-notification error png_bg">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class="submit small" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
                            <!-- /widget-content -->
                        </div>
                        <!-- /widget -->
                    </div>
                    <!-- .block_content ends -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /main-inner -->
    </div>
</asp:Content>
