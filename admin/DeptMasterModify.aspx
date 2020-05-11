<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="DeptMasterModify.aspx.vb" Inherits="admin_DeptMasterModify" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="block">
        <div class="block_head">
            <div class="bheadl">
            </div>
            <div class="bheadr">
            </div>
            <h2 id="h2Title" runat="server">
                Add Dept</h2>
            <ul>
                <li class="nobg"><a href="DeptMasterList.aspx">List Dept</a></li>
            </ul>
        </div>
        <!-- .block_head ends -->
        <asp:UpdatePanel runat="server" ID="updPnlContent">
            <ContentTemplate>
                <asp:Panel ID="pnlData" runat="server">
                    <asp:ValidationSummary ID="vsSave" runat="server" ValidationGroup="vgSave" ShowMessageBox="true"
                        ShowSummary="false" ForeColor="Red" />
                    <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
                    <div id="divContent" class="block_content">
                        <div id="divMsg" runat="server">
                        </div>
                        <table style="width: 100%;" class="clsDataEnter">
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Dept Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCat" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvDeptMaster" runat="server" ControlToValidate="txtCat"
                                        ErrorMessage="DeptMaster Name is required" ForeColor="Red" ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                             
                            <tr>
                                <td style="width: 25%;">
                                    <label>
                                        DeptMaster Picture:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="imgupload" runat="server" />
                                    <br />
                                    <img runat="server" id="imgedit" style="width: 100px;" />
                                    <asp:HiddenField runat="server" ID="hdnedit" Value="" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Descripation:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" class="text small"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" class="submit small" Text="Save" ValidationGroup="vgSave" />
                                    <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" AssociatedUpdatePanelID="updPnlContent"
                                        runat="server">
                                        <ProgressTemplate>
                                            <img style="float: left; margin-top: -35px; margin-left: 100px;" src="images/loading.gif">
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
        <!-- .block_content ends -->
        <div class="bendl">
        </div>
        <div class="bendr">
        </div>
    </div>
</asp:Content>
