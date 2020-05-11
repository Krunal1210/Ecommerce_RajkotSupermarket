<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="PageModify.aspx.vb" ValidateRequest="false" Inherits="admin_SchoolModify" %>

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
                Add Page</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="PageList.aspx">
                    <img style="vertical-align: middle;" src="images/icon_list.gif">
                    List Page</a></h3>
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
                                        Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvName" runat="server" Display="Dynamic"  ControlToValidate="txtName"
                                        ErrorMessage="Name is required"></asp:RequiredFieldValidator>

                                       <a id="aUrl" runat="server" visible="false" href="javascript:" onclick="$('.clsSpnUrl').toggle(); return false;" >View Url</a>&nbsp;
                                            <span style="display:none;" class="clsSpnUrl" id="spnUrl" runat="server" visible="false" ></span> 

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Page Type</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpPageType" DataTextField="strPageType" DataValueField="bintPageTypeId" AutoPostBack="true" 
                                        runat="server">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="cmpValPageType" ErrorMessage="select Page Type" ControlToValidate="drpPageType"
                                        class="note error" ValueToCompare="0" Operator="NotEqual" runat="server" />
                                </td>
                            </tr>
                            <tr id="trHasPdf" runat='server' visible="false">
                                <td>
                                    <label>
                                        Has PDF?</label>
                                </td>
                                <td>
                                    <asp:CheckBox AutoPostBack="true" ID="chkHasPdf" runat="server" />
                                </td>
                            </tr>
                            <tr id="trContent" runat="server" visible="false">
                                <td>
                                    <label>
                                        Content:</label>
                                </td>
                                <td>
                                    <CKEditor:CKEditorControl ID="txtContent" runat="server"></CKEditor:CKEditorControl>
                                </td>
                            </tr>
                            <tr id="trPDF" runat="server" visible="false">
                                <td>
                                    <label>
                                        Upload PDF</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="fupPDF" runat="server" />
                                    <a id="aDownloadPdf" target="_blank" runat='server' visible="false">Download PDF</a>
                                    <asp:HiddenField ID="hdnPdfName" runat="server" />
                                </td>
                            </tr>
                            <tr id="trLink" runat="server" visible="false">
                                <td style="width: 20%">
                                    <label>
                                        Url Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUrl" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtUrl" ErrorMessage="Url is required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Upload Banner Image</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="fupBanner" runat="server" />
                                    <asp:HiddenField ID="hdnBannnerName" runat="server" />
                                    <br />
                                    <img style="height: 50px;" id="imgBannerImg" runat="server" />
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
                                    <asp:HiddenField ID="hdnPageId" runat="server" Value="0" />
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
