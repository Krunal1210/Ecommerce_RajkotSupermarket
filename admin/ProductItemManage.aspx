<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="ProductItemManage.aspx.vb" Inherits="admin_ProductItemManage" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        label {
    color: #333333;
    display: inline;
    margin-bottom: 5px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="main" runat="server" visible="false" id="dvlist">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="target-1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                            <h2>
                                                Product List</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="ProductItemManage.aspx?id=0"> <img style="vertical-align: middle;" src="images/addIcon.gif">Add Product</a></h3>
                                        </td>
                                    </tr>
                                </table> 
    
     
            <asp:UpdatePanel runat="server" ID="updpnllistview">
                <ContentTemplate>
                    
                    <table width="100%" border="0">
                        <tr>
                            <td>Division:</td>
                            <td>
                                <asp:DropDownList runat="server" ID="dpddivision1" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                </asp:DropDownList>
                            </td>
                            <td>Section:</td>
                            <td>
                                <asp:DropDownList runat="server" ID="dpdSec1" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                </asp:DropDownList>
                            </td>
                            <td>Dept:</td>
                            <td>
                                <asp:DropDownList runat="server" ID="dpdDept1" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Brand </td>
                            <td>
                                <asp:DropDownList runat="server" ID="dpdbrand1" DataTextField="strName" DataValueField="brandId">
                                </asp:DropDownList>
                            </td>
                            <td>Product </td>
                            <td>
                                <asp:TextBox ID="txtprod" runat="server" Width="200px" class="text small"></asp:TextBox>
                            </td>
                           <td>Barcode </td>
                            <td>
                                <asp:TextBox ID="txtbcode" runat="server" Width="200px" class="text small"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                             <td>
                                  <asp:Button ID="btnSearch" runat="server" class="submit small" Text="Search"  /> 

                            &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnreset" runat="server" class="submit small" Text="Reset"  />

                            </td>
                            <td colspan="2"> <asp:UpdateProgress ID="UpdateProgress2" DynamicLayout="true" AssociatedUpdatePanelID="updPnlListView"
                runat="server">
                <ProgressTemplate>
                    <img style="float: left;  " src="images/loading.gif">
                </ProgressTemplate>
            </asp:UpdateProgress></td>
                        </tr>
                    </table>
                        
                    <table>
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintProductId" DataSourceID="SqlDataSource1">
                            <EmptyDataTemplate>
                                <table id="Table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <center>
                                                No Product exists. .</center>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <input type="checkbox" id="<%# Eval("bintProductId") %>" class="chkCld" />
                                    </td>
                                    <td>
                                        <%# Eval("Division")%>
                                    </td>
                                    <td>
                                        <%# Eval("Section")%>
                                    </td>
                                    <td>
                                        <%# Eval("Dept")%>
                                    </td>

                                    <td>
                                        <%# Eval("strProName")%>
                                    </td>
                                    <td>
                                        <%# Eval("brand")%>
                                    </td>

                                    <td>
                                        <%# Eval("price")%>
                                    </td>
                                    <td>
                                        <%# Eval("lprice")%>
                                    </td>
                                    <td>
                                        <%# Eval("weight")%>
                                    </td>
                                    <td>
                                        <img src="../userFiles/ProductImage/<%# Eval("strImage") %>" width="60px" height="50px" />
                                    </td>


                                    <td>
                                        <img src='images/<%#iif(convert.toBoolean(eval("bitIsInStock")),"success.gif","error.gif")%>'
                                            alt='<%#iif(convert.toBoolean(eval("bitIsInStock")), "Yes", "No")%>' title='<%#iif(convert.toBoolean(eval("bitIsInStock")), "Yes", "No")%>' />
                                    </td>

                                    <td class="delete">
                                        <a href="ProductItemManage.aspx?id=<%# Eval("bintProductId") %>">Edit</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="itemPlaceholderContainer" runat="server" cellpadding="0" cellspacing="0"
                                    width="100%">
                                    <thead>
                                        <tr>
                                            <th>
                                                <input type="checkbox" class="check_all" />
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton4" CommandName="Sort" CommandArgument="Division">Division
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton7" CommandName="Sort" CommandArgument="Section">Section
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton5" CommandName="Sort" CommandArgument="dept">Department
                                                </asp:LinkButton>
                                            </th>

                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton1" CommandName="Sort" CommandArgument="strProName">Product
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton6" CommandName="Sort" CommandArgument="Brand">Brand
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="SortByName" CommandName="Sort" CommandArgument="price">Specified Price
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton2" CommandName="Sort" CommandArgument="lprice">List Price
                                                </asp:LinkButton>
                                            </th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton3" CommandName="Sort" CommandArgument="Weight">Weight
                                                </asp:LinkButton>
                                            </th>
                                            <th>Picture
                                            </th>

                                            <th>Out of Stock
                                            </th>

                                            <th>&nbsp;
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="tableactions">
                                    <asp:HiddenField ID="hdnChk" runat="server" Value="" />
                                    <asp:DropDownList ID="drpActions" runat="server" Style="width: 110px;">
                                        <asp:ListItem Text="Select Action" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Make Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="Make Inactive" Value="InActive"></asp:ListItem>
                                        <%-- <asp:ListItem Text="Delete" Value="Delete"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <asp:Button ID="btnAction" OnClick="btnAction_Click" ValidationGroup="valAction"
                                        class="submit tiny" Text="Apply to selected" runat="server" />
                                    <asp:CompareValidator ID="CompareValidator1" class="note error" ValidationGroup="valAction"
                                        ErrorMessage="select any action !" ControlToValidate="drpActions" Display="Dynamic"
                                        ValueToCompare="0" Operator="NotEqual" runat="server" />
                                </div>
                                <div class="pagination right">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False"
                                                ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="active" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="False"
                                                ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
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
     <div class="main" runat="server" visible="false" id="dvAded">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div id="Div1" class="widget">
                            <div class="widget-content">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="border: none;">
                                             <h2 id="h2Title" runat="server">Edit Product</h2>
                                        </td>
                                       <td style="float: right; border: none;">
                                            <h3>
                                                <a href="ProductItemManage.aspx"> <img style="vertical-align: middle;" src="images/addIcon.gif">List Product</a></h3>
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
                        <table style="width: 100%; margin-left: 20px; margin-top: 20px;" class="clsDataEnter">
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Product :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Width="300px" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="rfvProduct" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="Product Name is required" ForeColor="Red" ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 160px">
                                    <label>
                                        Division:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpddivisin" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator2" ErrorMessage="Select Any Division" ControlToValidate="dpddivisin"
                                        Text="*" ValueToCompare="0" Operator="NotEqual" runat="server" ValidationGroup="vgSave" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Section:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdSec" AutoPostBack="true" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator4" ErrorMessage="Select Any Section" ControlToValidate="dpdSec"
                                        Text="*" ValueToCompare="0" Operator="NotEqual" runat="server" ValidationGroup="vgSave" />
                                </td>

                                <td style="width: 160px">
                                    <label>
                                        Department:</label>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dpdDept" DataTextField="strCategoryName" DataValueField="bintCategoryId">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="CompareValidator3" ErrorMessage="Select Any Department" ControlToValidate="dpdDept"
                                        Text="*" ValueToCompare="0" Operator="NotEqual" runat="server" ValidationGroup="vgSave" />
                                </td>

                            </tr>
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
                                <td style="width: 160px">
                                    <label>
                                        Stock :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtStock" runat="server" class="text small"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Specified Price :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" class="text small"></asp:TextBox>
                                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="txtPrice" ErrorMessage="Price is required" ForeColor="Red"
                                        ValidationGroup="vgSave">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 160px">
                                    <label>
                                        List Price :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtlPrice" runat="server" Text="0" class="text small"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Barcode :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbarcode" runat="server" class="text small"></asp:TextBox>

                                </td>
                                <td style="width: 160px">
                                    <label>
                                        Standard Barcode :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtsbar" runat="server" Text="0" class="text small"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Weight :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtweight" runat="server" class="text small"></asp:TextBox>
                                    (ex. 250 gm)
                                </td>

                                <td style="width: 160px">
                                    <label>
                                        Display Order :</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOrder" runat="server" Text="0" class="text small"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtOrder"
                                        FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label>
                                        Display On Home :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox
                                            Text="" ID="chkDisHom" runat="server" />
                                    <br />
                                    <br />
                                    <label>
                                        Is Special :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox Text=""
                                            ID="chkSpecial" runat="server" />
                                    <br />
                                    <br />
                                    <label>
                                        Out of Stock :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox Text=""
                                            ID="chkOut" runat="server" />
                                </td>
                                <td style="width: 160px">
                                    <label>
                                        Picture:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="imgupload" runat="server" />
                                    <br />
                                    <img runat="server" id="imgedit" style="width: 100px;" />
                                    <asp:HiddenField runat="server" ID="hdnedit" Value="" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Descripation:</label>
                                </td>
                                <td colspan="3">
                                    <CKEditor:CKEditorControl ID="txtDesc" Width="800px" Height="200px" runat="server"></CKEditor:CKEditorControl>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 160px">
                                    <label>
                                        Specification:</label>
                                </td>
                                <td colspan="3">
                                    <CKEditor:CKEditorControl ID="txtSpec" Width="800px" Height="200px" runat="server"></CKEditor:CKEditorControl>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
        SelectCommand="[dbo].[ProductListadmin]" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() == undefined) {
                bindCheckbox();
            }
        }
        bindCheckbox();
    </script>
</asp:Content>
