<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster1.master" AutoEventWireup="true"
    CodeFile="BannerModify.aspx.vb" Inherits="Admin_LotModify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style>
.block table tr td, .block table tr th {
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
                                             <h2 id="h2Banner" runat="server">
                Add Banner</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="BannerList.aspx">
                    <img style="vertical-align: middle;" src="images/icon_list.gif">
                    List Banner</a></h3>
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
                                            Banner Name:</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" class="text small" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" ErrorMessage="Name is required."
                                            ControlToValidate="txtName" ValidationGroup="vg" CssClass="note error" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Banner Picture:</label>
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
                                    <td style="width: 25%;">
                                        <label>
                                            Display Order :</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOrder" runat="server" class="text small" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" ErrorMessage="Order is required."
                                            ControlToValidate="txtOrder" ValidationGroup="vg" CssClass="note error" runat="server" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Display In Home :</label>
                                    </td>
                                    <td>
                                         <asp:CheckBox Text="" ID="chkHome" runat="server" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Display In Cart :</label>
                                    </td>
                                    <td>
                                        <asp:CheckBox Text="" ID="chkCart" runat="server" />
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
