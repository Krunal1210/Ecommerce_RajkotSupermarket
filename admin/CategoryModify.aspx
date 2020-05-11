<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="CategoryModify.aspx.vb" Inherits="admin_CategoryModify" %>

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
                Add Category</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="CategoryList.aspx">
                    <img style="vertical-align: middle;" src="images/icon_list.gif">
                    List Category</a></h3>
                                        </td>
                                    </tr>
                                </table>
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
                                        Category Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCat" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvCategory" runat="server" ControlToValidate="txtCat"
                                        ErrorMessage="Category Name is required" ForeColor="Red" ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Display Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDisplayname" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDisplayname"
                                        ErrorMessage="Display Name is required" ForeColor="Red" ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;">
                                    <label>
                                        Parent Category:</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpParCategory" DataTextField="strCategoryName" DataValueField="bintCategoryId"
                                        runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 25%;">
                                    <label>
                                        Category Picture:</label>
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
                                <td style="width: 20%">
                                    <label>
                                        Display Order:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCode" runat="server" class="text small"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="txtCode_FilteredTextBoxExtender" runat="server"
                                        Enabled="True" TargetControlID="txtCode" FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                             <tr>
                                <td style="width: 20%">
                                    <label>
                                        Display Home:</label>
                                </td>
                                <td>
                                    <asp:CheckBox Text="" ID="chkHome" runat="server" />
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
                   
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
        <!-- .block_content ends -->
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
