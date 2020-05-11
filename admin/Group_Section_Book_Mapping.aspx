<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="Group_Section_book_Mapping.aspx.vb" Inherits="admin_SchoolList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .AutoExtender {
            font-family: Verdana, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border: solid 1px #006699;
            line-height: 20px;
            background-color: White;
            overflow: scroll;
            height: 200px;
            overflow-x: hidden;
            text-align: left;
            padding-bottom: 25px;
            z-index: 10000000;
        }

        .AutoExtenderList {
            border-bottom: dotted 1px #801D80;
            cursor: pointer;
            color: Black;
        }

        .AutoExtenderHighlight {
            color: White;
            background-color: #3AAAD3;
            cursor: pointer;
        }
        .modalBackground {
    background-color: Black;
    opacity: 0.5;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnproductSectiD" runat="server" Value="0" />
    <div id="divModify" visible="false" runat="server" class="block">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>Add Group</h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                            <h3>
                                                <a href="Group_Section_product_Mapping.aspx">List Group</a></h3>
                                        </td>
                                    </tr>
                                </table>



                                <asp:UpdatePanel ID="upPnlTaxAdd" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlData" runat="server">
                                        </asp:Panel>
                                    </ContentTemplate>
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
    <div id="divList" runat="server" class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="Div1" class="widget">
                            <div class="widget-content">
                                <h2>Group Section product Mapping List</h2>

                                <asp:UpdatePanel runat="server" ID="updPnlListView">
                                    <ContentTemplate>
                                        <div style="padding: 10px;">
                                            <label>
                                                Select Group:</label>
                                            <asp:DropDownList ID="drpGrpSel" runat="server" DataTextField="strGroupName" DataValueField="bintGroupId"
                                                AutoPostBack="True">
                                            </asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                           
  
                        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Repeater ID="rptSectionList" runat="server">
                <ItemTemplate>
                    
                        <div id="target-1" class="widget">
                             <table border="0" cellpadding="0" cellspacing="0" width="97%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>
                                <%# Eval("strSectionName")%></h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                           <asp:LinkButton ID="lnkAddproduct" OnClick="lnkAddproduct_ShowPopup" CommandName='<%# Eval("strSectionName")%>'
                                        CommandArgument='<%# Eval("bintSectionId")%>' runat="server">
                                        <img style="vertical-align: middle;" src="images/addIcon.gif"> Add product
                                    </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
          
                           
                           
                            <asp:HiddenField ID="hdnFldSecId" runat="server" Value='<%# Eval("bintSectionId")%>' />
                        </div>
                        <!-- .block_head ends -->
                        <div class="block_content">
                            <asp:Repeater ID="rptSectionproducts" runat="server">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" width="97%">
                                        <thead>
                                            <tr>
                                                <th>product Name
                                                </th>
                                               <%-- <th>Author Name
                                                </th>--%>
                                                <th>Order
                                                </th>
                                                <th>&nbsp;
                                                </th>
                                                <th>&nbsp;
                                                </th>
                                            </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("strproname")%>
                                        </td>
                                       <%-- <td>
                                            <%# Eval("strAuthor")%>
                                        </td>--%>
                                        <td>
                                            <%# Eval("intOrder")%>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkbtnEditproductgrp" CommandArgument='<%# Eval("bintGrpSecbintproductid") %>'
                                                OnClick="lnkEditproduct" Text="Edit" runat="server" />
                                            <asp:HiddenField ID="hdnId" runat="server" Value='<%# Eval("SectionID") %>' />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkBtnDelproductGrp" CommandArgument='<%# Eval("bintGrpSecbintproductid") %>'
                                                OnClientClick="return confirm('Do you want to delete this product?')" OnClick="lnkDeleteproduct"
                                                Text="Delete" runat="server" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                          
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
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
    <asp:UpdatePanel ID="updPnlBanner" runat="server">
        <ContentTemplate>
            <div id="divListBanner" runat="server" visible="false" class="block">
                <div class="block_head">
                    <div class="bheadl">
                    </div>
                    <div class="bheadr">
                    </div>
                    <h2>Banners</h2>
                    <ul>
                        <li>
                            <asp:LinkButton ID="lnkAddBanner" OnClick="lnkAddBanner_ShowPopup" runat="server">
                                        <img style="vertical-align: middle;" src="images/addIcon.gif" />&nbsp;Add Banner
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <!-- .block_head ends -->
                <div class="block_content">
                    <asp:Repeater ID="rptBanner" runat="server">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Banner Image
                                        </th>
                                        <th>Banner Name
                                        </th>
                                        <th>Category
                                        </th>
                                        <th>Order
                                        </th>
                                        <th>&nbsp;
                                        </th>
                                    </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <img src='../userFiles/imgBannerFiles/<%# Eval("strBannerImage")%>' width="40px" />
                                </td>
                                <td>
                                    <%# Eval("strBannerName")%>
                                </td>
                                <td>
                                    <%# Eval("strCategoryName")%>
                                </td>
                                <td>
                                    <%# Eval("intOrder")%>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkBtnDelproductGrp" CommandArgument='<%# Eval("bintGroupBannerId") %>'
                                        OnClientClick="return confirm('Do you want to delete this banner?')" OnClick="lnkDeleteBanner"
                                        Text="Delete" runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <!-- .block_content ends -->
                <div class="bendl">
                </div>
                <div class="bendr">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPnlPopup" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAddproduct" runat="server">
              <div id="div2" runat="server" class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                          <div id="Div3" class="widget">
                            <div class="widget-content">
                         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                           <h2 id="h2AddproductPopup" runat="server">Add product</h2>
                                        </td>
                                        <td style="float: right; border: none;">
                                            <asp:HiddenField ID="hdnSecIdPopup" runat="server" />
                                <asp:LinkButton ID="lnkClosePopup" runat="server">Close</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                      
                      
                       
                  
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                            <ContentTemplate>
                                <table width="100%" cellspacing="0" cellpadding="0" class="form">
                                    <tbody>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Literal ID="ltrlMsgPopup" Text="" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>
                                                    Select product:</label>
                                                <asp:TextBox ID="txtAddproductPopup" AutoPostBack="true" class="text small" runat="server" />
                                                  <cc1:AutoCompleteExtender ID="txtSearchBox_AutoCompleteExtender" TargetControlID="txtAddproductPopup"
                                                                            runat="server" DelimiterCharacters="" Enabled="True" ServicePath="~/webHandler/Autocomplete.asmx"
                                                                            ServiceMethod="productSearch" CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                                                                            CompletionListHighlightedItemCssClass="AutoExtenderHighlight" CompletionListElementID="divwidth"
                                                                            CompletionInterval="0" ShowOnlyCurrentWordInCompletionListItem="true" CompletionSetCount="15">
                                                                        </cc1:AutoCompleteExtender>
                                               <%-- <cc1:AutoCompleteExtender ID="txtAddproductPopup_AutoCompleteExtender" runat="server"
                                                    DelimiterCharacters="" CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                                                    CompletionListHighlightedItemCssClass="AutoExtenderHighlight" Enabled="True" ServicePath="~/webServ/BookListAutoComp.asmx"
                                                    MinimumPrefixLength="1" CompletionInterval="200" ServiceMethod="BookSearch" TargetControlID="txtAddproductPopup">
                                                </cc1:AutoCompleteExtender>--%>
                                                <asp:RequiredFieldValidator ErrorMessage="product Name is required." class="note error"
                                                    Display="None" ValidationGroup="vgPopup" ControlToValidate="txtAddproductPopup"
                                                    runat="server" />
                                                <asp:HiddenField ID="hdnbintproductidPopup" runat="server" />
                                            </td>
                                            <td>
                                                <label>
                                                    Order:</label>
                                                <asp:TextBox ID="txtAddproductOrder" class="text small" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="product Order is required."
                                                    class="note error" Display="None" ValidationGroup="vgPopup" ControlToValidate="txtAddproductOrder"
                                                    runat="server" />
                                                <asp:CompareValidator ErrorMessage="Invalid product Order" ControlToValidate="txtAddproductOrder"
                                                    class="note error" Display="None" ValidationGroup="vgPopup" Operator="DataTypeCheck"
                                                    Type="Integer" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSavePopup" Text="Save" runat="server" class="submit small" ValidationGroup="vgPopup" />
                                                <asp:ValidationSummary ID="valSum" ValidationGroup="vgPopup" ShowMessageBox="true"
                                                    ShowSummary="false" runat="server" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
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
            </asp:Panel>
            <div style="display: none;">
                <asp:Button ID="btnShowPopup" Text="" runat="server" />
                <asp:Button ID="btnClosePopup" Text="" runat="server" />
            </div>
            <cc1:ModalPopupExtender ID="mpeproductAdd" runat="server" DynamicServicePath="" Enabled="True"
                TargetControlID="btnShowPopup" CancelControlID="btnClosePopup" PopupControlID="pnlAddproduct"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPnlBannerPopup" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAddBanner" runat="server">
                <div class="block">
                    <div class="block_head">
                        <div class="bheadl">
                        </div>
                        <div class="bheadr">
                        </div>
                        <h2 id="h1BannerAdd" runat="server">Add Banner</h2>
                        <ul>
                            <li>
                                <asp:HiddenField ID="hdnGroupBannerId" runat="server" Value="0" />
                                <asp:LinkButton ID="lnkCloseGroupBanner" runat="server">Close</asp:LinkButton></li>
                        </ul>
                    </div>
                    <!-- .block_head ends -->
                    <div class="block_content">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                            <ContentTemplate>
                                <table width="100%" cellspacing="0" cellpadding="0" class="form">
                                    <tbody>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Literal ID="ltrlMsgGrpBanner" Text="" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>
                                                    Banner Name:</label>
                                                <asp:TextBox ID="txtBannerPopupName" class="text small" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Banner Name is required."
                                                    class="note error" Display="None" ValidationGroup="vgBannerPopup" ControlToValidate="txtBannerPopupName"
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <label>
                                                    Banner Image:</label>
                                                <asp:FileUpload ID="fupBannerImage" runat="server" />
                                                <br />
                                                <small>Please Upload 745px width X 279px height image</small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>
                                                    <asp:RadioButtonList ID="radCatBannerList" AutoPostBack="true" RepeatDirection="Horizontal"
                                                        RepeatLayout="Flow" runat="server">
                                                        <asp:ListItem Text="Category" Selected="True" Value="cat" />
                                                        <asp:ListItem Text="Url" Value="url" />
                                                    </asp:RadioButtonList>
                                                </label>
                                                <asp:DropDownList ID="drpBannerPopupCategory" DataTextField="CategoryName" DataValueField="CategoryId"
                                                    runat="server">
                                                </asp:DropDownList>
                                                <asp:CompareValidator ID="cmpValBannerPopupCategory" ErrorMessage="Select Category"
                                                    ControlToValidate="drpBannerPopupCategory" Operator="NotEqual" ValueToCompare="0"
                                                    ValidationGroup="vgBannerPopup" Display="None" runat="server" />
                                                <asp:TextBox ID="txtBannerUrl" class="text small" Visible="false" runat="server" />
                                                <asp:RequiredFieldValidator ID="rfvBannerUrl" Visible="false" ErrorMessage="Banner Url is required."
                                                    class="note error" Display="None" ValidationGroup="vgBannerPopup" ControlToValidate="txtBannerUrl"
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <label>
                                                    Description</label>
                                                <asp:TextBox ID="txtBannerPopupDesc" TextMode="MultiLine" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>
                                                    Order:</label>
                                                <asp:TextBox ID="txtBannerPopupOrder" class="text small" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Order is required."
                                                    class="note error" Display="None" ValidationGroup="vgBannerPopup" ControlToValidate="txtBannerPopupOrder"
                                                    runat="server" />
                                                <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Invalid Order No." ControlToValidate="txtBannerPopupOrder"
                                                    class="note error" Display="None" ValidationGroup="vgBannerPopup" Operator="DataTypeCheck"
                                                    Type="Integer" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnBannerAdd" Text="Add" runat="server" class="submit small" ValidationGroup="vgBannerPopup" />
                                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="vgBannerPopup" ShowMessageBox="true"
                                                    ShowSummary="false" runat="server" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <!-- .block_content ends -->
                    <div class="bendl">
                    </div>
                    <div class="bendr">
                    </div>
                </div>
            </asp:Panel>
            <div style="display: none;">
                <asp:Button ID="btnShowBannerPopup" Text="" runat="server" />
                <asp:Button ID="btnCloseBannerPopup" Text="" runat="server" />
            </div>
            <cc1:ModalPopupExtender ID="mpeBannerAdd" runat="server" DynamicServicePath="" Enabled="True"
                TargetControlID="btnShowBannerPopup" CancelControlID="btnCloseBannerPopup" PopupControlID="pnlAddBanner"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnBannerAdd" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
