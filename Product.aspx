<%@ Page Title="" Language="VB" MasterPageFile="~/MainChild.master" AutoEventWireup="false" CodeFile="Product.aspx.vb" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">

         function ImgError(source) {
             source.src = "http://rajkotsupermarket.com/IHandlers.ashx?P=kymnoimage.jpg&D=140X180";
             source.onerror = "";
             return true;
         }
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     </div>
    

    <ul class="pageNav cf">
        <li class="noBg"><a href="<%= app.Value("siteUrl") %>">Home</a></li>
        <li><span id="liMainCat" runat="server"></span></li>
           <li><span id="liSubCat" runat="server"></span></li>
    </ul>
     <br />
    <h1 id="h2Header" runat="server"><span>Welcome to</span> Rajkot Supermarket</h1>
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
       <%-- <span>of  <span id="spnLast"
            runat="server"></span></span>
        <span id="spnCurent" runat="server"></span>
        <label>Page</label>--%>
    </div>
   
           
         
        
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="bintCategoryId"  
        EnableModelValidation="True" OnDataBound="ListView1_DataBound">
        <EmptyDataTemplate>
            <div style="border: 1px solid #CCCCCC; color: #778490; font-size: 17px; font-weight: 600; padding: 49px; width: 646px;">
                No Product found in this Filter.
            </div>
        </EmptyDataTemplate>
        <ItemTemplate>
            <li>
                 
                <a href="<%= app.Value("siteUrl") %>Product/<%# Eval("ProductUrl") %>" class="thisPro" >
                    <span class="proPic">
                       <img src="<%= App.Value("siteUrl") %>IHandlers.ashx?P=userFiles/ProductImage/<%# Eval("strImage") %>&D=120X180" onerror="ImgError(this);" ></span>
                    <span class="barandName"><%# Eval("brandURL") %></span>
                <center><%# Eval("strproname")%></center>   
                </a>
              
                  
               
			<div class="thisDeta cf">
            	<span class="pirse">Rs. <%# Eval("price") %></span>
                <label class="qut">Qut<input name="1"  value="1" type="text"></label>
                <a href="javascript:void(0)" class="addQut">ADD</a>
            </div> 
            </li>
          
        </ItemTemplate>
        <LayoutTemplate>

            <ul class="proList cf">
                <li id="itemPlaceholder" runat="server"></li>
            </ul>

        </LayoutTemplate>
    </asp:ListView>
   <%-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineGroceryConnectionString %>"
        SelectCommand="[SubCategoryListByMainUrlFront]" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="url" QueryStringField="url" Type="String"    />
        </SelectParameters>
    </asp:SqlDataSource>--%>
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
        <%--<span>of  <span id="spnLast1"
            runat="server"></span></span>
        <span id="spnFirst1" runat="server"></span>
        <label>Page</label>--%>
    </div>

</asp:Content>

