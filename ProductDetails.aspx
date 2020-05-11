<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master"
    AutoEventWireup="true" CodeFile="ProductDetails.aspx.vb" Inherits="Product" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="<%= app.Value("siteUrl") %>js/Product.js" type="text/javascript"></script>
    <script type="text/javascript">

        function ImgError(source) {
            source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=250X250";
            source.onerror = "";
            return true;
        }
        function ImgError1(source) {
            source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=120X180";
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



    <asp:Literal Text="" ID="ltrlMetaData" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>

     
    <asp:Repeater runat="server" ID="rptrProductDetail">
        <ItemTemplate>
            <ul class="pageNav cf">
                <li class="noBg"><a href="<%= App.Value("siteUrl") %>">Home</a></li>
              <%--  <li><a href="<%= App.Value("siteUrl") %>Categories/<%# Eval("Divurl")%>"><%# Eval("DivNm")%></a></li>--%>
                <li><a href="<%= App.Value("siteUrl") %>Category/<%# Eval("Securl")%>"><%# Eval("SecNm")%></a></li>
                <li><a href="<%= App.Value("siteUrl") %>SubCategory/<%# Eval("Securl")%>/<%# Eval("Depurl")%>"><%# Eval("DepNm")%></a></li>
                <li><%# Eval("strproname")%></li>
            </ul>
            <h1 id="h2ProductName" runat="server"><%# Eval("strproname")%></h1>
            <div class="productViwe cf">

                <div class="proBigPic">
                    <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("strImage") %>&D=333X300" alt="" onerror="ImgError(this);">
                </div>

                <div class="proInfo">
                    <%--  <div class="compnyName"><a href="<%= App.Value("siteUrl") %>Brand/<%# Eval("BrandUrl") %>"><%# Eval("BrandName")%></a></div>--%>
                    <h2><%# Eval("strproname")%></h2>
                    <div class="proPrice">Rs. <%# Eval("price")%></div>
                    <label class="qut">Qty<input name="1" value="1" onkeypress="return onlyNumbers(event,this);" class="clsQty" type="text"></label>
                    <input type="button" value="BUY NOW" class="addQut btn"
                        bookid='<%# Eval("bintProductId") %>' />
                    <br />
                    <div class="compnyName" style="margin-top: 26px;">
                        Weight * : <%# Eval("weight")%>
                    </div>
                    <p>
                        <%# Eval("strDesc")%>

                        <br />
                        <%# Eval("strSpecification")%>
                    </p>

                    <%-- <label>
                    <input name="" type="text" class="inputBox"></label><br>
                <label>
                    <textarea name="" cols="" rows="" class="textareaBox"></textarea></label><br>
                <label>
                    <select name="" class="selectBox">
                        <option>200 gm Carton</option>
                        <option>300 gm Carton</option>
                        <option>500 gm Carton</option>
                    </select>
                </label>
                <label>
                    <input name="" type="button" value="Button" class="button"></label>--%>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>



    <h1 id="h2Related" runat="server">Rajkot Supermarket</h1>

    <asp:ListView ID="dtlstRelatedProduct" runat="server" DataKeyNames="bintCategoryId"
        EnableModelValidation="True">
        <EmptyDataTemplate>
            <div style="border: 1px solid #CCCCCC; color: #778490; font-size: 17px; font-weight: 600; padding: 49px; width: 646px;">
                No Product found in this Filter.
            </div>
        </EmptyDataTemplate>
        <ItemTemplate>
           <li>

                           <a href="<%= app.Value("siteUrl") %>Product/<%# Eval("ProductUrl") %>" class="thisPro">
                               <span class="proPic">
                              <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("strImage") %>&D=120X180" onerror="ImgError1(this);" ></span>
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
