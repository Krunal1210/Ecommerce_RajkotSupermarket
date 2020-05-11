<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Rajkot Supermarket Admin Login</title>
     <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="Admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Admin/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="Admin/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
    <link href="Admin/css/style.css" rel="stylesheet" type="text/css">
    <link href="Admin/css/pages/signin.css" rel="stylesheet" type="text/css">
    <style>
    body{ background: url(../admin/img/body-bg.png); color:#838383; font: 13px/1.7em 'Open Sans';}


.account-container {
	width: 380px; 
	display: block;
	margin: 60px auto 0 auto;
	
	background: #f9f9f9;
	
	border: 1px solid #d5d5d5;
	
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	box-shadow:  0px 0px 2px #dadada, inset 0px -3px 0px #e6e6e6;
}

.content {
	padding: 16px 28px 23px;
} 

.login-fields {
	
}

.login-fields .field {
	margin-bottom: 1.25em;
}

.login-fields label {
	display: none;
}

.login-fields input {
	font-family: 'Open Sans';
	font-size: 13px;
	color: #8e8d8d;
	padding: 11px 15px 10px 50px;
	background-color: #fdfdfd;
	width: 255px;
	display: block;
	margin: 0;
	box-shadow: inset 2px 2px 4px #f1f1f1;
}

.username-field { background: url(../admin/img/signin/user.png) no-repeat; }

.password-field { background: url(../admin/img/signin/password.png) no-repeat; }




.login-actions {
	float: left;
	
	width: 100%;
	
	margin-top: -1em;
	margin-bottom: 1.25em;
}

.login-social {
	float: left;
	
	padding: 10px 0 15px;
	
	border: 1px dotted #CCC;
	border-right: none;
	border-left: none;	
}

span.login-checkbox {
	float: left;
	margin-top: 31px;
}

span.login-checkbox > input[type='checkbox'] {
    opacity: 0;
    float: left;
    width: 15px;
}

span.login-checkbox > input[type='checkbox'] + label {    
    clear: none;
    
	height: 15px; 
	display: block;
    padding: 0 0 0 22px;
    margin: 0;
    
    font-size: 12px;
    line-height: 1.2em;
    
    background: url(../admin/img/signin/check.png) no-repeat 0 0;
    
    cursor: pointer;
}

span.login-checkbox > input[type='checkbox']:checked + label {	
	background-position: 0 -15px;
}

/** Text Under Box**/
.login-extra {
	display: block; 
	width: 300px; 
	margin: 1.5em auto;
	 
	text-align: left;
	line-height: 19px; 
	
	text-shadow: 1px 1px 0px #fff; 	
}


.account-container h1 {
	margin-bottom: .4em;
	
	color: #525252;
}

/** Buttons **/
.twitter, .fb {
	position: relative;
	
	height: 32px; 
	width: 157px; 
	display: block;
	
	background: url(../admin/img/signin/twitter_btn.png) no-repeat; 
	
}

.fb {
	width: 162px; 
	
	background: url(../admin/img/signin/fb_btn.png) no-repeat; 	
}

.twitter:active, .fb:active {
	top: 1px;
}

.twitter:hover, .fb:hover {
	background-position: 0 -32px;
}

.twitter a, .fb a {
	padding: 5px 0 0 35px; 
	text-shadow: -1px -1px 0px rgba(0,0,0,.3); 
	color:#fff; 
	font-weight: bold; 
	font-size: 11px; 
	height: 32px; 
	display: block;	
}

.fb a {
	padding: 5px 0 0 31px; 
	
}

.twitter, .fb {
	display: inline-block;
}

.twitter a:hover, .fb a:hover {
	color: #FFF;
	text-decoration: none;
}

.button {-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; display: inline-block; float: right; margin-top: 18px;}






.register .login-social {
	margin-bottom: 1em;
}

.register .login-actions {
	margin-bottom: 0;
}

.register .login-fields input {
	width: 299px;
	padding-left: 6px;
}

.register h1 {
	color: #444;
}

.register span.login-checkbox {
	position: relative;
	top: -6px;
	
	width: 200px;
}

.register span.login-checkbox > input[type="checkbox"] + label {
	
	position: relative;
	
	line-height: 1.3em;
}



@media (max-width: 480px) {
	
	.account-container {
		width: 280px;	
		margin-top: 35px;
	}
	
	.login-fields input {
		width: 160px;
	}
	
	.login-social {
		width: 100%;
	}
	
	.twitter {
		display: block;
		margin-bottom: 1em;
	}
	
	.register .login-fields input {
		width: 204px;
		padding-left: 6px;
	}
	
}
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </a><a class="brand" href="#">Rajkot Supermarket Admin Login </a>
                <div class="nav-collapse">
                    <ul class="nav pull-right">
                        <%--<li class="">						
						<a href="signup.html" class="">
							Don't have an account?
						</a>
						
					</li>
					
					<li class="">						
						<a href="index.html" class="">
							<i class="icon-chevron-left"></i>
							Back to Homepage
						</a>
						
					</li>--%>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!-- /container -->
        </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->
    <div class="account-container">
        <div class="content clearfix">
            <form action="#" method="post">
            <h1>
                Administrator Login</h1>
            <div class="login-fields">
                <p>
                    Please provide your details</p>
                <div class="field">
                    <label for="username">
                        Username</label>
                    <asp:TextBox ID="txtUserName" runat="server" class="login username-field"></asp:TextBox>
                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtUserName" Style="padding-left: 133px;" ErrorMessage="username is required"></asp:RequiredFieldValidator>
                    <%--<input type="text" id="username" name="username" value="" placeholder="Username" class="login username-field" />--%>
                </div>
                <!-- /field -->
                <div class="field">
                    <label for="password">
                        Password:</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="login password-field"></asp:TextBox>
                    <asp:RequiredFieldValidator class="note error" ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtPassword" Style="padding-left: 133px;" ErrorMessage="password is required"></asp:RequiredFieldValidator>
                    <%--<input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>--%>
                </div>
                <!-- /password -->
            </div>
            <!-- /login-fields -->
            <div class="login-actions">
                <span class="login-checkbox">
                    
                    <input   name="Field"  ID="chkRememberMe" runat="server" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>
                </span>
                <asp:Button ID="btnLogin" runat="server" class="button btn btn-success btn-large"
                    Text="Sign In" />
                <%--<button class="button btn btn-success btn-large">Sign In</button>--%>
            </div>
            <!-- .actions -->
            </form>
        </div>
        <!-- /content -->
    </div>
    <!-- /account-container -->
    <div class="login-extra">
        <div id="divMsg" runat='server'>
        </div>
        <p>
            <small>If you face any problem with login please contact <a href="mailto:support@whitepearl.biz">
                support@whitepearl.biz</a>.</small></p>
    </div>
    <!-- /login-extra -->
    
    </form>
</body>
</html>
