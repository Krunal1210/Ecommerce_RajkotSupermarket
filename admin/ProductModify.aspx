<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="ProductModify.aspx.vb" Inherits="admin_ProductModify" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
                Add Product Master</h2>
            <ul>
                <li class="nobg"><a href="ProductList.aspx">List Product Master</a></li>
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
                        <table style="width: 100%; margin-left: 20px; margin-top: 20px;" class="clsDataEnter">
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Brand:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdBrand" DataTextField="strName" DataValueField="brandId">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Select Any Brand" ControlToValidate="dpdBrand"
                                        Text="*" ValueToCompare="0" Operator="NotEqual" runat="server" ValidationGroup="vgSave" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Category:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdCat" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ErrorMessage="Select Any Category" ControlToValidate="dpdCat"
                                        Text="*" ValueToCompare="0" Operator="NotEqual" runat="server" ValidationGroup="vgSave" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Product Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Width="300px" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvProduct" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Product Name is required" ForeColor="Red" ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Descripation:</label>
                                </td>
                                <td colspan="3">
                                    <CKEditor:CKEditorControl ID="txtDesc" Width="800px" Height="300px" runat="server"></CKEditor:CKEditorControl>
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
        <%--    <div class="block_content">
            <p class="breadcrumb">
                <strong>Product Image</strong>
            </p>
            <asp:UpdatePanel ID="upPnlTaxAdd" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="Panel1" runat="server">
                        <table width="100%" cellspacing="0" cellpadding="0" class="form">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <div id="ltrlMsg1" runat="server">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Product Picture:</label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="imgupload" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <label>
                                            Is Main Image:</label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="Chkmainimage" runat="server" />
                                    </td>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSaveImage" Text="Save Picture" runat="server" class="submit long" />
                                        </td>
                                    </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSaveImage" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Repeater runat="server" ID="rptProdoctImg" OnItemCommand="rptProdoctImg_ItemCommand">
                <HeaderTemplate>
                    <table border="1" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <th>
                                Product Image
                            </th>
                            <th>
                                Is Main Image
                            </th>
                            <th>
                            </th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <img src="../userFiles/ProductImage/<%# Eval("ImageName") %>" height="60" width="60" />
                        </td>
                        <td>
                            <img src='images/<%#iif(convert.toBoolean(eval("IsMain")),"success.gif","error.gif")%>'
                                alt='<%#iif(convert.toBoolean(eval("IsMain")), "Yes", "No")%>' title='<%#iif(convert.toBoolean(eval("IsMain")), "Yes", "No")%>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text="Delete" runat="server" CommandArgument='<%# Eval("Id") %>'
                                OnClientClick='return confirm("Are You Sure Want To delete This Picture ? ")'
                                CommandName="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>--%>
        <!-- .block_content ends -->
        <div class="bendl">
        </div>
        <div class="bendr">
        </div>
    </div>
</asp:Content>
