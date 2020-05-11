<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master" AutoEventWireup="false" CodeFile="MainCategory.aspx.vb" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="<%= app.Value("siteUrl") %>js/Product.js" type="text/javascript"></script>
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
        <li><span id="liHome" runat="server"></span></li>
    </ul>
    <br />
    <h1 id="h2Header" runat="server"><span>Welcome to</span> Rajkot Supermarket</h1>
    <div class="an"></div>

    <div class="sitebar">

        <h4>Filter By category</h4>
        <ul class="filterList cf">
            <asp:panel id="Panel2" runat="server" border="1px" scrollbars="Auto">
                <asp:CheckBoxList runat="server" CssClass="checkbox" Font-Size="11px" OnSelectedIndexChanged="ChkboxCat_CLick" ForeColor="#676768" AutoPostBack="true" DataTextField="Data"
                    DataValueField="bintCategoryId" ID="chkCat" CellSpacing="2">
                </asp:CheckBoxList>
            </asp:panel>
        </ul>

        <h4>Filter By Brands</h4>
        <ul class="filterList cf">
            <asp:panel id="Panel1" runat="server" border="1px" scrollbars="Auto">
                <asp:CheckBoxList runat="server" CssClass="checkbox"  Font-Size="11px" ForeColor="#676768" OnSelectedIndexChanged="ChkboxCat_CLick" AutoPostBack="true" DataTextField="Data"
                    DataValueField="brandid" ID="CheckBoxList1" CellSpacing="2">
                </asp:CheckBoxList>
            </asp:panel>
        </ul>



    </div>
    <div class="rightCon">
        <div class="botBar cf">



            <dd class="pagination">
                <asp:datapager id="DataPager2" pagedcontrolid="ListView1" runat="server" pagesize="20">
                    <Fields>

                        <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowFirstPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField CurrentPageLabelCssClass="current" NumericButtonCssClass="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowLastPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:datapager>
            </dd>

            <%--  <span>of  <span id="spnLast"
            runat="server"></span></span>
        <span id="spnCurent" runat="server"></span>
        <label>Page</label>--%>
        </div>




        <asp:listview id="ListView1" runat="server" datakeynames="bintproductId" datasourceid="SqlDataSource2"
            enablemodelvalidation="True">
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
        </asp:listview>
        <asp:sqldatasource id="SqlDataSource2" runat="server" connectionstring="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
            selectcommand="[ProductListByDivisionUrlfront]" selectcommandtype="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="url" QueryStringField="url" Type="String" />
            </SelectParameters>
        </asp:sqldatasource>
        <%-- <ul class="proList cf">
        <li>
            <a href="#" class="thisPro">
                <span class="proPic">
                    <img src="images/porList.jpg"></span>
                <span class="barandName">AMUL</span>
                Butter - Pasteurized
            </a>

            <%--<select name="" class="select">
        	  <option>200 gm Carton</option>
        	  <option>300 gm Carton</option>
        	  <option>500 gm Carton</option>
        	</select>
			<div class="thisDeta cf">
            	<span class="pirse">Rs. 44.00</span>
                <label class="qut">Qut<input name="" type="text"></label>
                <a href="#" class="addQut">ADD</a>
            </div> 
        </li>

    </ul>--%>



        <div class="botBar cf">
            <dd class="pagination">
                <asp:datapager id="DataPager1" pagedcontrolid="ListView1" runat="server" pagesize="20">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowFirstPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField CurrentPageLabelCssClass="current" NumericButtonCssClass="" />
                        <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nextprev" ShowLastPageButton="True"
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:datapager>
            </dd>
            <%--   <span>of  <span id="spnLast1"
            runat="server"></span></span>
        <span id="spnFirst1" runat="server"></span>
        <label>Page</label>--%>
        </div>
    </div>
    <div class="an"></div>


    <div class="jquery-notify-bar hide" id="dvNotify"><span class="notify-bar-text-wrapper"></span></div>

</asp:Content>

