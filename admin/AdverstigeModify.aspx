<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="true"
    CodeFile="AdverstigeModify.aspx.vb" Inherits="admin_Addv" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .block table tr td, .block table tr th
        {
            border-bottom: 0px solid #CCCCCC;
            line-height: normal;
            padding: 10px;
            text-align: left;
        }
    </style>
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
                                            <h2 id="h2Adverstige" runat="server">
                Add Advertisement</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="AdverstigeList.aspx">
                    <img style="vertical-align: middle;" src="images/icon_list.gif">
                    List Advertisement</a></h3>
                                        </td>
                                    </tr>
                                </table>
     
            <asp:UpdatePanel ID="upPnlTaxAdd" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlData" runat="server">
                        <div id="divMsg" runat="server">
                        </div>
                        <table width="100%" cellspacing="0" cellpadding="0" class="form">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <asp:Literal ID="ltrlMsg" Text="" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Advertisement Name:</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" class="text small" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" ErrorMessage="Name is required."
                                            ControlToValidate="txtName" ValidationGroup="vg" CssClass="note error" runat="server" />
                                    </td>
                                </tr>
                                <tr runat="server" visible="false">
                                    <td>
                                        <label>
                                            Advertisement Location :</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dpdLocation" runat="server">
                                            <asp:ListItem Text="-- Select Location --" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="On Home" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="On Trade 1" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="On Trade 2" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="On Trade 3" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:CompareValidator ID="CompareValidator3" ErrorMessage="Please Select Location"
                                            ControlToValidate="dpdLocation" ValueToCompare="0" ValidationGroup="vg" Operator="NotEqual"
                                            class="note error" Text="*" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Advertisement Picture:</label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="imgupload" runat="server" />
                                        <br />
                                        <img runat="server" id="imgedit" style="width: 100px;" />
                                        <asp:HiddenField runat="server" ID="hdnedit" Value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Url :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUrl" runat="server" Width="300px" class="text small" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Text="*" ErrorMessage="Url is required."
                                            ControlToValidate="txtUrl" ValidationGroup="vg" CssClass="note error" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            Order By :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOrder" runat="server" class="text small"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="filterorder" runat="server" TargetControlID="txtOrder"
                                            FilterType="Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSave" Text="Save" runat="server" class="submit small" ValidationGroup="vg"
                                            OnClick="btnSave_Click" />
                                        <asp:ValidationSummary ID="valSum" runat="server" HeaderText="Please solve following errors"
                                            DisplayMode="BulletList" ValidationGroup="vg" ShowMessageBox="true" ShowSummary="false" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSave" />
                </Triggers>
            </asp:UpdatePanel>
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
