<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master"
    AutoEventWireup="true" CodeFile="NotificationEmailTemplateModify.aspx.vb" Inherits="adminpanel_Home" %>

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
                                             <h2 id="h2Category" runat="server">
                Add Notification Correspondence Template</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                           <h3>
                                                <li class="nobg"><a href="NotificationEmailTemplateList.aspx">Notification Correspondence Template
                    List</a>

                                           </h3>
                                            <asp:HiddenField ID="hdnCatId" Value="0" runat="server" />
                                                      </td>
                                    </tr>
                                </table> 
   
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlData" runat="server">
                  
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        <table style="width: 100%;" class="clsDataEnter">
                            <tr>
                                <td>
                                    <label>
                                        Name:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" class="text small">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTest" runat="server" ErrorMessage="*" class="note error"
                                        ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Subject:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSubject"  style="width:600px;"  class="text small" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqSubj" ErrorMessage="*" ControlToValidate="txtSubject" class="note error"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr runat="server">
                                <td colspan="2">
                                <a href="javascript:" onclick="$('#divHelp').toggle();return false;" >Show Help</a>
                                <div id="divHelp" style="display:none;" >
                                    <label>Note</label>
                                    For Feedback:
                                    <br />
                                        [[Name]] for name, [[Email]] for Email, [[Feedback]] for feedback message.
                                     <br /><br />
                                     For Recover Password: 
                                     <br />
                                        [[Name]] for name, [[Email]] for Username, [[Password]] for Password
                                     <br /><br />
                                     For Inquiry:
                                     <br />
                                     [[Name]] for Name, [[Bookname]] for BookName, [[Isbn]] for ISBN No, [[Email]] for Email address, [[Author]] for Author name, [[Publisher]] for Publisher name,[[Description]] for description.
                                     <br /><br />
                                     For Order Confirmation<br />
                                     [[Name]] for Name, [[OrderNo]] for Order No,[[OrderAmount]] for Order Amount <br />
                                     <br /><br />
                                     For Registration<br />
                                     [[Name]] for Name, [[UserName]] for User name, [[Password]] for password.
                                     </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Content:</label>
                                </td>
                                <td>
                                    <CKEditor:CKEditorControl Height="500px" ID="txtContent" runat="server"></CKEditor:CKEditorControl>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSave" runat="server" class="submit small" Text="Save" OnClick="btnSave_Click" />&nbsp;&nbsp;
                                    <asp:Button ID="btnCancel" runat="server" class="submit small" Text="Cancel" CausesValidation="False"
                                        OnClick="btnCancel_Click1" />
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
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
                <asp:PostBackTrigger ControlID="btnSave" />
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
