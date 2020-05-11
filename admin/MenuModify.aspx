<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="MenuModify.aspx.vb" ValidateRequest="false" Inherits="admin_SchoolModify" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
                Add Menu</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="MenuList.aspx">
                    <img style="vertical-align: middle;" src="images/icon_list.gif">
                    List Menu</a></h3>
                                        </td>
                                    </tr>
                                </table>
        <!-- .block_head ends -->
        <asp:UpdatePanel runat="server" ID="updPnlContent">
            <ContentTemplate>
                <asp:Panel ID="pnlData" runat="server">
                    <div id="divContent" class="block_content">
                        <div id="divMsg" runat="server">
                        </div>
                        <table style="width: 100%;" class="clsDataEnter">
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Select Page</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpPage" DataTextField="strPageName" DataValueField="bintPageId"
                                        runat="server">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ErrorMessage="select page" ControlToValidate="drpPage" ValueToCompare="-1"
                                        Operator="NotEqual" class="note error" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Is On Top Menu</label>
                                </td>
                                <td>
                                    <asp:CheckBox AutoPostBack="true" ID="chkIsOnTopMenu" runat="server" />
                                </td>
                            </tr>
                            <tr id="trTopMenuParent" runat="server" visible="false">
                                <td>
                                    <label>
                                        Top Menu Parent</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpTopMenuParId" DataTextField="strPageName" DataValueField="bintPageId"
                                        runat="server">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator3" ErrorMessage="invalid selection" 
                                        ControlToValidate="drpTopMenuParId" ControlToCompare="drpPage"
                                        Operator="NotEqual" class="note error" runat="server" />
                                </td>
                            </tr>
                            <tr id="trTopMenuOrder" runat="server" visible="false">
                                <td>
                                    <label>
                                        Top Menu Order</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTopMenuOrder" Text="1" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvName" runat="server" ControlToValidate="txtTopMenuOrder"
                                        Display="Dynamic" ErrorMessage="Order is required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ErrorMessage="invalid Number" ControlToValidate="txtTopMenuOrder"
                                        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" class="note error"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Is On Page Bottom Menu</label>
                                </td>
                                <td>
                                    <asp:CheckBox AutoPostBack="true" ID="chkIsOnPageBottom" runat="server" />
                                </td>
                            </tr>
                            <tr id="trPageBottomOrder" runat="server" visible="false">
                                <td>
                                    <label>
                                        Page Bottom Menu Order</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPageBottomOrder" Text="1" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtPageBottomOrder" Display="Dynamic" ErrorMessage="Order is required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" ErrorMessage="invalid Number" ControlToValidate="txtPageBottomOrder"
                                        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" class="note error"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Is On HomePage</label>
                                </td>
                                <td>
                                    <asp:CheckBox AutoPostBack="true" ID="chkIsOnHomePage" runat="server" />
                                </td>
                            </tr>
                            <tr id="trHomePageMenuParent" runat="server" visible="false">
                                <td>
                                    <label>
                                        Home Page Menu Parent</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpHomeMenuParent" DataTextField="strPageName" DataValueField="bintPageId"
                                        runat="server">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator4" ErrorMessage="invalid selection" 
                                        ControlToValidate="drpHomeMenuParent" ControlToCompare="drpPage"
                                        Operator="NotEqual" class="note error" runat="server" />
                                </td>
                            </tr>
                            <tr id="trHomePageOrder" runat="server" visible="false">
                                <td>
                                    <label>
                                        Home Page Menu Order</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHomePageOrder" Text="1" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="txtHomePageOrder" Display="Dynamic" ErrorMessage="Order is required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator2" ErrorMessage="invalid Number" ControlToValidate="txtHomePageOrder"
                                        Operator="DataTypeCheck" Type="Integer" Display="Dynamic" class="note error"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" class="submit small" Text="Save" />
                                    <asp:HiddenField ID="hdnMenuId" runat="server" Value="0" />
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
