<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.vb" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <script src="<%= app.Value("siteUrl") %>js/ProductDtl.js" type="text/javascript"></script>
     <script type="text/javascript">

         function ImgError(source) {
             source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=140X180";
             source.onerror = "";
             return true;
         }
         function onlyNumbers(evt, obj) {
             var charCode = (evt.which) ? evt.which : event.keyCode
             //alert(charCode);
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                 return false;

             if (charCode != "8") {
                 //alert(obj.value);
                 if (obj.value == "") {
                     if (charCode == 48) {
                         //alert('Please enter Quantity greater then 0');

                         return false;

                     }
                 }
             }

             return true;

         }
    </script>
       <asp:Literal Text="" ID="ltrlMeta" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>
    
       
               <ul class="pageNav cf">
                   <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
                   <li><span id="liMain" runat="server" visible="false"></span></li>
                   <li><span id="liSub" runat="server"></span></li>
                   <li><span id="lisubSub" runat="server"></span></li>
               </ul>
               <br />
               <h1 id="h2Header" runat="server"><span>Welcome to</span> Rajkot Supermarket</h1>
     <div class="sitebar">

        

        <h4>Filter By Brands</h4>
        <ul class="filterList cf">
            <asp:Panel ID="Panel1"   runat="server" border="1px" ScrollBars="Auto">
                <asp:CheckBoxList runat="server" CssClass="checkbox"  Font-Size="11px" ForeColor="#676768" OnSelectedIndexChanged="ChkboxCat_CLick" AutoPostBack="true" DataTextField="Data"
                    DataValueField="brandid" ID="CheckBoxList1" CellSpacing="2">
                </asp:CheckBoxList>
            </asp:Panel>
        </ul>



    </div>
     <div class="rightCon">
               <div class="botBar cf">

                   <dd class="pagination">
                       <asp:DataPager ID="DataPager2" PagedControlID="ListView1" runat="server" PageSize="20">
                           <Fields>
                               <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowFirstPageButton="True"
                                   ShowNextPageButton="False" ShowPreviousPageButton="False" />
                               <asp:NumericPagerField CurrentPageLabelCssClass="current" NumericButtonCssClass="" />
                               <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowLastPageButton="True"
                                   ShowNextPageButton="False" ShowPreviousPageButton="False" />
                           </Fields>
                       </asp:DataPager>
                   </dd>
                   <%--<span>of  <span id="spnLast"
            runat="server"></span></span>
        <span id="spnCurent" runat="server"></span>
        <label>Page</label>--%>
               </div>




               <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintproductid" DataSourceID="SqlDataSource2"
                   EnableModelValidation="True" OnDataBound="ListView1_DataBound">
                   <EmptyDataTemplate>
                       <div style="border: 1px solid #CCCCCC; color: #778490; font-size: 17px; font-weight: 600; padding: 49px; width: 646px;">
                           No Product found in this Filter.
                       </div>
                   </EmptyDataTemplate>
                   <ItemTemplate>
                       <li>

                           <a href="<%= app.Value("siteUrl") %>Product/<%# Eval("ProductUrl") %>" class="thisPro">
                               <span class="proPic">
                                      <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("strImage") %>&D=120X180" onerror="ImgError(this);" ></span>
                               <span class="barandName"><%# Eval("brandURL") %></span>
                               <center><%# Eval("strproname")%></center>
                           </a>




                            <div class="thisDeta cf">
                            <span class="pirse">Rs. <%# Eval("price") %></span>
                            <label class="qut">Qty<input name="1" value="1" onkeypress="return onlyNumbers(event,this);" class="clsQty" type="text"></label>
                         <%--   <a href="javascript:void(0)" class="addQut">ADD</a>--%>
                            <input type="button" value="BUY NOW" class="addQut btn"
                                bookid='<%# Eval("bintProductId") %>' />
                        </div>
                       </li>

                   </ItemTemplate>
                   <LayoutTemplate>

                       <ul class="proList cf">
                           <li id="itemPlaceholder" runat="server"></li>
                       </ul>

                   </LayoutTemplate>
               </asp:ListView>
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
                   SelectCommand="[ProductListByCategoryUrlfront]" SelectCommandType="StoredProcedure">
                   <SelectParameters>
                       <asp:QueryStringParameter Name="url" QueryStringField="url1" Type="String" />
                   </SelectParameters>
               </asp:SqlDataSource>




               <div class="botBar cf">
                   <dd class="pagination">
                       <asp:DataPager ID="DataPager1" PagedControlID="ListView1" runat="server" PageSize="20">
                           <Fields>
                               <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowFirstPageButton="True"
                                   ShowNextPageButton="False" ShowPreviousPageButton="False" />
                               <asp:NumericPagerField CurrentPageLabelCssClass="current" NumericButtonCssClass="" />
                               <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowLastPageButton="True"
                                   ShowNextPageButton="False" ShowPreviousPageButton="False" />
                           </Fields>
                       </asp:DataPager>
                   </dd>
                   <%-- <span>of  <span id="spnLast1"
            runat="server"></span></span>
        <span id="spnFirst1" runat="server"></span>
        <label>Page</label>--%>
               </div>
           </div>
    <div class="an"></div>
                <div class="jquery-notify-bar hide" id="dvNotify" ><span class="notify-bar-text-wrapper"></span></div>
     <div class="show_dis hide" style="display: block;">
        <div class="tiv_div_outer">
            <div class="tipContent">
                <a href="javascript: void(0)" class="closepop">X</a>
                <div class="product_dis_bookname2">
                    Item added to your basket</div>
              
                <br />
                <p class="clsMsgPopup">
                </p>
                <div class="product_dis_cart2">
                    <div>
                        <a href="<%= app.Value("siteUrl") %>cart.aspx" style="text-decoration: none;">
                            <input type="button" value="View Cart Details" class="buttonC" />
                        </a>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

