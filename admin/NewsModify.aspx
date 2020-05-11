<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="NewsModify.aspx.vb" ValidateRequest="false" Inherits="admin_SchoolModify" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
                Add News</h2>
            <ul>
                <li class="nobg"><a href="NewsList.aspx">List News</a></li>
            </ul>
        </div>
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
                                        News Title:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewsTitle" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvName" runat="server" ControlToValidate="txtNewsTitle"
                                        ErrorMessage="News Title is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Content:</label>
                                </td>
                                <td>
                                     <CKEditor:CKEditorControl ID="txtContent" runat="server"></CKEditor:CKEditorControl>
                                </td>
                            </tr>
                             <tr>
                                <td style="width: 20%">
                                    <label>
                                        News Date:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewsDate" runat="server" class="text small"></asp:TextBox>
                                    <cc1:CalendarExtender ID="txtTenderLastDate_CalendarExtender"  runat="server" 
                                        Enabled="True" TargetControlID="txtNewsDate">
                                    </cc1:CalendarExtender>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtNewsDate" ErrorMessage="News Date is required"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cmpDateVal1" ErrorMessage="invalid Date" ControlToValidate="txtNewsDate"
                                        Type="Date" Operator="DataTypeCheck" class="note error" Display="Dynamic" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    <label>
                                        Is on Homepage:</label>
                                </td>
                                <td>
                                    <asp:CheckBox id="chkIsOnHomePage" runat="server" />
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
                                    <asp:HiddenField ID="hdnNewsId" runat="server" Value="0" />
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
