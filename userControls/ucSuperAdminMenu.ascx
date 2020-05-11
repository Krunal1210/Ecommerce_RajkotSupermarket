<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ucSuperAdminMenu.ascx.vb"
    Inherits="userControls_ucSchoolMenu" %>
<ul id="main-nav">
    <li><a id="aHome" runat="server" class="nav-top-item no-submenu" href="../SuperAdmin/home.aspx">
        Home</a></li>
    <li><a id="aMaster" runat="server" class="nav-top-item" href="javascript:">Master</a>
        <ul>
            <li><a id="aCldDistrictList" runat="server" href="../SuperAdmin/DistrictList.aspx">District</a></li>
            <li><a id="aCldTalukaList" runat="server" href="../SuperAdmin/TalukaList.aspx">Taluka</a></li>
            <li><a id="aCldCityList" runat="server" href="../SuperAdmin/CityList.aspx">City</a></li>
            <li><a id="aCldAreaList" runat="server" href="../SuperAdmin/AreaList.aspx">Area</a></li>
            <li><a id="aCldCategoryList" runat="server" href="../SuperAdmin/CategoryList.aspx">Category</a></li>
            <li><a id="aCldSubCategoryList" runat="server" href="../SuperAdmin/SubCategoryList.aspx">
                SubCategory</a></li>
      
            <li><a id="aAmenity" runat="server" href="../SuperAdmin/AmenityList.aspx">Amenity</a></li>
             <li><a id="aAreaType" runat="server" href="../SuperAdmin/AreaTypeList.aspx">AreaType</a></li>
             <li><a id="aZone" runat="server" href="../SuperAdmin/ZoneList.aspx">Zone</a></li>
        </ul>
    </li>
    <li><a id="aCldCustomerList" runat="server" class="nav-top-item no-submenu" href="../SuperAdmin/CustomerList.aspx">
        Customer</a></li>
    <li><a id="aTransaction" runat="server" class="nav-top-item" href="javascript:">
        Transaction</a>
        <ul>
            <li><a id="aProperty" runat="server" href="../SuperAdmin/PropertyList.aspx">Property</a></li>
        </ul>
    </li>
    <li><a id="aReports" runat="server" class="nav-top-item" href="javascript:">Reports</a>
        <ul>
            <li><a id="aHistorical" runat="server" href="../SuperAdmin/HistoricalProperty.aspx">Historical</a></li>
            <li><a id="aRentalProperties" runat="server" href="../SuperAdmin/RentalReports.aspx">Rental Properties</a></li>
            <li><a id="aReportProperties" runat="server" href="../SuperAdmin/ReportProperties.aspx">Report Properties</a></li>
        </ul>
    </li>
    <li><a id="aBroker" runat="server" class="nav-top-item" href="javascript:">Broker</a>
        <ul>
            <li><a id="abroProperty" runat="server" href="../SuperAdmin/Bro_PropertyList.aspx">Broker Property</a></li>
            <li><a id="abroHistorical" runat="server" href="../SuperAdmin/Bro_HistoricalProperty.aspx">Historical</a></li>
            <li><a id="abroRentalProperties" runat="server" href="../SuperAdmin/Bro_RentalReports.aspx">Rental Properties</a></li>
            <li><a id="abroReportProperties" runat="server" href="../SuperAdmin/Bro_ReportProperties.aspx">Report Properties</a></li>
        </ul>
    </li>
</ul>
