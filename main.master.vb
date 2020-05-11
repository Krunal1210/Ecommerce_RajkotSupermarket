Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.Net.Mail


Partial Class main
    Inherits System.Web.UI.MasterPage

#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            '  bindTopMenu()
            bindPageBottomMenu()
            bindBasket()
            bindMainCat()
            bindTopX()
            app.WebsiteVisited()
            bindWebStatistics()
            bindLoginStatus()
            bindBanner()

        End If

    End Sub



#End Region


#Region "Functions"
    Private Sub bindBasket()

        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strSessionId", app.getCurrentSession())

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then
            tdItemInCart.InnerHtml = " " + Convert.ToString(dt.Rows(0)("intTotalItem")) + " Item(s)"

            If Convert.ToString(dt.Rows(0)("intTotalItem")) = "" Then
                tdItemInCart.InnerHtml = " 0 Item(s)"

            End If
        Else
            tdItemInCart.InnerHtml = " 0 Item(s)"

        End If



    End Sub
    Private Sub bindBanner()

        ' banner
        Dim dtf As DataTable = sqlHelper.getDataTable("[BannerListFront]", CommandType.StoredProcedure)

        rptrHomBaner.DataSource = dtf
        rptrHomBaner.DataBind()



    End Sub



    Private Sub bindPageBottomMenu()

        Dim strBuild As New StringBuilder(String.Empty)

        Dim dt As DataTable = sqlHelper.getDataTable("GetOnPageBottomMenuFront", CommandType.StoredProcedure)
        strBuild.Append(" <ul class=""cf"">")
        strBuild.Append("<li><a href=" + app.Value("siteUrl") + ">Home</a> </li>")
        For Each dr As DataRow In dt.Rows

            If Convert.ToString(dr("strPageType")) = "Link" Then
                strBuild.Append("<li><a href=""" + Convert.ToString(dr("strLink")) + """>" + Convert.ToString(dr("strPageName")) + "</a> </li>")
            ElseIf Convert.ToString(dr("strPageType")) = "TopMenu" Then
                strBuild.Append("<li><a href=""#"">" + Convert.ToString(dr("strPageName")) + "</a> </li>")
            Else
                strBuild.Append("<li><a href=""" + app.Value("siteUrl") + "Pages/" + Convert.ToString(dr("strPageUrl")) + """>" + Convert.ToString(dr("strPageName")) + "</a> </li>")
            End If



        Next
        strBuild.Append("</ul>")
        ltrlPageBottom.Text = strBuild.ToString().Trim().Trim("|")
        'tdBottom.InnerHtml = strBuild.ToString().Trim().Trim("|")

    End Sub

    Private Sub bindWebStatistics()

        Dim dtStatistics As DataTable = app.WebSettingList()
        If dtStatistics.Rows.Count > 0 Then

            'spnLastUpdate.InnerHtml = Convert.ToDateTime(dtStatistics.Rows(0)("dateLastUpdate")).ToShortDateString()
            'spnTotalVisitors.InnerHtml = Convert.ToString(dtStatistics.Rows(0)("intNoVisitors"))

        End If



    End Sub

#End Region

    Private Function getProductCode() As String

        Dim strBuild As New StringBuilder(String.Empty)

        'some code to append product category starts

        Dim prodDt As DataTable = sqlHelper.getDataTable("[dbo].[BrandMasterListFront]", CommandType.StoredProcedure)
        strBuild.Append("<ul>")

        Dim dvProdDt As DataView = prodDt.DefaultView



        For Each r As DataRow In dvProdDt.ToTable().Rows
            strBuild.Append("<li><a href=""" + app.Value("siteUrl") + "Brand/" + Convert.ToString(r("strUrl")) + """>" + Convert.ToString(r("strName")) + "</a>")

            'check for nested products start

            'Dim dvNestdProd As DataView = prodDt.DefaultView
            'dvNestdProd.RowFilter = "parentId = " + Convert.ToString(r("bintCategoryId"))

            'If dvNestdProd.Count > 0 Then

            '    strBuild.Append("<ul>")

            '    For Each r1 As DataRow In dvNestdProd.ToTable().Rows
            '        strBuild.Append("<li><a href=""" + app.Value("siteUrl") + "Product.aspx?cat=" + Convert.ToString(r1("bintCategoryId")) + """>" + Convert.ToString(r1("strCategoryName")) + "</a></li>")
            '    Next

            '    strBuild.Append("</ul>")

            'End If

            'check for nested product ends

            strBuild.Append("</li>")
        Next
        strBuild.Append("</ul>")
        'some code to append product category ends

        Return strBuild.ToString()

    End Function

    Private Sub bindLoginStatus()

        If loginclass.isClientLogin() Then
            spnUsername.InnerHtml = "Hello " + loginclass.getCleintName() + " !"
            tdLogin.Visible = True
            tdNotLogin.Visible = False

        Else
            tdLogin.Visible = False
            tdNotLogin.Visible = True

        End If


    End Sub





    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click

        loginclass.getlogoutCLient()

        Response.Redirect("~/Default.aspx")

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim str As String = loginclass.getCustomerLogin(txtEmail.Text, txtPassword.Text, 1)

        If str = "Valid" Then

            Response.Redirect("~/Default.aspx")

        Else

            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Invalid username or password');", True)

        End If


    End Sub

    Protected Sub btnReg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReg.Click
        Response.Redirect("~/Registration.aspx")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton1.Click
        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strEmailId", txtforgotemail.Text.Trim())

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[RecoverPassword]", spar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then
            'send mail
            Dim strMsg As String, strSubject As String = ""
            strMsg = app.getEmailTemplate("RecoverPassword", strSubject)

            strMsg = strMsg.Replace("[[Name]]", Convert.ToString(dt.Rows(0)("strFirstName")))
            strMsg = strMsg.Replace("[[Email]]", Convert.ToString(dt.Rows(0)("strEmailAddress")))
            strMsg = strMsg.Replace("[[Password]]", Convert.ToString(dt.Rows(0)("strPassword")))
            Dim cc As String = "niravkasundra@gmail.com"
            'Dim extra As String = "shrikant@whitepearl.biz"


            app.SendMail(Convert.ToString(dt.Rows(0)("strEmailAddress")), "Rajkot Supermarket - Password Recovery", strMsg)


            app.SendMail(cc, "Rajkot Supermarket - Password Recovery", strMsg)
            Page.ClientScript.RegisterStartupScript([GetType](), "msgbox", "alert('Sent Email with password on your mail Id');", True)
        Else


            Page.ClientScript.RegisterStartupScript([GetType](), "msgbox", "alert('Not register yet this email Id');", True)
        End If
    End Sub


    Protected Sub lnkSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkSearch.Click
        If txtSearch.Text <> "" Then
            Response.Redirect("http://rajkotsupermarket.com/Search.aspx?url=" & txtSearch.Text.Trim)
        Else
            txtSearch.Focus()
        End If

    End Sub

    Protected Sub txtSearch_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSearch.TextChanged
        If txtSearch.Text <> "" Then
            Response.Redirect("http://rajkotsupermarket.com/Search.aspx?url=" & txtSearch.Text.Trim)
        Else
            txtSearch.Focus()
        End If
    End Sub

    Private Sub bindMainCat()


        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[SubCategoryListFrontNew]", CommandType.StoredProcedure)
        rptrMainCat.DataSource = dt
        rptrMainCat.DataBind()
    End Sub

    Protected Sub rptrMainCat_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rptrMainCat.ItemDataBound


        Dim rptrBrand As Repeater = DirectCast(e.Item.FindControl("rptrSub"), Repeater)
        Dim hdn As HiddenField = DirectCast(e.Item.FindControl("hndMainCat"), HiddenField)

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@bintCategoryId", hdn.Value)

        Dim dtbran As DataTable = sqlHelper.getDataTable("[SubCategoryListByMainIdFront]", sqlpar, CommandType.StoredProcedure)

        rptrBrand.DataSource = dtbran
        rptrBrand.DataBind()

    End Sub

    'Protected Sub BindProductItm(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs)

    '    Try

    '        Dim rptrBrand As Repeater = DirectCast(e.Item.FindControl("rtpSuSUb"), Repeater)
    '        Dim hdn As HiddenField = DirectCast(e.Item.FindControl("hndSubCat"), HiddenField)

    '        Dim sqlpar(0) As SqlParameter
    '        sqlpar(0) = New SqlParameter("@bintCategoryId", hdn.Value)

    '        Dim dtbran As DataTable = sqlHelper.getDataTable("[SubCategoryListByMainIdFront]", sqlpar, CommandType.StoredProcedure)

    '        rptrBrand.DataSource = dtbran
    '        rptrBrand.DataBind()

    '    Catch ex As Exception

    '    End Try
    'End Sub

    '----------------Top Extra Menu-----------------

    Private Sub bindTopX()


        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[GroupMstrListDrpdnFront]", CommandType.StoredProcedure)
        rptrMainTopExmenu.DataSource = dt
        rptrMainTopExmenu.DataBind()
    End Sub
    Protected Sub rptrMainTopExmenu_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rptrMainTopExmenu.ItemDataBound


        Dim rptrSubXmenu As Repeater = DirectCast(e.Item.FindControl("rptrSubXmenu"), Repeater)
        Dim hdnTopX As HiddenField = DirectCast(e.Item.FindControl("hdnTopX"), HiddenField)

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@bintGroupId", hdnTopX.Value)

        Dim dtbran As DataTable = sqlHelper.getDataTable("[sectionMstrListDrpdnFront]", sqlpar, CommandType.StoredProcedure)

        rptrSubXmenu.DataSource = dtbran
        rptrSubXmenu.DataBind()

    End Sub
End Class

