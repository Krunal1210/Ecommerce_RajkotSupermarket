<%@ Page Title="" Language="VB" MasterPageFile="~/admin/AdminMaster1.master" AutoEventWireup="false"
    CodeFile="Home.aspx.vb" Inherits="admin_SchoolList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .widget-content {
    background: none repeat scroll 0 0 #fff;
    border: 1px solid #d5d5d5;
    border-radius: 5px;
    min-height: 200px;
    padding: 20px 15px 15px;
}
#big_stats 
{ 
	width: 100%; 
	display: table;
	margin-top: 1.5em;
	
	
}

.big-stats-container .widget-content {
	border:0;
}

#big_stats .stat
{
	width: 25%;
	height: 90px;
	text-align: center;
	display: table-cell;
	padding: 0;
	position: relative;
	
	border-right: 1px solid #CCC;
	border-left: 1px solid #FFF;
}
#big_stats  i { font-size:30px; display:block; line-height: 40px; color:#b2afaa;}
#big_stats .stat:hover i {color:#7E71B1;}

h6.bigstats{margin: 20px;
border-bottom: 1px solid #eee;
padding-bottom: 20px;
margin-bottom: 26px;}

#big_stats .stat:first-child {
	border-left: none;
}

#big_stats .stat:last-child {
	border-right: none;
}

#big_stats .stat h4
{
	font-size: 11px;
	font-weight: bold;
	color: #777;
	margin-bottom: 1.5em;
}

#big_stats .stat .value
{
	font-size: 45px;
	font-weight: bold;
	color: #545454;
	line-height: 1em;
}



@media all and (max-width: 950px) and (min-width: 1px) {
	
	#big_stats {
		display: block;
		margin-bottom: -40px;
	}
	
	#big_stats .stat {
		width: 49%;
		display: block;
		margin-bottom: 3em;
		float: left;
	}	
	
	#big_stats .stat:nth-child(2) {
		border-right: none;
	}
	
	#big_stats .stat:nth-child(3) {
		border-left: none;
	}
	
}

@media (max-width: 767px) {
	#big_stats .stat .value {
		font-size: 40px;
	}
}
	
	
	
	
@media (max-width: 979px) {
	
	.shortcuts .shortcut {
		width: 31%;
	}
}


@media (max-width: 480px) {
	
	.stats .stat {
		
		margin-bottom: 3em;
	}
	
	.stats .stat .stat-value {
		margin-bottom: .15em;
		
		font-size: 20px;
	}
	
	.stats {
		float: left;
		
		display: block;
		
		margin-bottom: 0;
	}
	
	#chart-stats {
		margin: 2em 0 1em;		
	}
	
	.shortcuts .shortcut {
		width: 48%;
	}
}
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="span6">
                        <div class="widget">
                            <div class="widget-header">
                                <i class="icon-bookmark"></i>
                                <h3>
                                    Important Shortcuts</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <div class="shortcuts">
                                    <a href="ProductItemManage.aspx" class="shortcut"><i class="shortcut-icon icon-list-alt"></i>
                                        <span class="shortcut-label">Product</span> </a><a href="PageList.aspx" class="shortcut">
                                            <i class="shortcut-icon icon-file"></i><span class="shortcut-label">Pages</span>
                                        </a><a href="OrderList.aspx?Mode=S" class="shortcut"><i class="shortcut-icon icon-ok-circle"></i>
                                            <span class="shortcut-label">Success Order</span> </a><a href="OrderList.aspx?Mode=F" class="shortcut">
                                                <i class="shortcut-icon  icon-remove-sign"></i><span class="shortcut-label">Fail Order</span>
                                            </a><a href="CategoryList.aspx" class="shortcut"><i class="shortcut-icon icon-sitemap"></i><span
                                                class="shortcut-label">Category</span> </a><a href="CourierMaster.aspx" class="shortcut"><i
                                                    class="shortcut-icon icon-envelope-alt "></i><span class="shortcut-label">Courier</span>
                                    </a><a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-picture"></i>
                                        <span class="shortcut-label">Photos</span> </a><a href="javascript:;" class="shortcut">
                                            <i class="shortcut-icon icon-tag"></i><span class="shortcut-label">Tags</span>
                                    </a>
                                </div>
                                <!-- /shortcuts -->
                            </div>
                            <!-- /widget-content -->
                        </div>
                        <!-- /widget -->
                        <div class="widget">
                            <div class="widget-header">
                                <i class="icon-bar-chart"></i>
                                <h3>
                                    Bar Chart</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <canvas id="bar-chart" class="chart-holder" width="538" height="250">
                                </canvas>
                                <!-- /bar-chart -->
                            </div>
                            <!-- /widget-content -->
                        </div>
                        <!-- /widget -->
                    </div>
                    <!-- /span6 -->
                    <div class="span6">
                        <div class="widget widget-nopad">
                            <div class="widget-header">
                                <i class="icon-list-alt"></i>
                                <h3>
                                    Today's Stats</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <div class="widget big-stats-container">
                                    <div class="widget-content">
                                        <h6 class="bigstats">
                                           
                                            <a href="#" target="_blank"></a>
                                           Rajkot Supermarket All Status.</h6>
                                        <div id="big_stats" class="cf">
                                            <div class="stat">
                                                <i class="icon-anchor"></i><span class="value">851</span>
                                            </div>
                                            <!-- .stat -->
                                            <div class="stat">
                                                <i class="icon-thumbs-up-alt"></i><span class="value">423</span>
                                            </div>
                                            <!-- .stat -->
                                            <div class="stat">
                                                <i class="icon-twitter-sign"></i><span class="value">922</span>
                                            </div>
                                            <!-- .stat -->
                                            <div class="stat">
                                                <i class="icon-bullhorn"></i><span class="value">25%</span>
                                            </div>
                                            <!-- .stat -->
                                        </div>
                                    </div>
                                    <!-- /widget-content -->
                                </div>
                            </div>
                        </div>
                        <!-- /widget -->
                        <div class="widget">
                            <div class="widget-header">
                                <i class="icon-bar-chart"></i>
                                <h3>
                                    Line Chart</h3>
                            </div>
                            <!-- /widget-header -->
                            <div class="widget-content">
                                <canvas id="area-chart" class="chart-holder" width="538" height="250">
                                </canvas>
                                <!-- /line-chart -->
                            </div>
                            <!-- /widget-content -->
                        </div>
                    </div>
                    <!-- /span6 -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /main-inner -->
    </div>
</asp:Content>
